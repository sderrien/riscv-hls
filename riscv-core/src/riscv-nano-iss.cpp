//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <ac_int.h>

#include <riscv.h>
#include <riscv-nano-config.h>

struct decode_info decode(unsigned int ir);
char* mnemonic(unsigned int ir);

#ifdef __SYNTHESIS__

#define FFLUSH(...)
#define PRINTF(...)
#define EXIT(a)
void trace_io(uint32_t addr, uint32_t value) {}
#else

#define EXIT(c) exit(c)

#define FFLUSH(...)                                                            \
  { fflush(__VA_ARGS__); }
#define PRINTF(...)                                                            \
  {                                                                            \
    printf(__VA_ARGS__);                                                       \
    fflush(stdout);                                                            \
  }
#define SPRINTF(...) sprintf(__VA_ARGS__)
#define FPRINTF(...) fprintf(__VA_ARGS__)
#endif

#if MEMSIZE<0x00000070
#error binary image does not fit memory
#endif
unsigned int memw[MEMSIZE / 4] = { 0 };
unsigned char mem0[MEMSIZE / 4] = { 0 };
unsigned char mem1[MEMSIZE / 4] = { 0 };
unsigned char mem2[MEMSIZE / 4] = { 0 };
unsigned char mem3[MEMSIZE / 4] = { 0 };

uint32_t insncnt;
uint32_t x[32] = { 0, 0, 0, 0, 0 };
uint32_t pc, next_pc;

uint32_t addr32(uint32_t addr) {
	return (addr & (MEMSIZE - 1)) >> 2;
}

bool is_io_access(uint32_t addr) {
	uint32_t tmp = addr & 0x80000000;
	if (tmp != 0) {
		return true;
	} else {
		return false;
	}
}

#pragma GCS_INLINE
void write_reg(uint32_t x[32], ac_int<5, false> rd, int value) {

	if (rd != 0) {
		x[((unsigned char) rd)] = value;
	}
}

#pragma GCS_INLINE
void cpu_branch_insn(struct decode_info dc, bool taken) {
	if (taken) {
		// printf("pc = %08X + %08X\n",pc,dc.br_offset);
		next_pc = pc + dc.br_offset;
	}
}

uint32_t byte_offset(uint32_t addr) {
	return (addr & 0x3);
}

unsigned char extract_byte(uint32_t data, uint32_t offset) {
	unsigned char res = 0;

	switch (offset) {
	case 0:
		res = ((unsigned char) (data));
		break;
	case 1:
		res = ((unsigned char) (data >> 8) & 0xFF);
		break;
	case 2:
		res = ((unsigned char) (data >> 16) & 0xFF);
		break;
	default:
		res = ((unsigned char) (data >> 24));
		break;
	}
	return res;
}

uint32_t pack_bytes(unsigned char a, unsigned char b, unsigned char c,
		unsigned char d) {
	return (a | (b << 8) | (c << 16) | (d << 24));
}

unsigned short extract_half(uint32_t data, uint32_t offset) {
	unsigned short res;
	switch (offset) {
	case 0:
		res = ((unsigned short) (data));
		break;
	default:
		res = ((unsigned short) (data >> 16));
		break;
	}
	return res;
}

#pragma GCS_INLINE
bool cpu_load_insn(struct decode_info dc) {
	bool cpu_load_insn_valid = false;

	uint32_t cpu_load_insn_addr;
	uint32_t cpu_load_insn_waddr;
	uint8_t cpu_load_insn_offset;
	uint32_t cpu_load_insn_data;

	cpu_load_insn_addr = (x[dc.rs1]) + (dc.simm_I);
	cpu_load_insn_waddr = addr32(cpu_load_insn_addr);
	cpu_load_insn_offset = byte_offset(cpu_load_insn_addr);
	cpu_load_insn_data = pack_bytes(mem0[cpu_load_insn_waddr], mem1[cpu_load_insn_waddr], mem2[cpu_load_insn_waddr], mem3[cpu_load_insn_waddr]);

	switch (dc.funct3) {
	case RISCV_LD_LW:
		cpu_load_insn_valid = (cpu_load_insn_offset % 4) == 0;
		break;
	case RISCV_LD_LH:
		cpu_load_insn_valid = (cpu_load_insn_offset % 2) == 0;
		break;
	case RISCV_LD_LHU:
		cpu_load_insn_valid = (cpu_load_insn_offset % 2) == 0;
		break;
	default:
		cpu_load_insn_valid = true;
		break;
	}

	switch (dc.funct3) {
	case RISCV_LD_LB:
		cpu_load_insn_data = (int8_t) extract_byte(cpu_load_insn_data, cpu_load_insn_offset);
		break;
	case RISCV_LD_LBU:
		cpu_load_insn_data = extract_byte(cpu_load_insn_data, cpu_load_insn_offset);
		break;
	case RISCV_LD_LW:
		cpu_load_insn_data = cpu_load_insn_data; //cpu_memread_u32(addr);
		break;
	case RISCV_LD_LH:
		cpu_load_insn_data = (int16_t) extract_half(cpu_load_insn_data, cpu_load_insn_offset);
		break;
	case RISCV_LD_LHU:
		cpu_load_insn_data = extract_half(cpu_load_insn_data, cpu_load_insn_offset);
		break;
	}
	write_reg(x, dc.rd, cpu_load_insn_data);

	return cpu_load_insn_valid;
}

