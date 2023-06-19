//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ac_int.h>

#define RISCV_LD 0x03    // LOAD
#define RISCV_LDF 0x07   // LOAD-FP
#define RISCV_MM 0x0f    // MISC-MEM
#define RISCV_OPI 0x13   // OP-IMM
#define RISCV_AUIPC 0x17 // AUIPC
#define RISCV_OPIW 0x1b  // OP-IMM-32
#define RISCV_ST 0x23    // STORE
#define RISCV_STF 0x27   // STORE-FP
#define RISCV_AMO 0x2f   // AMO
#define RISCV_OP 0x33    // OP
#define RISCV_LUI 0x37   // LUI
#define RISCV_OPW 0x3b   // OP-32
#define RISCV_MADD 0x43  // MADD
#define RISCV_MSUB 0x47  // MSUB
#define RISCV_NMSUB 0x4b // NMSUB
#define RISCV_NMADD 0x4f // NMADD
#define RISCV_OPF 0x53   // OP-FP
#define RISCV_BR 0x63    // BRANCH
#define RISCV_JALR 0x67  // JALR
#define RISCV_JAL 0x6f   // JAL
#define RISCV_SYS 0x73   // SYSTEM

// TODO: Are these properly defined somewhere?
#define RISCV_EXT_AES_MIXCOLUMNS 0x77
#define RISCV_EXT_CONV3X3 0x7b

/*
 ** RV32I Base Instruction Set
 ** -----------------------------------------------------------------------------
 */

/*
 ** BRANCH functions
 */
#define RISCV_BR_BEQ 0x0
#define RISCV_BR_BNE 0x1
#define RISCV_BR_BLT 0x4
#define RISCV_BR_BGE 0x5
#define RISCV_BR_BLTU 0x6
#define RISCV_BR_BGEU 0x7

/*
 ** LOAD functions
 */
#define RISCV_LD_LB 0x0
#define RISCV_LD_LH 0x1
#define RISCV_LD_LW 0x2
#define RISCV_LD_LBU 0x4
#define RISCV_LD_LHU 0x5

/*
 ** STORE functions
 */
#define RISCV_ST_SB 0x0
#define RISCV_ST_SH 0x1
#define RISCV_ST_SW 0x2

/*
 ** OP-IMM functions
 */
#define RISCV_OPI_ADDI 0x0
#define RISCV_OPI_SLTI 0x2
#define RISCV_OPI_SLTIU 0x3
#define RISCV_OPI_XORI 0x4
#define RISCV_OPI_ORI 0x6
#define RISCV_OPI_ANDI 0x7
#define RISCV_OPI_SLLI 0x1
#define RISCV_OPI_SRI 0x5

/*
 ** OP-IMM sub-functions
 */
#define RISCV_OPI_SRI_SRLI 0x00 // Logic
#define RISCV_OPI_SRI_SRAI 0x20 // Arithmetic

/*
 ** OP functions
 */
#define RISCV_OP_ADD 0x0
#define RISCV_OP_SLL 0x1
#define RISCV_OP_SLT 0x2
#define RISCV_OP_SLTU 0x3
#define RISCV_OP_XOR 0x4
#define RISCV_OP_SR 0x5
#define RISCV_OP_OR 0x6
#define RISCV_OP_AND 0x7

/*
 ** OP sub-functions
 */
#define RISCV_OP_ADD_ADD 0x00
#define RISCV_OP_ADD_SUB 0x20
#define RISCV_OP_SR_SRL 0x00
#define RISCV_OP_SR_SRA 0x20

/*
 ** MISC-MEM functions
 */
#define RISCV_MM_FENCE 0x0f

/*
 ** SYSTEM functions
 */
#define RISCV_SYS_PRIVILEGED 0x0
#define RISCV_SYS_EBREAK 0x1
#define RISCV_SYS_ECALL 0x0
#define RISCV_SYS_MRET 0x302
#define RISCV_SYS_SRET 0x102
#define RISCV_SYS_URET 0x002
#define RISCV_SYS_WFI 0x105
#define RISCV_SYS_SFENCE_VMA 0x002

