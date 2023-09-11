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

#define DEBUG_ISS

struct decode_info {
#ifdef DEBUG_ISS
	unsigned char opcode;
	unsigned char rd;
	unsigned char funct3;
	unsigned char rs1;
	unsigned char rs2;
	unsigned char funct7;
#else
	ac_int<7, false> opcode;
	ac_int<5, false> rd;
	ac_int<3, false> funct3;
	ac_int<5, false> rs1;
	ac_int<5, false> rs2;
	ac_int<7, false> funct7;
#endif
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

