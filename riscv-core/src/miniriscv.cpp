//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1, sderrien@irisa.fr
//============================================================================

#include <stdio.h>
#include <string.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include "asm.h"
#include "rvi32.h"

#define MEMSIZE 0x10000

unsigned int uint32(int x) {
	return (unsigned int) x;
}

unsigned int addr32(unsigned int addr) {
	return (addr% MEMSIZE) >> 2 ;
}

unsigned long long cyclecnt = 0;

unsigned int tick() {
	return cyclecnt;
}

unsigned int byte_offset(unsigned int pc) {
	return (pc % 4);
}
#define ROM
#ifdef ROM
#include "rom.h"
#else
uint32_t memw[MEMSIZE / 4] = { 0 };
unsigned char mem0[MEMSIZE / 4] = { 0 };
unsigned char mem1[MEMSIZE / 4] = { 0 };
unsigned char mem2[MEMSIZE / 4] = { 0 };
unsigned char mem3[MEMSIZE / 4] = { 0 };
#endif;
unsigned int iomap[MEMSIZE] = { 0 };

#define NB_HBKPT 32
struct {
	unsigned int target;
	bool active;
} hbkpt[NB_HBKPT] = {
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false },
		{ 0, false },{ 0, false },{ 0, false },{ 0, false }
};

unsigned int x[32] = { 0, 0, 0, 0, 0 };
unsigned int csr[4096] = { 0 };
bool halted = false;
unsigned int pc;
unsigned int insncnt;


#ifdef __SYNTHESIS__

#define FFLUSH(...) 0
#define PRINTF(...) 0
#define EXIT(a) 0
void trace_io(unsigned int addr, unsigned int value) {
}

#else

#define EXIT(c) exit(c)

#define FFLUSH(...) {  fflush(__VA_ARGS__); }
#define PRINTF(...) { printf( __VA_ARGS__) ; fflush(stdout); }
#define FPRINTF(...) fprintf( __VA_ARGS__)

FILE *iotrace;
void trace_io(unsigned int addr, unsigned int value) {
	if (iotrace == NULL) {
		iotrace = fopen("iotrace.txt", "w");
		if (iotrace == NULL)
			exit(-2);
	}
	FPRINTF(iotrace, "%08X/%c\n", (char ) value, (char ) value);
	PRINTF("io[%08X]=%08X/%c\n", addr, (char ) value, (char ) value);
	FFLUSH(iotrace);
}
#endif

int cpu_load(uint32_t addr) {
	unsigned int data ;
	switch (addr%4) {
		case 0: data=mem0[addr32(addr)]; break;
		case 1: data=mem1[addr32(addr)]; break;
		case 2: data=mem2[addr32(addr)]; break;
		case 3: data=mem3[addr32(addr)]; break;
	}
	return data;
}

void cpu_store(uint32_t addr,uint8_t data) {
	memw[addr]=data;
	switch (addr%4) {
		case 0: mem0[addr32(addr)]= data; break;
		case 1: mem1[addr32(addr)]= data; break;
		case 2: mem2[addr32(addr)]= data; break;
		case 3: mem3[addr32(addr)]= data; break;
	}
//	PRINTF("[%08X]=%02X ; {%02X,%02X,%02X,%02X}\n",addr,data,
//			mem0[addr32(addr)],
//			mem1[addr32(addr)],
//			mem2[addr32(addr)],
//			mem3[addr32(addr)]);
	FFLUSH(stdout);

}

char extract_byte(unsigned int data, unsigned int offset) {
	switch (offset) {
	case 0:
		return ((char) (data));
	case 1:
		return ((char) (data >> 8) & 0xFF);
	case 2:
		return ((char) (data >> 16) & 0xFF);
	default:
		return ((char) (data >> 24));
	}
}

unsigned int pack_bytes(unsigned char a, unsigned char b, unsigned char c,
		unsigned char d) {
	return (a | (b << 8) | (c << 16) | (d << 24));
}

short extract_half(unsigned int data, unsigned int offset) {
	switch (offset) {
	case 0:
		return ((short) (data));
	default:
		return ((short) (data >> 16));
	}
}

void write_reg(unsigned int x[32], unsigned int rd, int value) {
	if (rd != 0 && rd < 32) {
		x[rd] = value;
	}
}

