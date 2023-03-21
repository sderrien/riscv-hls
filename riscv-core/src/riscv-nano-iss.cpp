//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

#if MEMSIZE<0x00000070 
#error binary image does not fit memory 
#endif
unsigned int memw[MEMSIZE/4]= {
	0x00100093, // 00000000: addi ra,zero,00000001,
	0x00009A63, // 00000004: bne ra,zero,00000014,
	0x00009063, // 00000008: bne ra,zero,00000000,
	0x00009063, // 0000000C: bne ra,zero,00000000,
	0x00009063, // 00000010: bne ra,zero,00000000,
	0x00009063, // 00000014: bne ra,zero,00000000,
	0x00100093, // 00000018: addi ra,zero,00000001,
	0x01F08113, // 0000001C: addi sp,ra,0000001F,
	0xFFF10193, // 00000020: addi gp,sp,FFFFFFFF,
	0x01F1C213, // 00000024: xori tp,gp,0000001F,
	0xFE0212E3, // 00000028: bne tp,zero,FFFFFFE4,
	0x001082B3, // 0000002C: add t0,ra,ra,
	0x40128333, // 00000030: add t1,t0,ra,
	0x0062C3B3, // 00000034: xor t2,t0,t1,
	0x00300413, // 00000038: addi s0/fp,zero,00000003,
	0xFC741AE3, // 0000003C: bne s0/fp,t2,FFFFFFD4,
	0x06000493, // 00000040: addi s1,zero,00000060,
	0x0004A503, // 00000044: lw a0,s1(0:0),
	0x1FF57593, // 00000048: andi a1,a0,000001FF,
	0x1EF00613, // 0000004C: addi a2,zero,000001EF,
	0xFCB612E3, // 00000050: bne a2,a1,FFFFFFC4,
	0x00009063, // 00000054: bne ra,zero,00000000,
	0x00000000, // 00000058: UNKNOWN INSTRUCTION OPCODE=00,
	0x00000000, // 0000005C: UNKNOWN INSTRUCTION OPCODE=00,
	0xDEADBEEF, // 00000060: jal t4, -534,
	0xBABEFACE, // 00000064: UNKNOWN INSTRUCTION OPCODE=4E,
	0x1BADCAFE, // 00000068: UNKNOWN INSTRUCTION OPCODE=7E,
	0x1BADCAFE, // 0000006C: UNKNOWN INSTRUCTION OPCODE=7E
};
unsigned char mem0[MEMSIZE/4]= {
	0x93 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x93 ,
	0x13 ,
	0x93 ,
	0x13 ,
	0xE3 ,
	0xB3 ,
	0x33 ,
	0xB3 ,
	0x13 ,
	0xE3 ,
	0x93 ,
	0x03 ,
	0x93 ,
	0x13 ,
	0xE3 ,
	0x63 ,
	0x00 ,
	0x00 ,
	0xEF ,
	0xCE ,
	0xFE ,
	0xFE 
};
unsigned char mem1[MEMSIZE/4]= {
	0x00 ,
	0x9A ,
	0x90 ,
	0x90 ,
	0x90 ,
	0x90 ,
	0x00 ,
	0x81 ,
	0x01 ,
	0xC2 ,
	0x12 ,
	0x82 ,
	0x83 ,
	0xC3 ,
	0x04 ,
	0x1A ,
	0x04 ,
	0xA5 ,
	0x75 ,
	0x06 ,
	0x12 ,
	0x90 ,
	0x00 ,
	0x00 ,
	0xBE ,
	0xFA ,
	0xCA ,
	0xCA 
};
unsigned char mem2[MEMSIZE/4]= {
	0x10 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x10 ,
	0xF0 ,
	0xF1 ,
	0xF1 ,
	0x02 ,
	0x10 ,
	0x12 ,
	0x62 ,
	0x30 ,
	0x74 ,
	0x00 ,
	0x04 ,
	0xF5 ,
	0xF0 ,
	0xB6 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0xAD ,
	0xBE ,
	0xAD ,
	0xAD 
};
unsigned char mem3[MEMSIZE/4]= {
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x01 ,
	0xFF ,
	0x01 ,
	0xFE ,
	0x00 ,
	0x40 ,
	0x00 ,
	0x00 ,
	0xFC ,
	0x06 ,
	0x00 ,
	0x1F ,
	0x1E ,
	0xFC ,
	0x00 ,
	0x00 ,
	0x00 ,
	0xDE ,
	0xBA ,
	0x1B ,
	0x1B 
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
char *mnemonic(unsigned int ir);
char *rname(unsigned int ir);

uint32_t addr32(uint32_t addr) { return (addr % MEMSIZE) >> 2; }

uint32_t x[32] = {0, 0, 0, 0, 0};
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
  if (rd != 0 && rd < 32) {
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

uint32_t byte_offset(uint32_t addr) { return (addr & 0x3); }

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

    //printf("PC=%08X:[%08X] %-21s \n", pc, ir, mnemonic(ir));

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
        write_reg(x, dc.rd, x[dc.rs1] + dc.simm_I);
        valid = true;
        break;
      case RISCV_OPI_ANDI:
        write_reg(x, dc.rd, x[dc.rs1] & dc.simm_I);
        valid = true;
        break;
      case RISCV_OPI_ORI:
        write_reg(x, dc.rd, x[dc.rs1] | dc.simm_I);
        valid = true;
        break;
      case RISCV_OPI_XORI:
        write_reg(x, dc.rd, x[dc.rs1] ^ dc.simm_I);
        valid = true;
        break;
      case RISCV_OPI_SLTI:
        write_reg(x, dc.rd, ((int)x[dc.rs1] < dc.simm_I) ? 1 : 0);
        valid = true;
        break;
      case RISCV_OPI_SLTIU:
        write_reg(x, dc.rd, (x[dc.rs1] < dc.simm_I) ? 1 : 0);
        valid = true;
        break;
      case RISCV_OPI_SLLI:
        write_reg(x, dc.rd, (x[dc.rs1] << (dc.simm_I)));
        valid = true;
        break;
      case RISCV_OPI_SRI:
        valid = true;
        if ((dc.imm_I & 0xF00) != 0)
          write_reg(x, dc.rd, (((int)x[dc.rs1]) >> dc.simm_I)); // SRAI
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
          write_reg(x, dc.rd, x[dc.rs1] + x[dc.rs2]);
          valid = true;
          break;
        case RISCV_OP_ADD_SUB:
          write_reg(x, dc.rd, x[dc.rs1] - x[dc.rs2]);
          valid = true;
          break;
        }
        break;
      }
      case RISCV_OP_AND:
        write_reg(x, dc.rd, x[dc.rs1] & x[dc.rs2]);
        valid = true;
        break;
      case RISCV_OP_OR:
        write_reg(x, dc.rd, x[dc.rs1] | x[dc.rs2]);
        valid = true;
        break;
      case RISCV_OP_XOR:
        write_reg(x, dc.rd, x[dc.rs1] ^ x[dc.rs2]);
        valid = true;
        break;
      case RISCV_OP_SLT:
        write_reg(x, dc.rd, x[dc.rs1] < x[dc.rs2] ? 1 : 0);
        valid = true;
        break;
      case RISCV_OP_SLTU:
        write_reg(x, dc.rd,
                  ((uint32_t)x[dc.rs1]) < ((uint32_t)x[dc.rs2]) ? 1 : 0);
        valid = true;
        break;
      case RISCV_OP_SLL:
        write_reg(x, dc.rd, ((uint32_t)x[dc.rs1]) << ((uint32_t)x[dc.rs2]));
        valid = true;
        break;
      case RISCV_OP_SR: {
        switch (dc.funct7) {
        case RISCV_OP_SR_SRA:
          write_reg(x, dc.rd, (x[dc.rs1] >> ((uint32_t)x[dc.rs2])));
          valid = true;
          break;
        case RISCV_OP_SR_SRL:
          write_reg(x, dc.rd, ((uint32_t)x[dc.rs1]) >> ((uint32_t)x[dc.rs2]));
          valid = true;
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
      next_pc = ((uint32_t)x[dc.rs1]) + dc.simm_I;
      break;
    }
    case RISCV_ST: {
      switch (dc.funct3) {
      case RISCV_ST_SW:
        addr = ((int)x[dc.rs1]) + (dc.simm_S);
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
        addr = ((int)x[dc.rs1]) + (int)(dc.simm_I);
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
        //PRINTF("Unaligned insn address at PC=%08X\n", pc);
        halted = true;
      }
    } else {
      //printf("UNSUPPORTED INSTRUCTION PC=%08X:[%08X] %-21s \n", pc, ir,
      //       mnemonic(ir));
    }
  } while (cpt < nbinsn);
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

