#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ac_int.h>
#include <riscv.h>
#include <riscv-nano-config.h>

extern unsigned int memw[];
extern unsigned char mem0[];
extern unsigned char mem1[];
extern unsigned char mem2[];
extern unsigned char mem3[];

#define RANGE(x, ub, lb) ((x & (1 << (ub))) >> lb)

struct decode_info decode(unsigned int ir) {
#pragma PURE
#pragma CONTROL_NODE
	{
		struct decode_info res = { };
		res.opcode = (ir & 0x7f);
		// res.opcode = RANGE(ir,5,0);
		res.rd = (ir >> 7) & 0x1f;
		// res.rd = RANGE(ir,11,7);
		res.funct3 = (ir >> 12) & 0x07;
		res.rs1 = (ir >> 15) & 0x1f;
		res.rs2 = (ir >> 20) & 0x1f;
		res.funct7 = (ir >> 25) & 0x7f;
		res.imm_I = (ir >> 20) & 0xfff;
		res.funct12 = res.imm_I;
		res.simm_I =
				(res.imm_I >= (1 << 11)) ? (res.imm_I - (1 << 12)) : res.imm_I;
		res.imm_S = ((ir >> 7) & 0x01f) | ((ir >> 20) & 0xfe0);
		res.simm_S =
				(res.imm_S >= (1 << 11)) ? (res.imm_S - (1 << 12)) : res.imm_S;
		res.imm_U = (ir & 0xfffff000);
		res.shamt = (ir >> 20) & 0x1f;
		res.imm_J = ((ir >> 20) & 0x7fe) | ((ir >> 9) & 0x800) | (ir & 0xff000)
				| ((ir >> 11) & 0x100000);
		res.simm_J =
				(res.imm_J >= (1 << 20)) ? (res.imm_J - (1 << 21)) : res.imm_J;
		res.br_uoffset = ((ir >> 7) & 0x1e) | ((ir >> 20) & 0x7e0)
				| ((ir << 4) & 0x800) | ((ir >> 19) & 0x1000);
		res.br_offset =
				(res.br_uoffset >= 4096) ?
						res.br_uoffset - 8192 : res.br_uoffset;
		return res;
	}
}

#ifndef __SYNTHESIS__

char const *regnames[32] = { "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
		"s0/fp", "s1", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2",
		"s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4",
		"t5", "t6" };

char const *optypes[8] =
		{ "add", "sll", "slt", "sltu", "xor", "sr", "or", "and" };
char const *immtypes[8] = { "addi", "slli", "slti", "sltiu", "xori", "sri",
		"ori", "andi" };
char const *brtypes[8] =
		{ "beq", "bne", "?", "?", "blt", "bge", "bltu", "bgeu" };
char const *ldtypes[8] = { "lb", "lh", "lw", "?", "lbu", "lhu", "?", "?" };
char const *sttypes[8] = { "sb", "sh", "sw", "?", "?", "?", "?", "?" };

char* rname(unsigned int ir) {
	return (char*) regnames[ir];
}

char csrbuffer[128];
char* csrname(unsigned int csrid) {
	switch (csrid) {
	case RISCV_CSR_MCYCLE:
		return (char*) "mcycle";
	case RISCV_CSR_MINSTRET:
		return (char*) "minstret";
	case RISCV_CSR_MHARTID:
		return (char*) "mhartid";
	default: {
		snprintf(csrbuffer, 128,"csr[%d]", csrid);
		return csrbuffer;
	}
	}
}

/* create a queue to mitigate the fact that by the mnneminic function has side effc on the buffer*/
#define QUEUE_SIZE 64
char *buffer;
char queue[QUEUE_SIZE][1024];
char buffer_idx = 0;

int loadbinary(char *filename) {
	int i;
	FILE *f;
	char buffer[16];
	f = fopen(filename, "r");
	i = 0;
	if (f != NULL) {
		while (!feof(f) && i < (MEMSIZE / 4)) {
			fread(&memw[i], 1, 4, f);
			i += 1;
		}
		fclose(f);
		return i;
	} else {
		fprintf(stderr, "Could not open %s\n", filename);
		return -1;
	}
}

