//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1, sderrien@irisa.fr
//============================================================================

#include <stdio.h>
#include <string.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include <rvi32.h>
#include <riscv-iss.h>
#include <gdb-target.h>

#ifndef __SYNTHESIS__
#include <channels.h>
#endif

struct decode_info {
	unsigned char opcode;
	unsigned char rd;
	unsigned char funct3;
	unsigned char rs1;
	unsigned char rs2;
	unsigned char funct7;
	unsigned short imm_I;
	unsigned short funct12;
	short simm_I;
	unsigned short imm_S;
	short simm_S;
	unsigned int imm_U;
	unsigned char shamt;
	unsigned int imm_J;
	int simm_J;
	unsigned short br_uoffset;
	short br_offset;
};


struct decode_info decode(unsigned int ir);
char* mnemonic(unsigned int ir);
char* rname(unsigned int ir);

uint32_t addr32(uint32_t addr) {
	return (addr % MEMSIZE) >> 2;
}

#include "rom.h"

uint32_t x[32] = { 0, 0, 0, 0, 0 };
bool halted = false;
uint32_t pc, next_pc;
uint32_t insncnt;

#ifdef __SYNTHESIS__

#define FFLUSH(...)
#define PRINTF(...)
#define EXIT(a)
void trace_io(uint32_t addr, uint32_t value) {
}
#else

#define EXIT(c) exit(c)

#define FFLUSH(...) {  fflush(__VA_ARGS__); }
#define PRINTF(...) { printf( __VA_ARGS__) ; fflush(stdout); }
#define SPRINTF(...) sprintf( __VA_ARGS__)
#define FPRINTF(...) fprintf( __VA_ARGS__)

#endif

void write_reg(uint32_t x[32], uint32_t rd, int value) {
	if (rd != 0 && rd < 32) {
		x[rd] = value;
		//printf("%s[%d]=%08X\n",rname(rd),rd,value);
	}
}

void cpu_branch_insn(struct decode_info dc, bool taken) {
	if (taken) {
		//printf("pc = %08X + %08X\n",pc,dc.br_offset);
		next_pc = pc + dc.br_offset;
	}
}

uint32_t byte_offset(uint32_t addr) {
	return (addr & 0x3);
}