#define RISCV_CSRRW 0x1
#define RISCV_CSRRS 0x2
#define RISCV_CSRRC 0x3
#define RISCV_CSRRWI 0x5
#define RISCV_CSRRSI 0x6
#define RISCV_CSRRCI 0x7

// https://five-embeddev.com/riscv-isa-manual/latest/machine.html
#define RISCV_CSR_MSTATUS 0x300
#define RISCV_CSR_MISA 0x301
#define RISCV_CSR_MEDELEG 0x302
#define RISCV_CSR_MIDELEG 0x303

#define RISCV_CSR_MIE 0x304
#define RISCV_CSR_MTVEC 0x305

#define RISCV_CSR_MEPC 0x341
#define RISCV_CSR_MCAUSE 0x342
#define RISCV_CSR_MTVAL 0x343
#define RISCV_CSR_MIP 0x344
#define RISCV_CSR_MVENDORID 0x344
#define RISCV_CSR_MARCHID 0x7
#define RISCV_CSR_MIMPID 0x7
#define RISCV_CSR_MHARTID 0x7

#define MVENDOR_INFO 0x1
#define MISA_INFO 0x2

// https://ibex-core.readthedocs.io/en/latest/03_reference/performance_counters.html
#define RISCV_CSR_MCYCLE 0xB00
#define RISCV_CSR_MINSTRET 0xB02

// https://www.linkedin.com/pulse/processor-design-2-introduction-risc-v-simon-southwell/?trk=pulse-article_more-articles_related-content-card

#define IRQ_S_SOFT 1
#define IRQ_H_SOFT 2
#define IRQ_M_SOFT 3
#define IRQ_S_TIMER 5
#define IRQ_H_TIMER 6
#define IRQ_M_TIMER 7
#define IRQ_S_EXT 9
#define IRQ_H_EXT 10
#define IRQ_M_EXT 11
#define IRQ_COP 12

#define EXCEPTION_ECALL_U 8
#define EXCEPTION_ECALL_S 9
#define EXCEPTION_ECALL_M 11
#define EXCEPTION_ILLEGAL_INST 2
#define EXCEPTION_BKPT 3

#define MCAUSE32_CAUSE 0x7FFFFFFF
#define MCAUSE32_INT 0x80000000

// instruction!(I: csrrw, opcode::SYSTEM, funct3 0b001);
// instruction!(I: csrrs, opcode::SYSTEM, funct3 0b010);
// instruction!(I: csrrc, opcode::SYSTEM, funct3 0b011);

#define EXTENSION_A 0x00000001 //	Atomic extension
#define EXTENSION_B                                                            \
  0x00000002 //	Tentatively reserved for Bit-Manipulation extension
#define EXTENSION_C 0x00000004 //	Compressed extension
#define EXTENSION_D                                                            \
  0x00000008                   //	Double-precision floating-point extension
#define EXTENSION_E 0x00000010 //	RV32E base ISA
#define EXTENSION_F                                                            \
  0x00000020                   //	Single-precision floating-point extension
#define EXTENSION_G 0x00000040 //	Reserved
#define EXTENSION_H 0x00000080 //	Hypervisor extension
#define EXTENSION_I 0x00000100 //	RV32I/64I/128I base ISA
#define EXTENSION_J                                                            \
  0x00000200 //	Tentatively reserved for Dynamically Translated Languages
// extension
#define EXTENSION_K 0x00000400 //	Reserved
#define EXTENSION_L                                                            \
  0x00000800 //	Tentatively reserved for Decimal Floating-Point extension
#define EXTENSION_M 0x00001000 //	Integer Multiply/Divide extension
#define EXTENSION_N 0x00002000 //	User-level interrupts supported
#define EXTENSION_O 0x00004000 //	Reserved
#define EXTENSION_P                                                            \
  0x00008000                   //	Tentatively reserved for Packed-SIMD extension