#pragma GCS_INLINE
bool cpu_store_insn(struct decode_info dc) {
	bool cpu_store_insn_valid = false;
	uint32_t cpu_store_insn_addr;
	uint32_t cpu_store_insn_waddr;
	uint32_t cpu_store_insn_offset;
	char cpu_store_insn_value;

	cpu_store_insn_addr = ((int) x[dc.rs1]) + (dc.simm_S);
	cpu_store_insn_waddr = addr32(cpu_store_insn_addr);
	cpu_store_insn_offset = byte_offset(cpu_store_insn_addr);

	switch (dc.funct3) {
	case RISCV_ST_SW: {
		cpu_store_insn_valid = (cpu_store_insn_offset & 3) == 0;
		if (cpu_store_insn_valid) {
			mem0[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 0);
			mem1[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 1);
			mem2[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 2);
			mem3[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 3);
		}
		break;
	}
	case RISCV_ST_SH: {
		cpu_store_insn_valid = (cpu_store_insn_offset & 1) == 0;
		if (cpu_store_insn_valid) {
			switch (cpu_store_insn_offset) {
			case 0: {
				mem0[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 0);
				mem1[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 1);
				break;
			}
			case 2:
				mem2[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 0);
				mem3[cpu_store_insn_waddr] = extract_byte(x[dc.rs2], 1);
				break;
			}
		}
		break;
	}
	case RISCV_ST_SB: {
		cpu_store_insn_valid = true;
		cpu_store_insn_value = extract_byte(x[dc.rs2], 0);
		if (is_io_access(cpu_store_insn_waddr)) {
			printf("%c", cpu_store_insn_value);
		} else {
			switch (cpu_store_insn_offset) {
			case 0:
				mem0[cpu_store_insn_waddr] = cpu_store_insn_value;
				break;
			case 1:
				mem1[cpu_store_insn_waddr] = cpu_store_insn_value;
				break;
			case 2:
				mem2[cpu_store_insn_waddr] = cpu_store_insn_value;
				break;
			case 3:
				mem3[cpu_store_insn_waddr] = cpu_store_insn_value;
				break;
			}
		}

		break;
	}
	default:
		cpu_store_insn_valid = false;
		break;
	}

	return cpu_store_insn_valid;
}