#define RANGE(x, ub, lb) ((x & (1 << (ub))) >> lb)
struct decode_info decode(unsigned int ir) {
#pragma PURE
#pragma CONTROL_NODE
  {
    struct decode_info res = {};
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
    res.simm_I = (res.imm_I >= (1 << 11)) ? (res.imm_I - (1 << 12)) : res.imm_I;
    res.imm_S = ((ir >> 7) & 0x01f) | ((ir >> 20) & 0xfe0);
    res.simm_S = (res.imm_S >= (1 << 11)) ? (res.imm_S - (1 << 12)) : res.imm_S;
    res.imm_U = (ir & 0xfffff000);
    res.shamt = (ir >> 20) & 0x1f;
    res.imm_J = ((ir >> 20) & 0x7fe) | ((ir >> 9) & 0x800) | (ir & 0xff000) |
                ((ir >> 11) & 0x100000);
    res.simm_J = (res.imm_J >= (1 << 20)) ? (res.imm_J - (1 << 21)) : res.imm_J;
    res.br_uoffset = ((ir >> 7) & 0x1e) | ((ir >> 20) & 0x7e0) |
                     ((ir << 4) & 0x800) | ((ir >> 19) & 0x1000);
    res.br_offset =
        (res.br_uoffset >= 4096) ? res.br_uoffset - 8192 : res.br_uoffset;
    return res;
  }
}