#define EXTENSION_Q 0x00010000 //	Quad-precision floating-point extension
#define EXTENSION_R 0x00020000 //	Reserved
#define EXTENSION_S 0x00040000 //	Supervisor mode implemented
#define EXTENSION_T                                                            \
  0x00080000 //	Tentatively reserved for Transactional Memory extension
#define EXTENSION_U 0x00100000 //	User mode implemented
#define EXTENSION_V                                                            \
  0x00200000                   //	Tentatively reserved for Vector extension
#define EXTENSION_W 0x00400000 //	Reserved
#define EXTENSION_X 0x00800000 //	Non-standard extensions present
#define EXTENSION_Y 0x01000000 //	Reserved
#define EXTENSION_Z 0x02000000 //	Reserved

#define MEMSIZE 0x10000000
#define IOSIZE 0x10000000

#if MEMSIZE<0x0000000C
#error binary image does not fit memory 
#endif
unsigned int memw[MEMSIZE/4]= {
	0x01000393, // 00000000: addi t2,zero,00000010,
	0x00741063, // 00000004: bne s0/fp,t2,00000000,
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
	0x00741063, // 00000008: bne s0/fp,t2,00000000
};
unsigned char mem0[MEMSIZE/4]= {
	0x93 ,
	0x63 ,
	0x63
};
unsigned char mem1[MEMSIZE/4]= {
	0x03 ,
	0x10 ,
	0x10
};
unsigned char mem2[MEMSIZE/4]= {
	0x00 ,
	0x74 ,
	0x74
};
unsigned char mem3[MEMSIZE/4]= {
	0x01 ,
	0x00 ,
	0x00
};

int add_hw_bkpt(uint32_t addr);

uint32_t cpu_step();
int cpu_reset();
int cpu_halt();
int cpu_start();
uint32_t cpu_run();
uint32_t nano_cpu_run();
bool is_cpu_halted();

uint32_t cpu_memread_u8(uint32_t addr);
void cpu_memwrite_u8(uint32_t addr, uint8_t data);
uint32_t cpu_memread_u32(uint32_t addr);
void cpu_memwrite_u32(uint32_t addr, uint32_t data);

void cpu_iowrite_u8(uint32_t addr, uint8_t data);
uint8_t cpu_ioread_u8(uint32_t addr);
void cpu_iowrite_u32(uint32_t addr, uint32_t data);
uint32_t cpu_ioread_u32(uint32_t addr);
uint32_t cpu_getpc();
int cpu_getreg(uint16_t id);
int cpu_setreg(uint16_t id, uint32_t value);
int cpu_info(uint8_t id);
////#define NO_AC_INT
//#ifdef NO_AC_INT
//struct decode_info {
//	unsigned char opcode;
//	unsigned char rd;
//	unsigned char funct3;
//	unsigned char rs1;
//	unsigned char rs2;
//	unsigned char funct7;
//	unsigned short imm_I;
//	unsigned short funct12;
//	short simm_I;
//	unsigned short imm_S;
//	short simm_S;
//	unsigned int imm_U;
//	unsigned char shamt;
//	unsigned int imm_J;
//	int simm_J;
//	unsigned short br_uoffset;
//	short br_offset;
//};
//#else
struct decode_info {
	ac_int<7, false> opcode;
	ac_int<5, false> rd;
	ac_int<3, false> funct3;
	ac_int<5, false> rs1;
	ac_int<5, false> rs2;
	ac_int<7, false> funct7;
	unsigned short imm_I;
	unsigned short funct12;
	short simm_I;
	unsigned short imm_S;
	short simm_S;
	unsigned int imm_U;
	ac_int<5, false> shamt;
	unsigned int imm_J;
	int simm_J;
	unsigned short br_uoffset;
	short br_offset;
};

//#endif

struct decode_info decode(unsigned int ir);
char* mnemonic(unsigned int ir);
char* rname(unsigned int ir);

uint32_t addr32(uint32_t addr) {
	return (addr % MEMSIZE) >> 2;
}

uint32_t x[32] = { 0, 0, 0, 0, 0 };
bool halted = false;
uint32_t pc, next_pc;
uint32_t insncnt;

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