int match_hbkpt(uint32_t addr) {
	for (int k = 0; k < NB_HBKPT; k++) {
		if (hbkpt[k].active) {
			if (hbkpt[k].target == addr) {
				return k + 1;
			}
		}
	}
	return 0;
}

int add_hw_bkpt(uint32_t addr) {
	for (int k = 0; k < NB_HBKPT; k++) {
		if (hbkpt[k].active == 0) {
			hbkpt[k].active = 1;
			hbkpt[k].target = addr;
			return k + 1;
		}
	}
	return 0;
}

int remove_hw_bkpt(uint32_t addr) {
	int offset = match_hbkpt(addr);
	if (offset > 0) {
		hbkpt[offset].active = 0;
		return offset + 1;
	}
	return 0;
}

//int read_csr(uint16_t addr) {
//	switch (addr) {
//		case RISCV_CSR_MTVEC:
//			return mtvec;
//			break;
//		default:
//			break;
//	}
//}
//
//csr[RISCV_CSR_MEPC] = pc;
//		next_pc = csr[RISCV_CSR_MTVEC];
//int write_csr(uint16_t addr,uint32_t data) {
//}

uint32_t cpu_step(bool irq) {

	char shcpt = -1;
	unsigned int rs1, rs2, rd, ir;
	struct decode_info dc;
	int simm_I;
	unsigned int addr;
	unsigned char byte0 = 0;
	unsigned char byte1 = 0;
	unsigned char byte2 = 0;
	unsigned char byte3 = 0;
	unsigned int next_pc;
	unsigned int data;
	unsigned int hartid =1;
	bool valid = false;

	if (match_hbkpt(pc)) {
		halted = true;
	} else if (irq) {
		csr[RISCV_CSR_MCAUSE] = MCAUSE32_INT ;
		csr[RISCV_CSR_MEPC] = pc;
		next_pc = csr[RISCV_CSR_MTVEC];
	} else {
		addr = addr32(pc);
		ir = pack_bytes(mem0[addr], mem1[addr], mem2[addr], mem3[addr]);
		PRINTF("MEM[PC=%08X]=%08X, {%08X,%08X,%08X,%08X}\n",pc,ir,mem0[addr], mem1[addr], mem2[addr], mem3[addr]);
		dc = decode(ir);
		rd = dc.rd;
		next_pc = pc + 4;
		valid = false;

		switch (dc.opcode) {

		case RISCV_LUI: {
			write_reg(x, rd, dc.imm_U);
			valid = true;
			break;
		}
		case RISCV_AUIPC: {
			write_reg(x, rd, pc + dc.imm_U);
			valid = true;
			break;
		}
		case RISCV_OPI: {
			switch (dc.funct3) {
			case RISCV_OPI_ADDI: {
				unsigned int op1 = x[dc.rs1];
				unsigned int op2 = dc.simm_I;
				write_reg(x, rd, op1 + op2);

				valid = true;
				break;
			}
			case RISCV_OPI_ANDI: {
				write_reg(x, rd, x[dc.rs1] & dc.simm_I);
				valid = true;
				break;
			}
			case RISCV_OPI_ORI: {
				write_reg(x, rd, x[dc.rs1] | dc.simm_I);
				valid = true;
				break;
			}
			case RISCV_OPI_XORI: {
				write_reg(x, rd, x[dc.rs1] ^ dc.simm_I);
				valid = true;
				break;
			}
			case RISCV_OPI_SLTI: {
				write_reg(x, rd, ((int) x[dc.rs1] < dc.simm_I) ? 1 : 0);
				valid = true;
				break;
			}
			case RISCV_OPI_SLTIU: {
				write_reg(x, rd, (x[dc.rs1] < dc.simm_I) ? 1 : 0);
				valid = true;
				break;
			}
			case RISCV_OPI_SRI: {
				write_reg(x, rd, (x[dc.rs1] >> dc.simm_I));
				valid = true;
				break;
			}
			case RISCV_OPI_SLLI: {
				write_reg(x, rd, (x[dc.rs1] << dc.simm_I));
				valid = true;
				break;
			}
			}
			break;
		}
		case RISCV_OP: {
			switch (dc.funct3) {
			case RISCV_OP_ADD: {
				if (dc.funct7 == RISCV_OP_ADD_ADD) {
					write_reg(x, rd, x[dc.rs1] + x[dc.rs2]);
				} else if (dc.funct7 == RISCV_OP_ADD_SUB) {
					write_reg(x, rd, x[dc.rs1] - x[dc.rs2]);
				}
				valid = true;
				break;
			}
			case RISCV_OP_AND: {
				write_reg(x, rd, x[dc.rs1] & x[dc.rs2]);
				valid = true;
				break;
			}
			case RISCV_OP_OR: {
				write_reg(x, rd, x[dc.rs1] | x[dc.rs2]);
				valid = true;
				break;
			}
			case RISCV_OP_XOR: {
				write_reg(x, rd, x[dc.rs1] ^ x[dc.rs2]);
				valid = true;
				break;
			}
			case RISCV_OP_SLT: {
				write_reg(x, rd, x[dc.rs1] < x[dc.rs2] ? 1 : 0);
				valid = true;
				break;
			}
			case RISCV_OP_SLTU: {
				write_reg(x, rd, uint32(x[dc.rs1]) < uint32(x[dc.rs2]) ? 1 : 0);
				valid = true;
				break;
			}
#ifndef NO_SHIFT
			case RISCV_OP_SLL: {
#ifdef BARREL_SHIFTER
			if (shcpt < 0) {
				shcpt = ((unsigned int) x[dc.rs2]);
			} else if (shcpt > 0) {
				write_reg(x,rd,(unsigned int) x[dc.rs1] << 1);
				shcpt--;
			} else {
				shcpt = -1;
			}
#else
				write_reg(x, rd,
						(unsigned int) x[dc.rs1] << ((unsigned int) x[dc.rs2]));
#endif
				valid = true;
				break;
			}
			case RISCV_OP_SR: {
				switch (dc.funct7) {
				case RISCV_OP_SR_SRA: {
#ifdef BARREL_SHIFTER
				if (shcpt < 0) {
					shcpt = ((unsigned int) x[dc.rs2]);
				} else if (shcpt > 0) {
					write_reg(x,rd,x[dc.rs1] >> 1);
					shcpt--;
				} else {
					shcpt = -1;
				}
#else
					write_reg(x, rd, (x[dc.rs1] >> ((unsigned int) x[dc.rs2])));
#endif
					valid = true;
					break;
				}
				case RISCV_OP_SR_SRL: {
#ifdef BARREL_SHIFTER
				if (shcpt < 0) {
					shcpt = ((unsigned int) x[dc.rs2]);
				} else if (shcpt > 0) {
					write_reg(x,rd,uint32(x[dc.rs1] >> 1));
					shcpt--;
				} else {
					shcpt = -1;
				}
				break;
#else
					write_reg(x, rd,
							uint32(x[dc.rs1] >> ((unsigned int) x[dc.rs2])));
#endif
					valid = true;
					break;
				}
				}
				break;

			}
#endif
			}
			break;
		}
#ifndef NO_BRANCH
		case RISCV_BR: {
			bool taken = false;
			switch (dc.funct3) {
			case RISCV_BR_BEQ: {
				valid = true;
				taken = (x[dc.rs1] == x[dc.rs2]);
				break;
			}
			case RISCV_BR_BLT: {
				taken = x[dc.rs1] < x[dc.rs2];
				valid = true;
				break;
			}
			case RISCV_BR_BNE: {
				taken = x[dc.rs1] != x[dc.rs2];
				valid = true;
				break;
			}
			case RISCV_BR_BGE: {
				taken = x[dc.rs1] > x[dc.rs2];
				valid = true;
				break;
			}
			case RISCV_BR_BGEU: {
				taken = uint32(x[dc.rs1]) >= uint32(x[dc.rs2]);
				valid = true;
				break;
			}
			case RISCV_BR_BLTU: {
				taken = uint32(x[dc.rs1]) < uint32(x[dc.rs2]);
				valid = true;
				break;
			}
			}
			if (taken) {
				next_pc = pc + dc.br_offset;
			}
			break;
		}
		case RISCV_JAL: {
			write_reg(x, rd, next_pc);
			next_pc = pc + dc.simm_J;
			valid = true;
			break;
		}
		case RISCV_JALR: {
			write_reg(x, rd, next_pc);
			next_pc = uint32(x[dc.rs1]) + dc.simm_I;
			valid = true;
			break;
		}
#endif
#ifndef NO_LDST
		case RISCV_ST: {
			unsigned int addr = x[dc.rs1] + dc.simm_S;
			unsigned int waddr = addr32(addr);
			unsigned int offset = byte_offset(addr);
			switch (dc.funct3) {
			case RISCV_ST_SW: {
				valid = (offset % 4) == 0;
				if ((addr > 0xF0000)) {
					PRINTF("writing %s=%08X to io[%08X]\n", rname(dc.rs2),
							x[dc.rs2], waddr);
					iomap[waddr] = x[dc.rs2];
					trace_io(waddr, x[dc.rs2]);
				} else {
					mem0[waddr] = extract_byte(x[dc.rs2], 0);
					mem1[waddr] = extract_byte(x[dc.rs2], 1);
					mem2[waddr] = extract_byte(x[dc.rs2], 2);
					mem3[waddr] = extract_byte(x[dc.rs2], 3);
				}
				valid = true;
				break;
			}
			case RISCV_ST_SH: {
				valid = (offset % 2) == 0;
				if ((addr > 0xF0000)) {
					PRINTF("writing %s=%08X to io[%08X]\n", rname(dc.rs2),
							x[dc.rs2], waddr);
					iomap[waddr] = x[dc.rs2];
					trace_io(waddr, x[dc.rs2]);
				} else {
					switch (offset) {
					case 0: {
						mem0[waddr] = extract_byte(x[dc.rs2], 0);
						mem1[waddr] = extract_byte(x[dc.rs2], 1);
						break;
					}
					case 2:
						mem2[waddr] = extract_byte(x[dc.rs2], 2);
						mem3[waddr] = extract_byte(x[dc.rs2], 3);
						break;
					}
				}
				valid = true;
				break;
			}
			case RISCV_ST_SB: {
				valid = (offset % 4) == 0;
				if ((addr > 0xF0000)) {
					PRINTF("writing %s=%08X to io[%08X]\n", rname(dc.rs2),
							x[dc.rs2], waddr);
					iomap[waddr] = x[dc.rs2];
					trace_io(waddr, x[dc.rs2]);
				} else {
					char value;
					value = extract_byte(x[dc.rs2], 0);
					switch (offset) {
					case 0:
						mem0[waddr] = value;
						break;
					case 1:
						mem1[waddr] = value;
						break;
					case 2:
						mem2[waddr] = value;
						break;
					case 3:
						mem3[waddr] = value;
						break;
					}

				}
				valid = true;
				break;
			}
			}
			break;
		}
		case RISCV_LD: {

			unsigned int addr = x[dc.rs1] + dc.simm_I;
			unsigned int waddr = addr32(addr);
			unsigned int offset = byte_offset(addr);
			data = pack_bytes(mem0[waddr], mem1[waddr], mem2[waddr],
					mem3[waddr]);
			switch (dc.funct3) {
			case RISCV_LD_LW: {
				valid = (offset % 4) == 0;
				write_reg(x, rd, data);
				break;
			}
			case RISCV_LD_LB: {
				valid = true;
				write_reg(x, rd, (int) extract_byte(data, offset));
				break;
			}
			case RISCV_LD_LBU: {
				valid = true;
				write_reg(x, rd, extract_byte(data, offset));
				break;
			}
			case RISCV_LD_LH: {
				valid = (offset % 2) == 0;
				write_reg(x, rd, (int) extract_half(data, offset));
				break;
			}
			case RISCV_LD_LHU: {
				valid = (offset % 2) == 0;
				write_reg(x, rd, extract_half(data, offset));
				break;
			}
			}
			break;
		}
#endif
#ifndef NO_SYSCALL
		case RISCV_SYS: {
			unsigned int csridx;
			unsigned int tmp;

			switch (dc.funct3) {
			case RISCV_SYS_ECALL_EBREAK:
				switch (dc.imm_I) {
				case RISCV_SYS_ECALL: {
					csr[RISCV_CSR_MEPC] = pc;
					next_pc = csr[RISCV_CSR_MTVEC];
					csr[RISCV_CSR_MCAUSE] = EXCEPTION_ECALL_M;
					break;
				}
				case RISCV_SYS_EBREAK: {
					csr[RISCV_CSR_MCAUSE] = EXCEPTION_BKPT;
					next_pc = pc;
					halted = true;
					break;
				}
				}
				break;
			case RISCV_CSRRW:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = x[dc.rs1];
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRS:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = x[dc.rs1] | tmp;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRC:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = tmp & (~x[dc.rs1]);
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRWI:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = dc.rs1;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRSI:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = dc.rs1 | tmp;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRCI:
				csridx = dc.imm_I;
				tmp = csr[csridx];
				csr[csridx] = tmp & (~dc.rs1);
				write_reg(x, rd, tmp);
				break;

			default:
				break;
			}
			valid = true;
			break;
		}

#endif
		}
		PRINTF("PC=%08X:[%08X] %-21s  // %s=%08X,%s=%08X,%s=%08X\n",
				pc, ir, mnemonic(ir), rname(dc.rd), x[dc.rd],
				rname(dc.rs1), x[dc.rs1], rname(dc.rs2), x[dc.rs2]);

		csr[RISCV_CSR_MINSTRET] = insncnt;

		if (valid) {
			insncnt++;
			pc = next_pc;
			if (pc%4 !=0) {
				PRINTF("Unaligned insn address at PC=%08X\n",pc);
				halted = true;
			}

		} else {
			csr[RISCV_CSR_MCAUSE] = EXCEPTION_ILLEGAL_INST;
			csr[RISCV_CSR_MEPC] = pc;
			pc = csr[RISCV_CSR_MTVEC];
			halted = true;
		}
	}
	csr[RISCV_CSR_MCYCLE] = tick();
	return pc;

}