uint32_t nano_cpu_run(int nbinsn) {
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

	bool valid ;
	do {
		valid = false;
		addr = addr32(pc);
		ir = memw[addr];
		dc = decode(ir);

		printf("PC=%08X:[%08X] %-21s \n", pc, ir, mnemonic(ir));

		next_pc = pc + 4;
		cpt++;
		switch (dc.opcode) {

		case RISCV_LUI:
			write_reg(x, dc.rd, dc.imm_U);
			valid = true;
			break;
		case RISCV_AUIPC:
			write_reg(x, dc.rd, pc + dc.imm_U);
			valid = true;
			break;
		case RISCV_OPI: {

			switch (dc.funct3) {
			case RISCV_OPI_ADDI:
				write_reg(x, dc.rd, x[dc.rs1] + dc.simm_I);valid=true;
				break;
			case RISCV_OPI_ANDI:
				write_reg(x, dc.rd, x[dc.rs1] & dc.simm_I);valid=true;
				break;
			case RISCV_OPI_ORI:
				write_reg(x, dc.rd, x[dc.rs1] | dc.simm_I);valid=true;
				break;
			case RISCV_OPI_XORI:
				write_reg(x, dc.rd, x[dc.rs1] ^ dc.simm_I);valid=true;
				break;
			case RISCV_OPI_SLTI:
				write_reg(x, dc.rd, ((int) x[dc.rs1] < dc.simm_I) ? 1 : 0);valid=true;
				break;
			case RISCV_OPI_SLTIU:
				write_reg(x, dc.rd, (x[dc.rs1] < dc.simm_I) ? 1 : 0);valid=true;
				break;
			case RISCV_OPI_SLLI:
				write_reg(x, dc.rd, (x[dc.rs1] << (dc.simm_I)));valid=true;
				break;
			case RISCV_OPI_SRI:
				valid=true;
				if ((dc.imm_I & 0xF00) != 0)
					write_reg(x, dc.rd, (((int) x[dc.rs1]) >> dc.simm_I)); // SRAI
				else
					write_reg(x, dc.rd, (x[dc.rs1] >> dc.simm_I)); // SRLI
				break;
			}
			break;
		}
		case RISCV_OP: {
			switch (dc.funct3) {
			case RISCV_OP_ADD: {
				switch (dc.funct7) {
				case RISCV_OP_ADD_ADD:
					write_reg(x, dc.rd, x[dc.rs1] + x[dc.rs2]);valid=true;
					break;
				case RISCV_OP_ADD_SUB:
					write_reg(x, dc.rd, x[dc.rs1] - x[dc.rs2]);valid=true;
					break;
				}
				break;
			}
			case RISCV_OP_AND:
				write_reg(x, dc.rd, x[dc.rs1] & x[dc.rs2]);valid=true;
				break;
			case RISCV_OP_OR:
				write_reg(x, dc.rd, x[dc.rs1] | x[dc.rs2]);valid=true;
				break;
			case RISCV_OP_XOR:
				write_reg(x, dc.rd, x[dc.rs1] ^ x[dc.rs2]);valid=true;
				break;
			case RISCV_OP_SLT:
				write_reg(x, dc.rd, x[dc.rs1] < x[dc.rs2] ? 1 : 0);valid=true;
				break;
			case RISCV_OP_SLTU:
				write_reg(x, dc.rd,((uint32_t) x[dc.rs1]) < ((uint32_t)x[dc.rs2]) ? 1 : 0);valid=true;
				break;
			case RISCV_OP_SLL:
				write_reg(x, dc.rd,((uint32_t) x[dc.rs1])  << ((uint32_t)x[dc.rs2]));valid=true;
				break;
			case RISCV_OP_SR: {
				switch (dc.funct7) {
				case RISCV_OP_SR_SRA:
					write_reg(x, dc.rd,(x[dc.rs1] >> ((uint32_t) x[dc.rs2])));valid=true;
					break;
				case RISCV_OP_SR_SRL:
					write_reg(x, dc.rd,((uint32_t)x[dc.rs1]) >> ((uint32_t) x[dc.rs2]));valid=true;
					break;
				}
				break;
			}
			}
			break;
		}
		case RISCV_BR: {
			switch (dc.funct3) {
			case RISCV_BR_BLT:
				cpu_branch_insn(dc, x[dc.rs1] < x[dc.rs2]);
				valid = true;
				break;
			case RISCV_BR_BGE:
				cpu_branch_insn(dc, x[dc.rs1] >= x[dc.rs2]);
				valid = true;
				break;
			case RISCV_BR_BEQ:
				cpu_branch_insn(dc, x[dc.rs1] == x[dc.rs2]);
				valid = true;
				break;
			case RISCV_BR_BNE:
				cpu_branch_insn(dc, x[dc.rs1] != x[dc.rs2]);
				valid = true;
				break;
			}
			break;
		}
		case RISCV_JAL: {
			valid = true;
			write_reg(x, dc.rd, next_pc);
			next_pc = pc + dc.simm_J;
			break;
		}
		case RISCV_JALR: {
			valid = true;
			write_reg(x, dc.rd, next_pc);
			next_pc = ((uint32_t) x[dc.rs1]) + dc.simm_I;
			break;
		}
		case RISCV_ST: {
			switch (dc.funct3) {
			case RISCV_ST_SW:
				addr = ((int) x[dc.rs1]) + (dc.simm_S);
				offset = byte_offset(addr);
				valid = (offset % 4) == 0;
				memw[addr32(addr)] = x[dc.rs2];
				break;
			}
			break;
		}
		case RISCV_LD:
			switch (dc.funct3) {
			case RISCV_LD_LW:
				addr = ((int) x[dc.rs1]) + (int) (dc.simm_I);
				offset = byte_offset(addr);
				valid = (offset % 4) == 0;
				write_reg(x, dc.rd, memw[addr32(addr)]);
				break;
			}
			break;
		default:
			halted = true;
		}

		if (valid) {
			pc = next_pc;
			if (pc % 4 != 0) {
				PRINTF("Unaligned insn address at PC=%08X\n", pc);
				halted = true;
			}

		} else {
			printf("UNSUPPORTED INSTRUCTION PC=%08X:[%08X] %-21s \n", pc, ir, mnemonic(ir));
		}
	} while (cpt< nbinsn);
	return pc;

}

int main(int argc, char **argv) {

	bool use_nano_sim = false;
	FILE *tmp = stdout;
	int nbopt = 0;
	for (int k = 1; k < argc; k++) {
		if (strcmp(argv[k], "-o") == 0) {
			FILE *ofile = fopen(argv[k + 1], "w");
			printf("Using output file %s\n", argv[k + 1]);
			if (ofile == NULL) {
				return -2;
			}
			stdout = ofile;
			nbopt += 2;
		}
	}
	printf("Reset CPU\n");
	nano_cpu_run(64);
	printf("PC=%08X\n", pc);
	for (int regid = 0; regid < 32; regid++) {
		printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
	}
	printf("End of program\n");
	fclose(stdout);

}