uint32_t nano_cpu_run(uint32_t init_pc) {
	uint32_t ir;
	struct decode_info dc;
	int simm_I;
	uint32_t addr;
	unsigned char byte0 = 0;
	unsigned char byte1 = 0;
	unsigned char byte2 = 0;
	unsigned char byte3 = 0;
	uint32_t data;
	uint32_t hartid = 1;
	uint32_t waddr;
	uint32_t offset;
	uint32_t cpt = 0;
	bool taken;
	bool end = false;

	pc = init_pc;

#pragma shls spec_ignore_gamma variable=halted
	bool halted;
#pragma shls spec_ignore_gamma variable=valid
	bool valid;

	halted = false;

	do {
		valid = false;
		addr = addr32(pc);
		ir = memw[addr];
		dc = decode(ir);

		next_pc = pc + 4;
		switch (dc.opcode) {
#ifdef USE_LUI
		case RISCV_LUI:
			write_reg(x, dc.rd, dc.imm_U);
			valid = true;
			break;
#endif
#ifdef USE_AUIPC
		case RISCV_AUIPC:
			write_reg(x, dc.rd, pc + dc.imm_U);
			valid = true;
			break;
#endif

		case RISCV_OPI: {
			switch (dc.funct3) {
#ifdef USE_ADDI
			case RISCV_OPI_ADDI:
				write_reg(x, dc.rd, x[dc.rs1] + dc.simm_I);
				valid = true;
				break;
#endif
#ifdef USE_ANDI
			case RISCV_OPI_ANDI:
				write_reg(x, dc.rd, x[dc.rs1] & dc.simm_I);
				valid = true;
				break;
#endif
#ifdef USE_ORI
			case RISCV_OPI_ORI:
				write_reg(x, dc.rd, x[dc.rs1] | dc.simm_I);
				valid = true;
				break;
#endif
#ifdef USE_XORI
			case RISCV_OPI_XORI:
				write_reg(x, dc.rd, x[dc.rs1] ^ dc.simm_I);
				valid = true;
				break;
#endif
#ifdef USE_SLTI
			case RISCV_OPI_SLTI:
				write_reg(x, dc.rd, ((int) x[dc.rs1] < dc.simm_I) ? 1 : 0);
				valid = true;
				break;
#endif
#ifdef USE_SLTIU
			case RISCV_OPI_SLTIU:
				write_reg(x, dc.rd, (x[dc.rs1] < (uint32_t)dc.simm_I) ? 1 : 0);
				valid = true;
				break;
#endif
#ifdef USE_SRI
			case RISCV_OPI_SRI:
				if (dc.funct7 == RISCV_OPI_SRI_SRAI) {
					write_reg(x, dc.rd, (((int) x[dc.rs1]) >> dc.shamt));
					valid = true;
				} else if (dc.funct7 == RISCV_OPI_SRI_SRLI) {
					write_reg(x, dc.rd, (x[dc.rs1] >> dc.shamt));
					valid = true;
				}
				break;
#endif
#ifdef USE_SLLI
			case RISCV_OPI_SLLI:
				write_reg(x, dc.rd, (x[dc.rs1] << (dc.shamt)));
				valid = true;
				break;
#endif
			default:
				break;
			}
			break;
		}

		case RISCV_OP: {
			switch (dc.funct3) {
			case RISCV_OP_ADD: {
				switch (dc.funct7) {
#ifdef USE_ADD
				case RISCV_OP_ADD_ADD:
					write_reg(x, dc.rd, x[dc.rs1] + x[dc.rs2]);
					valid = true;
					break;
#endif
#ifdef USE_SUB
				case RISCV_OP_ADD_SUB:
					write_reg(x, dc.rd, x[dc.rs1] - x[dc.rs2]);
					valid = true;
					break;
#endif
				default: {

				}
				}
				break;
			}
#ifdef USE_AND
			case RISCV_OP_AND:
				write_reg(x, dc.rd, x[dc.rs1] & x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_OR
			case RISCV_OP_OR:
				write_reg(x, dc.rd, x[dc.rs1] | x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_XOR
			case RISCV_OP_XOR:
				write_reg(x, dc.rd, x[dc.rs1] ^ x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_SLT
			case RISCV_OP_SLT:
				write_reg(x, dc.rd, (int32_t)x[dc.rs1] < (int32_t)x[dc.rs2] ? 1 : 0);
				valid = true; break;
			#endif
#ifdef USE_SLTU
			case RISCV_OP_SLTU:
				write_reg(x, dc.rd, x[dc.rs1] < x[dc.rs2] ? 1 : 0);
				valid = true; break;
			#endif
#ifdef USE_SLL
			case RISCV_OP_SLL:
				write_reg(x, dc.rd, x[dc.rs1] << (x[dc.rs2] & 0x1f));
				valid = true;
				break;
#endif
			case RISCV_OP_SR: {
				switch (dc.funct7) {
#ifdef USE_SRA
				case RISCV_OP_SR_SRA:
					write_reg(x, dc.rd, (int32_t) x[dc.rs1] >> (x[dc.rs2] & 0x1f));
					valid = true;
					break;
#endif
#ifdef USE_SRL
				case RISCV_OP_SR_SRL:
					write_reg(x, dc.rd, x[dc.rs1] >> (x[dc.rs2] & 0x1f));
					valid = true;
					break;
#endif
				default:
					break;
				}
				break;
			}
			}
			break;
		}
		case RISCV_BR: {
			switch (dc.funct3) {
#ifdef USE_BEQ
			case RISCV_BR_BEQ:
				cpu_branch_insn(dc, x[dc.rs1] == x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_BLT
			case RISCV_BR_BLT:
				cpu_branch_insn(dc, (int32_t) x[dc.rs1] < (int32_t) x[dc.rs2]);
				valid = true;
				break;
			case RISCV_BR_BLTU:
				cpu_branch_insn(dc, x[dc.rs1] < x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_BGE
			case RISCV_BR_BGE:
				cpu_branch_insn(dc, (int32_t) x[dc.rs1] >= (int32_t) x[dc.rs2]);
				valid = true;
				break;
			case RISCV_BR_BGEU:
				cpu_branch_insn(dc, x[dc.rs1] >= x[dc.rs2]);
				valid = true;
				break;
#endif
#ifdef USE_BNE
			case RISCV_BR_BNE:
				cpu_branch_insn(dc, x[dc.rs1] != x[dc.rs2]);
				valid = true;
				break;
#endif
			default:
				break;
			}
			break;
		}
#ifdef USE_JAL
		case RISCV_JAL: {
			valid = true;
			write_reg(x, dc.rd, next_pc);
			next_pc = pc + dc.simm_J;
			break;
		}
#endif
#ifdef USE_JALR
		case RISCV_JALR: {
			uint32_t rs1_value = x[dc.rs1]; /* Handle the case where rs1 == rd */
			valid = true;
			write_reg(x, dc.rd, next_pc);
			next_pc = rs1_value + dc.simm_I;
			break;
		}
#endif

#ifdef USE_ST
		case RISCV_ST: {
#ifdef BYTE_MEM
			valid = cpu_store_insn(dc);
#else
		switch (dc.funct3) {
		case RISCV_ST_SW:
			addr = ((int) x[dc.rs1]) + (dc.simm_S);
			offset = byte_offset(addr);
			valid = (offset % 4) == 0;
			memw[addr32(addr)] = x[dc.rs2];
			break;
		}
#endif
			break;
		}
#endif
#ifdef USE_LD
		case RISCV_LD: {
#ifdef BYTE_MEM
			valid = cpu_load_insn(dc);
#else
		switch (dc.funct3) {
		case RISCV_LD_LW:
			addr = ((int) x[dc.rs1]) + (int) (dc.simm_I);
			offset = byte_offset(addr);
			valid = (offset % 4) == 0;
			write_reg(x, dc.rd, memw[addr32(addr)]);
			break;
		}
#endif
			break;
		}
#endif
#ifdef USE_SYS
		case RISCV_SYS: {
			switch(dc.funct3) {
			case RISCV_SYS_PRIVILEGED: {
				switch(dc.imm_I) {
				case RISCV_SYS_ECALL: {
					if (x[17] == 93 /* SYS_EXIT */) {
						printf("Exit code = %d\n", x[10]);
						valid = true;
						end = true;
					}
					break;
				}
				default: break;
				}
				break;
			}
			default: break;
			}
			break;
		}
#endif
		default:
			halted = true;
			break;
		}

		if (valid) {
			printf("PC=%08X:[%08X] %-21s \n", pc, ir, mnemonic(ir));
			insncnt = insncnt + 1;
			pc = next_pc;
			if ((pc & 0x3)) {
				printf("Unaligned insn address at PC=%08X\n", pc);
				halted = true;
			}
		} else {
			printf("UNSUPPORTED INSTRUCTION PC=%08X:[%08X] %-21s \n", pc, ir,
					mnemonic(ir));
			halted = true;
		}
	} while (!halted && !end);
	if (halted) {
		return -1;
	} else
		return pc;
}

int ccycles = 0;

int get_ticks() {
	return ccycles;
}

int get_trip_count() {
	return insncnt;
}

void dump_perf() {
	int i, t;
	FILE *f;
	f = fopen("perf.txt", "w");
	i = get_trip_count();
	t = get_ticks();
	fprintf(f, "trip count=%d\nclock cycles=%d\nCPI=%f", i, t, t / ((float) i));
	fclose(f);
}