int cpu_reset() {
	pc = 0;
	for (int k=0;k<32;k++) {
		x[k]=0;
	}
}

int get_pc() {
	return pc;
}



int cpu_getreg(uint16_t id) {
	if (id>=0 && id <32) {
		return x[id];
	} else if (id==32){
		return pc;
	} else if (id<4096 ){
		return csr[id];
	} else {
		printf("error");return -1;
	}
}

int cpu_setreg(uint16_t id,uint32_t value) {
	if (id>0 && id <32) {
		x[id]=value;
	} else if (id==32){
		pc=value;
	} else {
		csr[id]=value;
	}

}

int cpu_info(uint8_t id) {

	switch(id) {
		case MISA_INFO:{
			return EXTENSION_I;
		}
		case MVENDOR_INFO:{
			return 0xCAFE00;
		}
	}
	return 0xDEADBEEF;
}

//int cpu_run() {
//	uint32_t pc;
//	u_int32_t cpt = 0;
//	bool irq = false;
//	do {
//		pc = cpu_step(irq);
//		if (match_hbkpt(pc)) {
//			return pc;
//		}
//		if (halted) {
//			return pc;
//		}
//	} while (1);
//}

#pragma toplevel
int riscv(volatile unsigned int *leds, volatile unsigned int *dbg_pc,
		volatile bool *irq,
		volatile unsigned int *dbg_ir, volatile unsigned int iomap[MEMSIZE]) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=irq