char* mnemonic(unsigned int ir) {

	const char *rs1, *rs2, *rd, *csr;
	unsigned int simm_I;
	unsigned int simm_S;
	struct decode_info dc;
	dc = decode(ir);
	rd = regnames[dc.rd];
	rs1 = regnames[dc.rs1];
	rs2 = regnames[dc.rs2];
	csr = csrname(dc.rs2);
	simm_I = dc.simm_I;
	simm_S = dc.simm_S;

	buffer = queue[buffer_idx];
	buffer_idx = (buffer_idx + 1) % 64;

	switch (dc.opcode) {
	case RISCV_LUI: {
		snprintf(buffer,1024, "lui %s,%08X", rd, dc.imm_U);
		break;
	}
	case RISCV_AUIPC: {
		snprintf(buffer,1024, "aui %s,pc+%08X", rd, dc.imm_U);
		break;
	}
	case RISCV_OPI: {

		if (dc.funct3 == RISCV_OPI_SRI) {
			if (dc.simm_I & 0xF00) {
				snprintf(buffer,1024, "srai %s,%s,%08X", rd, rs1, dc.simm_I);
			} else {
				snprintf(buffer,1024, "srli %s,%s,%08X", rd, rs1, dc.simm_I);
			}
		} else {
			snprintf(buffer,1024, "%s %s,%s,%08X", immtypes[dc.funct3], rd, rs1,
					dc.simm_I);
		}

		break;
	}
	case RISCV_OP: {
		snprintf(buffer,1024, "%s %s,%s,%s", optypes[dc.funct3], rd, rs1, rs2);
		if (dc.funct3 == RISCV_OP_SR) {
			if (dc.funct7 == RISCV_OP_SR_SRA) {
				snprintf(buffer,1024, "sra %s,%s,%s", rd, rs1, rs2);
			} else {
				snprintf(buffer,1024, "srl %s,%s,%s", rd, rs1, rs2);
			}
		}
		break;
	}
	case RISCV_BR: {
		snprintf(buffer,1024, "%s %s,%s,%08X", brtypes[dc.funct3], rs1, rs2,
				(dc.br_offset));
		break;
	}
	case RISCV_ST: {
		snprintf(buffer,1024, "%s %s,%s(%d:%d)", sttypes[dc.funct3], rs2, rs1,
				dc.simm_S, dc.imm_S);
		break;
	}
	case RISCV_LD: {
		snprintf(buffer,1024, "%s %s,%s(%d:%d)", ldtypes[dc.funct3], rd, rs1,
				dc.simm_I, dc.imm_I);
		break;
	}
	case RISCV_JAL: {
		if (dc.rd == 0) {
			snprintf(buffer,1024, "j %d", dc.simm_J);
		} else {
			snprintf(buffer,1024, "jal %s, %d", rd, dc.simm_J);
		}
		break;
	}
	case RISCV_JALR: {
		snprintf(buffer,1024, "jalr %s,%s,%d", rd, rs1, dc.simm_J);
		break;
	}
	case RISCV_SYS: {

		switch (dc.funct3) {
		case RISCV_SYS_PRIVILEGED:
			switch (dc.imm_I) {
			case RISCV_SYS_ECALL: {
				snprintf(buffer,1024, "ecall");
				break;
			}
			case RISCV_SYS_EBREAK: {
				snprintf(buffer,1024, "ebreak");
				break;
			}
			case RISCV_SYS_SRET: {
				snprintf(buffer,1024, "sret");
				break;
			}
			case RISCV_SYS_URET: {
				snprintf(buffer,1024, "uret");
				break;
			}
			case RISCV_SYS_MRET: {
				snprintf(buffer,1024, "mret");
				break;
			}
			case RISCV_SYS_WFI: {
				// WFI : wait for interrupt
				snprintf(buffer,1024, "wfi");
				break;
			}

			}
			break;

		case RISCV_CSRRW:
			snprintf(buffer,1024, "csrrw csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRS:
			snprintf(buffer,1024, "csrrs csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRC:
			snprintf(buffer,1024, "csrrc csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRWI:
#ifdef DEBUG_ISS
			snprintf(buffer,1024, "csrrwi csr[%03X],%02X", dc.imm_I, dc.rs1);
#else
			snprintf(buffer,1024, "csrrwi csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
#endif
			break;
		case RISCV_CSRRSI:
#ifdef DEBUG_ISS
			snprintf(buffer,1024, "csrrsi csr[%03X],%02X", dc.imm_I, dc.rs1);
#else
			snprintf(buffer,1024, "csrrsi csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
#endif
			break;
		case RISCV_CSRRCI:
#ifdef DEBUG_ISS
			snprintf(buffer,1024, "csrrci csr[%03X],%02X", dc.imm_I, dc.rs1);
#else
			snprintf(buffer,1024, "csrrci csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
#endif
			break;

		default:
			break;
		}

		break;
	}
	case RISCV_MM:
		snprintf(buffer,1024, "fence");
		break;
	default: {
#ifdef DEBUG_ISS
		snprintf(buffer,1024, "UNKNOWN INSTRUCTION OPCODE=%02X", dc.opcode);
#else
		snprintf(buffer,1024, "UNKNOWN INSTRUCTION OPCODE=%02X", dc.opcode.to_int());
#endif
		break;
	}
	}
	return buffer;
}
#endif

int parse_args(int argc, char **argv) {
	int res = 0;
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
		if (strcmp(argv[k], "-bin") == 0) {
			FILE *binfile = fopen(argv[k + 1], "r");
			printf("Using binary file %s\n", argv[k + 1]);
			if (binfile == NULL) {
				return -2;
			}
			loadbinary(argv[k + 1]);
			nbopt += 2;
		}
	}
}
