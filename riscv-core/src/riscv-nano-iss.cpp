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

#define MEMSIZE 0x10000000
#define IOSIZE 0x10000000

#if MEMSIZE<0x0000000C
#error binary image does not fit memory 
#endif

unsigned int memw[MEMSIZE/4]= {0};
unsigned char mem0[MEMSIZE/4]= {0};
unsigned char mem1[MEMSIZE/4]= {0};
unsigned char mem2[MEMSIZE/4]= {0};
unsigned char mem3[MEMSIZE/4]= {0};

//#endif

struct decode_info decode(unsigned int ir);
char* mnemonic(unsigned int ir);
char* rname(unsigned int ir);





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


uint32_t insncnt;
uint32_t x[32] = { 0, 0, 0, 0, 0 };
uint32_t pc, next_pc;

#pragma GCS_INLINE
void write_reg(uint32_t x[32], ac_int<5,false> rd, int value) {
	if (rd != 0 && rd <= 31) {
		x[rd] = value;
	}
}

void cpu_branch_insn(struct decode_info dc, bool taken) {
	if (taken) {
		// printf("pc = %08X + %08X\n",pc,dc.br_offset);
		next_pc = pc + dc.br_offset;
	}
}

uint32_t addr32(uint32_t addr) {
	return (addr & (MEMSIZE-1)) >> 2;
}

#pragma GCS_INLINE
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
					write_reg(x, dc.rd, ((int)x[dc.rs1] < dc.simm_I) ? 1 : 0);
					valid = true;
					break;
				#endif
				#ifdef USE_SLTIU
				case RISCV_OPI_SLTIU:
					write_reg(x, dc.rd, (x[dc.rs1] < dc.simm_I) ? 1 : 0);
					valid = true;
					break;
				#endif
				#ifdef USE_SRI
				case RISCV_OPI_SRI:
					if (dc.funct7 == RISCV_OPI_SRI_SRAI) {
						write_reg(x, dc.rd, (((int)x[dc.rs1]) >> dc.shamt));
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
				default:{

				}
				}
				break;
			}
			#ifdef USE_AND
			case RISCV_OP_AND:
				write_reg(x, dc.rd, x[dc.rs1] & x[dc.rs2]);
				valid = true; break;
			#endif
			#ifdef USE_OR
			case RISCV_OP_OR:
				write_reg(x, dc.rd, x[dc.rs1] | x[dc.rs2]);
				valid = true; break;
			#endif
			#ifdef USE_XOR
			case RISCV_OP_XOR:
				write_reg(x, dc.rd, x[dc.rs1] ^ x[dc.rs2]);
				valid = true; break;
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
				write_reg(x, dc.rd, x[dc.rs1] << x[dc.rs2]);
				valid = true; break;
			#endif
			case RISCV_OP_SR: {
				switch (dc.funct7) {
				#ifdef USE_SRA
				case RISCV_OP_SR_SRA:
					write_reg(x, dc.rd, (int32_t)x[dc.rs1] >> x[dc.rs2]);
					valid = true; break;
				#endif
				#ifdef USE_SRL
				case RISCV_OP_SR_SRL:
					write_reg(x, dc.rd, x[dc.rs1] >> x[dc.rs2]);
					valid = true; break;
				#endif
				default: break;
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
				cpu_branch_insn(dc, x[dc.rs1] < x[dc.rs2]);
				valid = true;
				break;
			#endif
			#ifdef USE_BGE
			case RISCV_BR_BGE:
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
			default : break;
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
		#endif
		#ifdef USE_LD
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
		#endif
		default:
			halted = true;
		}

		if (valid) {
			printf("PC=%08X:[%08X] %-21s \n", pc, ir, mnemonic(ir));
			insncnt=insncnt+1;
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
	} while (!halted && insncnt < nbinsn);
	if (halted) {
		return -1;
	} else
		return pc;
}


int loadbinary(char *filename) {
  int i;
  FILE *f;
  char buffer[16];
  f = fopen(filename, "r");
  i = 0;
  if (f != NULL) {
    while (!feof(f) && i < (MEMSIZE/4)) {
      fread(memw, 1, 4, f);
      i += 1;
    }
    fclose(f);
    return i;
  } else {
    fprintf(stderr, "Could not open %s\n", filename);
    return -1;
  }
}

int ccycles=0;

int get_ticks() {
	return ccycles;
}

int get_trip_count() {
	return insncnt;
}

void dump_perf() {
	int i, t ;
	FILE* f ;
	f = fopen("perf.txt","w");
	i= get_trip_count();
	t= get_ticks();
	fprintf(f,"trip count=%d\nclock cycles=%d\nCPI=%f",i,t,t/((float)i));
	fclose(f);
}

int main(int argc, char **argv) {

//	bool use_nano_sim = false;
//	FILE *tmp = stdout;
//	int nbopt = 0;
	int res = 0;
//	for (int k = 1; k < argc; k++) {
//		if (strcmp(argv[k], "-o") == 0) {
//			FILE *ofile = fopen(argv[k + 1], "w");
//			printf("Using output file %s\n", argv[k + 1]);
//			if (ofile == NULL) {
//				return -2;
//			}
//			stdout = ofile;
//			nbopt += 2;
//		}
//		if (strcmp(argv[k], "-bin") == 0) {
//			FILE *binfile = fopen(argv[k + 1], "r");
//			printf("Using binary file %s\n", argv[k + 1]);
//			if (binfile == NULL) {
//				return -2;
//			}
//			loadbinary(argv[k + 1]);
//			nbopt += 2;
//		}
//	}
//	printf("Reset CPU\n");
	res = nano_cpu_run(128);

	if (res >= 0) {
		printf("PC=%08X\n", pc);
		printf("Executed %08X instructions\n", insncnt);
		for (int regid = 0; regid < 32; regid++) {
			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
		}
		printf("End of program\n");
		return 0;
	} else {
		printf("Program halted due to error after %d instructions\n", insncnt);
		fprintf(stderr,"Program halted due to error after %d instructions\n", insncnt);
		for (int regid = 0; regid < 32; regid++) {
			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
		}
		return -1;
	}
//	fclose(stdout);
}