void write_reg(uint32_t x[32], uint32_t rd, int value) {
	if (rd != 0 && rd <= 31) {
		x[rd] = value;
		// printf("%s[%d]=%08X\n",rname(rd),rd,value);
	}
}

void cpu_branch_insn(struct decode_info dc, bool taken) {
	if (taken) {
		// printf("pc = %08X + %08X\n",pc,dc.br_offset);
		next_pc = pc + dc.br_offset;
	}
}

uint32_t byte_offset(uint32_t addr) {
	return (addr & 0x3);
}


#define RISCV_PICO
//#define RISCV_FEMTO
//#define RISCV_NANO

#ifdef RISCV_FEMTO
#define USE_BNE
#define USE_ADD
#define USE_ADDI

#endif

#ifdef RISCV_PICO
#define USE_BNE
#define USE_ADD
#define USE_SUB
#define USE_AND
#define USE_XORI
#define USE_ADDI
#define USE_LD
#define USE_SW
#endif

#ifdef RISCV_NANO
#define USE_BEQ
#define USE_BLE
#define USE_BLT
#define USE_BNE
#define USE_BGE
#define USE_BE

#define USE_ADDI
#define USE_ADD
#define USE_SUB
#define USE_AND
#define USE_ANDI
#define USE_OR
#define USE_ORI
#define USE_XOR
#define USE_XORI

#define USE_SLTI
#define USE_SLTIU

#define USE_SLLI
#define USE_SRI

#define USE_LD
#define USE_ST

#define USE_JAL
#define USE_JALR

#define USE_LUI
#define USE_AUIPC

#endif

#ifdef RISCV_I32
#define USE_BEQ
#define USE_BLE
#define USE_BLT
#define USE_BNE
#define USE_BGE
#define USE_BE

#define USE_ADD
#define USE_SUB
#define USE_AND
#define USE_ANDI
#define USE_OR
#define USE_ORI
#define USE_XOR
#define USE_XORI

#define USE_SLTI
#define USE_SLTIU
#define USE_SLLI
#define USE_SRI
#define USE_SRA
#define USE_SRL

#define USE_ADDI
#define USE_LD
#define USE_ST

#define USE_JAL
#define USE_JALR

#define USE_LUI
#define USE_AUIPC
#endif


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

	bool valid;
	do {
		valid = false;
		addr = addr32(pc);
		ir = memw[addr];
		dc = decode(ir);

		next_pc = pc + 4;
		insncnt++;
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
			insncnt++;
			pc = next_pc;
			if (pc % 4 != 0) {
				printf("Unaligned insn address at PC=%08X\n", pc);
				halted = true;
			}
		} else {
			printf("UNSUPPORTED INSTRUCTION PC=%08X:[%08X] %-21s \n", pc, ir,
					mnemonic(ir));
			halted = true;
		}
		if (halted) printf("Processor halted !\n");
	} while (insncnt < nbinsn);
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
	res = nano_cpu_run(64);
//	if (res >= 0) {
//		printf("PC=%08X\n", pc);
//		printf("Executed %08X instructions\n", insncnt);
//		for (int regid = 0; regid < 32; regid++) {
//			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
//		}
//		printf("End of program\n");
//		return 0;
//	} else {
//		printf("Program halted due to error after %d instructions\n", insncnt);
//		fprintf(stderr,"Program halted due to error after %d instructions\n", insncnt);
//		for (int regid = 0; regid < 32; regid++) {
//			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
//		}
//		return -1;
//	}
//	fclose(stdout);
}

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
		sprintf(csrbuffer, "csr[%d]", csrid);
		return csrbuffer;
	}
	}
}

