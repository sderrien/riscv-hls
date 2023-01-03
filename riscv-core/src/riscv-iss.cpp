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
#include "riscv-iss.h"
#include "gdb-target.h"

#ifndef __SYNTHESIS__
#include <channels.h>
#endif
unsigned int uint32(int x) {
	return (unsigned int) x;
}

unsigned int addr32(unsigned int addr) {
	return (addr% MEMSIZE) >> 2 ;
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


unsigned long long cyclecnt = 0;

unsigned int tick() {
	return cyclecnt++;
}


void write_to_stdout(int data);

unsigned int byte_offset(unsigned int addr) {
	return (addr & 0x3);
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
#endif
unsigned int iomap[IOSIZE/4] = { 0 };

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

#define FFLUSH(...)
#define PRINTF(...)
#define EXIT(a)
void trace_io(unsigned int addr, unsigned int value) {
}

#else

#define EXIT(c) exit(c)


#define FFLUSH(...) {  fflush(__VA_ARGS__); }
//#define PRINTF(...)
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

#define DEBUG(...) { PRINTF( __VA_ARGS__)  }


int read_byte() ;
void write_byte(unsigned char data);



void cpu_iowrite_u8(uint32_t addr,uint8_t data) {
#ifndef __SYNTHESIS__
	PRINTF("[unsupported] writing byte %08X to io[%08X]\n", data,addr);
#else
	iomap[(addr>>2)%IOSIZE] = data;
#endif
	trace_io(addr, data);
}


void cpu_iowrite_u32(uint32_t addr,uint32_t data) {
#ifndef __SYNTHESIS__
	switch (addr % IOSIZE) {
		case 0x4:
			write_to_stdout(data);
			break;
		default:
			PRINTF("writing word %08X to io[%08X]\n", data,addr % IOSIZE);
			break;
	}
#else
	iomap[(addr>>2)%IOSIZE] = data;
#endif
}

uint8_t cpu_ioread_u8(uint32_t addr) {
	//PRINTF("Reading byte from io[%08X]\n", addr);
	return extract_byte(cpu_ioread_u32(addr),byte_offset(addr)) ;

}

uint32_t cpu_ioread_u32(uint32_t addr) {
#ifndef __SYNTHESIS__
	switch (addr) {
		case 0x0:
			unsigned char c;
			fflush(stdin);
			c= getchar();
			return c;
			break;
		default:
			PRINTF("Reading word from io[%08X]\n", addr);
			return 0;
			break;
	}
#else
	return iomap[(addr>>2)%IOSIZE];
#endif
}

bool is_io_access(uint32_t addr) {
	uint32_t tmp = addr&0x80000000;
	if (tmp!=0) {
		return true;
	} else {
		return false;
	}
}

uint32_t cpu_memread_u8(uint32_t addr) {
	unsigned int data ;
	switch (addr%4) {
		case 0: data=mem0[addr32(addr)]; break;
		case 1: data=mem1[addr32(addr)]; break;
		case 2: data=mem2[addr32(addr)]; break;
		case 3: data=mem3[addr32(addr)]; break;
	}
	return data;
}

void cpu_memwrite_u8(uint32_t addr,uint8_t data) {
	if (addr < (MEMSIZE)) {

	//PRINTF("mem[%08X]=%02X\n",addr,data);
	memw[addr]=data;

	switch (byte_offset(addr)) {
		case 0: mem0[addr32(addr)]= data; break;
		case 1: mem1[addr32(addr)]= data; break;
		case 2: mem2[addr32(addr)]= data; break;
		case 3: mem3[addr32(addr)]= data; break;
	}
	} else {
		PRINTF("Out of bound [%08X]\n",addr);
	}
//	PRINTF("[%08X]=%02X ; {%02X,%02X,%02X,%02X}\n",addr,data,
//			mem0[addr32(addr)],
//			mem1[addr32(addr)],
//			mem2[addr32(addr)],
//			mem3[addr32(addr)]);
	FFLUSH(stdout);

}

void cpu_memwrite_u32(uint32_t addr,uint32_t data) {
	if ((addr % 4)==0) {
		//FPRINTF(stdout,"Write mem32[%08X]<=%08X",addr,data);
		mem0[addr32(addr)]= extract_byte(data,0);
		mem1[addr32(addr)]= extract_byte(data,1);
		mem2[addr32(addr)]= extract_byte(data,2);
		mem3[addr32(addr)]= extract_byte(data,3);
	} else {
		FPRINTF(stderr,"[Error] Unaligned access [%08X]\n",addr);
	}
}

uint32_t cpu_memread_u32(uint32_t addr) {
	if ((addr % 4)==0) {
		uint32_t waddr;
		waddr = addr32(addr);
		uint32_t data= pack_bytes(mem0[waddr],mem1[waddr],mem2[waddr],mem3[waddr]);
		//FPRINTF(stdout,"Read mem32[%08X]=>%08X",addr,data);
		return data;
	} else {
		//FPRINTF(stderr,"[Error] Unaligned access [%08X]\n",addr);
		return 0;
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


int cpu_reset() {
	pc = 0;
	for (int k=0;k<32;k++) {
		x[k]=0;
	}
	halted = false;
	return 1;
}

uint32_t cpu_getpc() {
	return pc;
}

bool is_cpu_halted() {
	return halted;
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
	return 1;

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

uint32_t cpu_run() {
	do {
		cpu_step();
	} while (!is_cpu_halted());
	return cpu_getpc();
}

bool irq = false;
bool trace_instr= true;
uint32_t cpu_step() {

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
	unsigned int waddr;
	unsigned int offset;
	unsigned int csridx;
	unsigned int tmp;
	unsigned int op1;
	unsigned int op2;
	bool taken;

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
		//DEBUG("MEM[PC=%08X]=%08X, {%08X,%08X,%08X,%08X}\n",pc,ir,mem0[addr], mem1[addr], mem2[addr], mem3[addr]);

		if (trace_instr) {
			PRINTF("PC=%08X:[%08X] %-21s ",pc, ir, mnemonic(ir)); fflush(stdout);
		}
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
				op1 = x[dc.rs1];
				op2 = dc.simm_I;
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
				if ((dc.imm_I&0xF00)!=0) {
					// SRAI
					write_reg(x, rd, (((int)x[dc.rs1]) >> dc.simm_I));
				} else {
					// SRLI
					write_reg(x, rd, (x[dc.rs1] >> dc.simm_I));
				}
				valid = true;
				break;
			}
			case RISCV_OPI_SLLI: {
				write_reg(x, rd, (x[dc.rs1] << (dc.simm_I)));
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
			taken = false;
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
			addr= ((int)x[dc.rs1]) + (dc.simm_S);
			waddr= addr32(addr);
			offset= byte_offset(addr);

			switch (dc.funct3) {
			case RISCV_ST_SW: {
				valid = (offset % 4) == 0;
				if (!valid)
					fprintf(stderr, "Unaligned write not supported x=%08X, imm=%08X, addr=%08X\n", (int)(x[dc.rs1]), dc.simm_S, addr) ;

				if (is_io_access(addr)) {
					if (trace_instr) fprintf(stdout, "IO[%08X+%08X=%08X]", (int)(x[dc.rs1]), dc.simm_S, addr) ;
					cpu_iowrite_u32(addr, x[dc.rs2]);
				} else {
					if (trace_instr) fprintf(stdout, "MEM[%08X+%08X=%08X]", (int)(x[dc.rs1]), dc.simm_S, addr) ;
					cpu_memwrite_u32(addr, x[dc.rs2]);
				}

				valid = true;
				break;
			}
			case RISCV_ST_SH: {
				valid = (offset % 2) == 0;
				if (is_io_access(addr)) {
					PRINTF("Unsupported IO SH operation\n");
					valid=false;
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
				if (is_io_access(addr)) {
					cpu_iowrite_u8(addr, data);
					//getchar();
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

			addr= (x[dc.rs1]) +  (dc.simm_I);
			waddr = addr32(addr);
			if (trace_instr) fprintf(stdout, "MEM[%d+%d=%d]", (int)(x[dc.rs1]), dc.simm_I, addr) ;

			if (is_io_access(addr)) {
				fprintf(stderr, "IO read not yet supported x=%08X, imm=%08X, addr=%016llX, waddr=%08X\n", x[dc.rs1], dc.simm_I, addr,waddr) ;
				valid = false;
				break;
			}
			offset= byte_offset(addr);
			data = pack_bytes(mem0[waddr], mem1[waddr], mem2[waddr],mem3[waddr]);
			switch (dc.funct3) {
			case RISCV_LD_LW: {
				valid = (offset % 4) == 0;
				if (!valid) {

					int xx,y,z;
					unsigned int uxx,uy,uz;
					xx = x[dc.rs1];
					y =(dc.simm_S);
					z  = xx + y;

					printf("x=%08x, y=%08x, z=%08x\n",xx,y,z);

					uxx =  x[dc.rs1];
					uy = (dc.simm_S);
					uz  = uxx + uy;
					printf("ux=%08x, uy=%08x, uz=%08x\n",uxx,uy,uz);

					fprintf(stderr, "Unaligned read not supported x=%08X, imm=%08X, laddr=%016lX, waddr=%08X\n", x[dc.rs1], dc.simm_I, addr,waddr) ;
					valid = false;
					break;
				}

				write_reg(x, rd, cpu_memread_u32(addr));
				break;
			}
			case RISCV_LD_LB: {
				valid = true;
				write_reg(x, rd, (int) extract_byte(data, offset));
				break;
			}
			case RISCV_LD_LBU: {
				valid = true;
				data = (unsigned char) extract_byte(data, offset);
				write_reg(x, rd, data);
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
			csridx = dc.imm_I;
			tmp = csr[csridx];
			if (csridx==RISCV_CSR_MCYCLE) {
				printf("mcycle=%08X\n",tmp);

			}
			if (csridx==RISCV_CSR_MINSTRET) {
				printf("msnsn=%08X\n",tmp);
			}

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
				csr[csridx] = x[dc.rs1];
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRS:
				csr[csridx] = x[dc.rs1] | tmp;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRC:
				csr[csridx] = tmp & (~x[dc.rs1]);
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRWI:
				csr[csridx] = dc.rs1;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRSI:
				csr[csridx] = dc.rs1 | tmp;
				write_reg(x, rd, tmp);
				break;
			case RISCV_CSRRCI:
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

		if (trace_instr) {
		PRINTF(" // %s=%08X,%s=%08X,%s=%08X\n",
				rname(dc.rd), x[dc.rd],
				rname(dc.rs1), x[dc.rs1], rname(dc.rs2), x[dc.rs2]);
		}
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