#ifndef __SYNTHESIS__

char buffer[4096];

char const *regnames[32] = {
    "zero", "ra", "sp", "gp", "tp",  "t0",  "t1", "t2", "s0/fp", "s1", "a0",
    "a1",   "a2", "a3", "a4", "a5",  "a6",  "a7", "s2", "s3",    "s4", "s5",
    "s6",   "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5",    "t6"};

char const *optypes[8] = {"add", "sll", "slt", "sltu",
                          "xor", "sr",  "or",  "and"};
char const *immtypes[8] = {"addi", "slli", "slti", "sltiu",
                           "xori", "sri",  "ori",  "andi"};
char const *brtypes[8] = {"beq", "bne", "?", "?", "blt", "bge", "bltu", "bgeu"};
char const *ldtypes[8] = {"lb", "lh", "lw", "?", "lbu", "lhu", "?", "?"};
char const *sttypes[8] = {"sb", "sh", "sw", "?", "?", "?", "?", "?"};

char *rname(unsigned int ir) { return (char *)regnames[ir]; }

char csrbuffer[128];
char *csrname(unsigned int csrid) {
  switch (csrid) {
  case RISCV_CSR_MCYCLE:
    return (char *)"mcycle";
  case RISCV_CSR_MINSTRET:
    return (char *)"minstret";
  case RISCV_CSR_MHARTID:
    return (char *)"mhartid";
  default: {
    sprintf(csrbuffer, "csr[%d]", csrid);
    return csrbuffer;
  }
  }
}

char *mnemonic(unsigned int ir) {

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
      sprintf(buffer, "%s %s,%s,%08X", immtypes[dc.funct3], rd, rs1, dc.simm_I);
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
    sprintf(buffer, "%s %s,%s(%d:%d)", sttypes[dc.funct3], rs2, rs1, dc.simm_S,
            dc.imm_S);
    break;
  }
  case RISCV_LD: {
    sprintf(buffer, "%s %s,%s(%d:%d)", ldtypes[dc.funct3], rd, rs1, dc.simm_I,
            dc.imm_I);
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
      sprintf(buffer, "csrrwi csr[%03X],%02X", dc.imm_I, dc.rs1);
      break;
    case RISCV_CSRRSI:
      sprintf(buffer, "csrrsi csr[%03X],%02X", dc.imm_I, dc.rs1);
      break;
    case RISCV_CSRRCI:
      sprintf(buffer, "csrrci csr[%03X],%02X", dc.imm_I, dc.rs1);
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
    sprintf(buffer, "UNKNOWN INSTRUCTION OPCODE=%02X", dc.opcode);
    break;
  }
  }
  return buffer;
}
#endif