/* create a queue to mitigate the fact that by the mnneminic function has side effc on the buffer*/
#define QUEUE_SIZE 64
char* buffer;
char queue[QUEUE_SIZE][1024];
char buffer_idx = 0;


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

	buffer=queue[buffer_idx];
	buffer_idx = (buffer_idx +1) % 64;

	switch (dc.opcode) {
	case RISCV_LUI: {
		sprintf(buffer, "lui %s,%08X", rd, dc.imm_U);
		break;
	}
	case RISCV_AUIPC: {
		sprintf(buffer, "aui %s,pc+%08X", rd, dc.imm_U);
		break;
	}
	case RISCV_OPI: {

		if (dc.funct3 == RISCV_OPI_SRI) {
			if (dc.simm_I & 0xF00) {
				sprintf(buffer, "srai %s,%s,%08X", rd, rs1, dc.simm_I);
			} else {
				sprintf(buffer, "srli %s,%s,%08X", rd, rs1, dc.simm_I);
			}
		} else {
			sprintf(buffer, "%s %s,%s,%08X", immtypes[dc.funct3], rd, rs1,
					dc.simm_I);
		}

		break;
	}
	case RISCV_OP: {
		sprintf(buffer, "%s %s,%s,%s", optypes[dc.funct3], rd, rs1, rs2);
		if (dc.funct3 == RISCV_OP_SR) {
			if (dc.funct7 == RISCV_OP_SR_SRA) {
				sprintf(buffer, "sra %s,%s,%s", rd, rs1, rs2);
			} else {
				sprintf(buffer, "srl %s,%s,%s", rd, rs1, rs2);
			}
		}
		break;
	}
	case RISCV_BR: {
		sprintf(buffer, "%s %s,%s,%08X", brtypes[dc.funct3], rs1, rs2,
				(dc.br_offset));
		break;
	}
	case RISCV_ST: {
		sprintf(buffer, "%s %s,%s(%d:%d)", sttypes[dc.funct3], rs2, rs1,
				dc.simm_S, dc.imm_S);
		break;
	}
	case RISCV_LD: {
		sprintf(buffer, "%s %s,%s(%d:%d)", ldtypes[dc.funct3], rd, rs1,
				dc.simm_I, dc.imm_I);
		break;
	}
	case RISCV_JAL: {
		if (dc.rd == 0) {
			sprintf(buffer, "j %d", dc.simm_J);
		} else {
			sprintf(buffer, "jal %s, %d", rd, dc.simm_J);
		}
		break;
	}
	case RISCV_JALR: {
		sprintf(buffer, "jalr %s,%s,%d", rd, rs1, dc.simm_J);
		break;
	}
	case RISCV_SYS: {

		switch (dc.funct3) {
		case RISCV_SYS_PRIVILEGED:
			switch (dc.imm_I) {
			case RISCV_SYS_ECALL: {
				sprintf(buffer, "ecall");
				break;
			}
			case RISCV_SYS_EBREAK: {
				sprintf(buffer, "ebreak");
				break;
			}
			case RISCV_SYS_SRET: {
				sprintf(buffer, "sret");
				break;
			}
			case RISCV_SYS_URET: {
				sprintf(buffer, "uret");
				break;
			}
			case RISCV_SYS_MRET: {
				sprintf(buffer, "mret");
				break;
			}
			case RISCV_SYS_WFI: {
				// WFI : wait for interrupt
				sprintf(buffer, "wfi");
				break;
			}

			}
			break;

		case RISCV_CSRRW:
			sprintf(buffer, "csrrw csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRS:
			sprintf(buffer, "csrrs csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRC:
			sprintf(buffer, "csrrc csr[%03X],%s", dc.imm_I, rs1);
			break;
		case RISCV_CSRRWI:
			sprintf(buffer, "csrrwi csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
			break;
		case RISCV_CSRRSI:
			sprintf(buffer, "csrrsi csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
			break;
		case RISCV_CSRRCI:
			sprintf(buffer, "csrrci csr[%03X],%02X", dc.imm_I, dc.rs1.to_int());
			break;

		default:
			break;
		}

		break;
	}
	case RISCV_MM:
		sprintf(buffer, "fence");
		break;
	default: {
		sprintf(buffer, "UNKNOWN INSTRUCTION OPCODE=%02X", dc.opcode.to_int());
		break;
	}
	}
	return buffer;
}
#endif