#pragma HLS INTERFACE ap_none port=dbg_pc register
#pragma HLS INTERFACE ap_none port=dbg_ir register
//#pragma HLS INTERFACE ap_none port=dbg_cmd register
#pragma HLS INTERFACE m_axi depth=4 port=iomap bundle=mem
	int i;
	cyclecnt = 0;
	pc = 0;
#pragma SHLS PIPELINE
	do {
		cpu_step(*irq);
		cyclecnt++;
#ifndef __SYNTHESIS__
	} while (cyclecnt < 1024);
#else
	} while (true);
#endif
	return pc;

}

#ifndef __SYNTHESIS__
int loadbinary(char *filename) {
	int i;
	FILE *f;
	char buffer[16];
	f = fopen(filename, "r");
	i = 0;
	if (f != NULL) {
		while (!feof(f) && i < (MEMSIZE)) {
			fread(buffer, 4, 1, f);
			mem0[i / 4] = buffer[0];
			mem1[i / 4] = buffer[1];
			mem2[i / 4] = buffer[2];
			mem3[i / 4] = buffer[3];
			i += 4;
		}
		fclose(f);
		return i;
	} else {
		fprintf(stderr, "Could not open %s\n", filename);
		return -1;
	}
}
#endif

#ifdef MAIN
int main(int argc, char **argv) {
	unsigned int leds;
	unsigned int pc;
	unsigned int ir;

#ifndef __SYNTHESIS__
	loadbinary(argv[1]);
#endif
	riscv(&leds, &pc,&ir,iomap);
	return 0;
}
#endif
