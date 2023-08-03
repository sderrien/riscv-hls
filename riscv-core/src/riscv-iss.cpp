//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm.h"
#include "gdb-target.h"
#include "riscv-iss.h"
#include "rvi32.h"
#include "elfreader/dynamicrom.h"

#ifndef __SYNTHESIS__
#include <channels.h>
#endif

uint32_t addr32(uint32_t addr) { return (addr % MEMSIZE) >> 2; }

char extract_byte(uint32_t data, uint32_t offset) {
  switch (offset) {
  case 0:
    return ((char)(data));
  case 1:
    return ((char)(data >> 8) & 0xFF);
  case 2:
    return ((char)(data >> 16) & 0xFF);
  default:
    return ((char)(data >> 24));
  }
}

uint32_t pack_bytes(unsigned char a, unsigned char b, unsigned char c,
                    unsigned char d) {
  return (a | (b << 8) | (c << 16) | (d << 24));
}

short extract_half(uint32_t data, uint32_t offset) {
  switch (offset) {
  case 0:
    return ((short)(data));
  default:
    return ((short)(data >> 16));
  }
}

unsigned long long cyclecnt = 0;

unsigned int tick() { return cyclecnt++; }

void write_to_stdout(int data);

unsigned int byte_offset(unsigned int addr) { return (addr & 0x3); }

#define ROM
#ifdef ROM
#include "rom.h"
#else
uint32_t memw[MEMSIZE / 4] = {0};
unsigned char mem0[MEMSIZE / 4] = {0};
unsigned char mem1[MEMSIZE / 4] = {0};
unsigned char mem2[MEMSIZE / 4] = {0};
unsigned char mem3[MEMSIZE / 4] = {0};
#endif

uint32_t iomap[IOSIZE / 4] = {0};

uint32_t x[32] = {0, 0, 0, 0, 0};
uint32_t csr[4096] = {0};
bool halted = false;
uint32_t pc, next_pc;
uint32_t insncnt;

#ifdef __SYNTHESIS__

#define FFLUSH(...)
#define PRINTF(...)
#define EXIT(a)
void trace_io(unsigned int addr, unsigned int value) {}

#else

#define EXIT(c) exit(c)

#define FFLUSH(...)                                                            \
  { fflush(__VA_ARGS__); }
// #define PRINTF(...)
#define PRINTF(...)                                                            \
  {                                                                            \
    printf(__VA_ARGS__);                                                       \
    fflush(stdout);                                                            \
  }
#define SPRINTF(...) sprintf(__VA_ARGS__)
#define FPRINTF(...) fprintf(__VA_ARGS__)

FILE *iotrace;
void trace_io(uint32_t addr, uint32_t value) {
  if (iotrace == NULL) {
    iotrace = fopen("iotrace.txt", "w");
    if (iotrace == NULL)
      exit(-2);
  }
  FPRINTF(iotrace, "%08X/%c\n", (char)value, (char)value);
  PRINTF("io[%08X]=%08X/%c\n", addr, (char)value, (char)value);
  FFLUSH(iotrace);
}
#endif

#define DEBUG(...)                                                             \
  { PRINTF(__VA_ARGS__) }

int read_byte();
void write_byte(unsigned char data);

void cpu_iowrite_u8(uint32_t addr, uint8_t data) {
#ifndef __SYNTHESIS__
  PRINTF("[unsupported] writing byte %08X to io[%08X]\n", data, addr);
#else
  iomap[(addr >> 2) % IOSIZE] = data;
#endif
  trace_io(addr, data);
}

void cpu_iowrite_u32(uint32_t addr, uint32_t data) {
#ifndef __SYNTHESIS__
  switch (addr % IOSIZE) {
  case 0x4:
    write_to_stdout(data);
    break;
  default:
    PRINTF("writing word %08X to io[%08X]\n", data, addr % IOSIZE);
    break;
  }
#else
  iomap[(addr >> 2) % IOSIZE] = data;
#endif
}

uint8_t cpu_ioread_u8(uint32_t addr) {
  // PRINTF("Reading byte from io[%08X]\n", addr);
  return extract_byte(cpu_ioread_u32(addr), byte_offset(addr));
}

uint32_t cpu_ioread_u32(uint32_t addr) {
#ifndef __SYNTHESIS__
  switch (addr) {
  case 0x0:
    unsigned char c;
    fflush(stdin);
    c = getchar();
    return c;
  default:
    PRINTF("Reading word from io[%08X]\n", addr);
    return 0;
  }
#else
  return iomap[(addr >> 2) % IOSIZE];
#endif
}

bool is_io_access(uint32_t addr) {
  uint32_t tmp = addr & 0x80000000;
  if (tmp != 0) {
    return true;
  } else {
    return false;
  }
}

bool is_tohost(uint32_t addr) {
#ifndef NO_TOHOST
  return addr == 0x20000; /* WARNING: This needs to be the address of tohost in
                             the compiled binary! */
#else
  return false;
#endif
}

uint32_t cpu_memread_u8(uint32_t addr) {
  unsigned int data;
  switch (addr % 4) {
  case 0:
    data = mem0[addr32(addr)];
    break;
  case 1:
    data = mem1[addr32(addr)];
    break;
  case 2:
    data = mem2[addr32(addr)];
    break;
  case 3:
    data = mem3[addr32(addr)];
    break;
  }
  return data;
}

void cpu_memwrite_u8(uint32_t addr, uint8_t data) {
  if (addr < (MEMSIZE)) {

    // PRINTF("mem[%08X]=%02X\n",addr,data);
    memw[addr] = data;

    switch (byte_offset(addr)) {
    case 0:
      mem0[addr32(addr)] = data;
      break;
    case 1:
      mem1[addr32(addr)] = data;
      break;
    case 2:
      mem2[addr32(addr)] = data;
      break;
    case 3:
      mem3[addr32(addr)] = data;
      break;
    }
  } else {
    PRINTF("Out of bound [%08X]\n", addr);
  }
  //	PRINTF("[%08X]=%02X ; {%02X,%02X,%02X,%02X}\n",addr,data,
  //			mem0[addr32(addr)],
  //			mem1[addr32(addr)],
  //			mem2[addr32(addr)],
  //			mem3[addr32(addr)]);
  FFLUSH(stdout);
}

void cpu_memwrite_u32(uint32_t addr, uint32_t data) {
  if ((addr % 4) == 0) {
    // FPRINTF(stdout,"Write mem32[%08X]<=%08X",addr,data);
    mem0[addr32(addr)] = extract_byte(data, 0);
    mem1[addr32(addr)] = extract_byte(data, 1);
    mem2[addr32(addr)] = extract_byte(data, 2);
    mem3[addr32(addr)] = extract_byte(data, 3);
  } else {
    FPRINTF(stderr, "[Error] Unaligned access [%08X]\n", addr);
  }
}

uint32_t cpu_memread_u32(uint32_t addr) {
  if ((addr % 4) == 0) {
    uint32_t waddr;
    waddr = addr32(addr);
    uint32_t data =
        pack_bytes(mem0[waddr], mem1[waddr], mem2[waddr], mem3[waddr]);
    // FPRINTF(stdout,"Read mem32[%08X]=>%08X",addr,data);
    return data;
  } else {
    // FPRINTF(stderr,"[Error] Unaligned access [%08X]\n",addr);
    return 0;
  }
}

void write_reg(uint32_t x[32], uint32_t rd, int value) {
  if (rd != 0 && rd < 32) {
    x[rd] = value;
  }
}

int cpu_reset() {
  pc = 0;
  for (int k = 0; k < 32; k++) {
    x[k] = 0;
  }
  halted = false;
  return 1;
}

uint32_t cpu_getpc() { return pc; }

int cpu_getreg(uint16_t id) {
  if (id >= 0 && id < 32) {
    return x[id];
  } else if (id == 32) {
    return pc;
  } else if (id < 4096) {
    return csr[id];
  } else {
    printf("error");
    return -1;
  }
}

int cpu_setreg(uint16_t id, uint32_t value) {
  if (id > 0 && id < 32) {
    x[id] = value;
  } else if (id == 32) {
    pc = value;
  } else {
    csr[id] = value;
  }
  return 1;
}

int cpu_info(uint8_t id) {
  switch (id) {
  case MISA_INFO: {
    return EXTENSION_I;
  }
  case MVENDOR_INFO: {
    return 0xCAFE00;
  }
  }
  return 0xDEADBEEF;
}

bool is_cpu_halted() { return halted; }

uint32_t cpu_run() {
  do {
    cpu_step();
  } while (!is_cpu_halted());
  return cpu_getpc();
}

bool irq = false;
bool trace_instr = true;

#define TRACE_DEPTH 256

struct trace_entry {
  uint32_t pc;
  uint32_t ir;
  uint32_t rs1;
  uint32_t rs2;
  uint32_t r;
};

struct trace_entry trace_buffer[TRACE_DEPTH];

uint32_t idx = 0;

void trace_insn_dc(uint32_t pc, uint32_t ir, uint32_t opa, uint32_t opb) {
  if (trace_instr) {
    trace_buffer[idx].pc = pc;
    trace_buffer[idx].ir = ir;
    trace_buffer[idx].rs1 = opa;
    trace_buffer[idx].rs2 = opb;
  }
}

void trace_insn_ex(uint32_t res) {
  if (trace_instr) {
    trace_buffer[idx].r = res;
    idx = (idx + 1) % TRACE_DEPTH;
  }
}

void dump_trace(FILE *f, int depth) {
  for (int k = 0; k < depth; k++) {
    struct trace_entry e = trace_buffer[(idx + TRACE_DEPTH - k) % TRACE_DEPTH];
    FPRINTF(f, "PC=%08X:[%08X] %-21s ", pc, e.ir, mnemonic(e.ir));
  }
}

void init_sp(uint32_t addr) {
  write_reg(x, 2, addr);
}


bool cpu_load_insn(struct decode_info dc) {
  bool valid = false;
  uint32_t addr = (x[dc.rs1]) + (dc.simm_I);
  uint32_t waddr = addr32(addr);
  /*if (trace_instr)
    fprintf(stdout, "MEM[%d+%d=%d]\n", (int)(x[dc.rs1]), dc.simm_I, addr);*/

#if 0
			if (is_io_access(addr)) {
				fprintf(stderr, "IO read not yet supported x=%08X, imm=%08X, addr=%016X, waddr=%08X\n", x[dc.rs1], dc.simm_I, addr,waddr) ;
				valid = false;
				break;
			}
#endif
  uint8_t offset = byte_offset(addr);
  if (is_io_access(addr)) {
    valid = false;
  } else {
    uint32_t data =
        pack_bytes(mem0[waddr], mem1[waddr], mem2[waddr], mem3[waddr]);
    switch (dc.funct3) {
    case RISCV_LD_LBU :
      valid = true;
      break;
    case RISCV_LD_LB :
      valid = true;
      break;
    case RISCV_LD_LW:
      valid = (offset % 4) == 0;
      break;
    case RISCV_LD_LH:
      valid = (offset % 2) == 0;
      break;
    case RISCV_LD_LHU:
      valid = (offset % 2) == 0;
      break;
    }

    switch (dc.funct3) {
    case RISCV_LD_LB:
      data = (int8_t)extract_byte(data, offset);
      break;
    case RISCV_LD_LBU:
      data = extract_byte(data, offset);
      break;
    case RISCV_LD_LW:
      data = cpu_memread_u32(addr);
      break;
    case RISCV_LD_LH:
      data = (int16_t)extract_half(data, offset);
      break;
    case RISCV_LD_LHU:
      data = extract_half(data, offset);
      break;
    }
    write_reg(x, dc.rd, data);
  }

  return valid;
}

bool cpu_store_insn(struct decode_info dc) {
  bool valid = true;
  uint32_t addr = ((int)x[dc.rs1]) + (dc.simm_S);
  uint32_t waddr = addr32(addr);
  uint32_t offset = byte_offset(addr);

  switch (dc.funct3) {
  case RISCV_ST_SW: {
    valid = (offset % 4) == 0;
    if (!valid)
      fprintf(stderr,
              "Unaligned write not supported x=%08X, imm=%08X, addr=%08X\n",
              (int)(x[dc.rs1]), dc.simm_S, addr);

    if (is_io_access(addr)) {
      if (trace_instr)
        fprintf(stdout, "IO[%08X+%08X=%08X]", (int)(x[dc.rs1]), dc.simm_S,
                addr);
      cpu_iowrite_u32(addr, x[dc.rs2]);
    } else if (is_tohost(addr)) {
      fprintf(stderr, "tohost 0x%08x\n", x[dc.rs2]);
      next_pc = pc;
      halted = true;
    } else {
      /*if (trace_instr)
        fprintf(stdout, "MEM[%08X+%08X=%08X]\n", (int)(x[dc.rs1]), dc.simm_S,
                addr);*/
      cpu_memwrite_u32(addr, x[dc.rs2]);
    }
    break;
  }
  case RISCV_ST_SH: {
    valid = (offset % 2) == 0;
    if (is_io_access(addr)) {
      PRINTF("Unsupported IO SH operation\n");
      valid = false;
    } else {
      switch (offset) {
      case 0: {
        mem0[waddr] = extract_byte(x[dc.rs2], 0);
        mem1[waddr] = extract_byte(x[dc.rs2], 1);
        break;
      }
      case 2:
        mem2[waddr] = extract_byte(x[dc.rs2], 0);
        mem3[waddr] = extract_byte(x[dc.rs2], 1);
        break;
      }
    }
    break;
  }
  case RISCV_ST_SB: {
    if (is_io_access(addr)) {
      cpu_iowrite_u8(addr, x[dc.rs2]);
      // getchar();
    } else {
      valid = true; //(offset % 4) == 0;
      char value = extract_byte(x[dc.rs2], 0);
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
    break;
  }
  default:
    valid = false;
    break;
  }

  return valid;
}

void cpu_branch_insn(struct decode_info dc, bool taken) {
  if (taken) {
    next_pc = pc + dc.br_offset;
  }
}

bool cpu_sys_insn(struct decode_info dc) {
  bool valid = true;
  uint32_t csridx = dc.imm_I;
  uint32_t tmp = csr[csridx];

  switch (dc.funct3) {
  case RISCV_SYS_PRIVILEGED: {
    switch (dc.imm_I) {
    case RISCV_SYS_ECALL: {
      csr[RISCV_CSR_MEPC] = pc;
      next_pc = csr[RISCV_CSR_MTVEC];
      csr[RISCV_CSR_MCAUSE] = EXCEPTION_ECALL_M;
      printf("syscall %d (%d,%d,%d)\n", x[17], x[10], x[11], x[12]);
      fflush(stdout);
      if (x[17] == 93 /* SYS_EXIT */)
        halted = true;
      break;
    }
    case RISCV_SYS_EBREAK: {
      csr[RISCV_CSR_MCAUSE] = EXCEPTION_BKPT;
      next_pc = pc;
      halted = true;
      break;
    }
    case RISCV_SYS_SRET:
      next_pc = csr[RISCV_CSR_MEPC];
      break;
    case RISCV_SYS_URET:
      next_pc = csr[RISCV_CSR_MEPC];
      break;
    case RISCV_SYS_MRET:
      next_pc = csr[RISCV_CSR_MEPC];
      break;
    case RISCV_SYS_WFI:
      next_pc = pc;
      break; // WFI : wait for interrupt
    default:
      valid = false;
      break;
    }
    break;
  }
  case RISCV_CSRRW:
    csr[csridx] = x[dc.rs1];
    write_reg(x, dc.rd, tmp);
    break;
  case RISCV_CSRRS:
    csr[csridx] = x[dc.rs1] | tmp;
    write_reg(x, dc.rd, tmp);
    break;
  case RISCV_CSRRC:
    csr[csridx] = tmp & (~x[dc.rs1]);
    write_reg(x, dc.rd, tmp);
    break;
  case RISCV_CSRRWI:
    csr[csridx] = dc.rs1;
    write_reg(x, dc.rd, tmp);
    break;
  case RISCV_CSRRSI:
    csr[csridx] = dc.rs1 | tmp;
    write_reg(x, dc.rd, tmp);
    break;
  case RISCV_CSRRCI:
    csr[csridx] = tmp & (~dc.rs1);
    write_reg(x, dc.rd, tmp);
    break;
  default:
    valid = false;
    break;
  }

  return valid;
}

uint32_t cpu_step() {

  char shcpt = -1;
  unsigned int rs1, rs2, ir;
  struct decode_info dc;
  int simm_I;
  unsigned int addr;
  unsigned char byte0 = 0;
  unsigned char byte1 = 0;
  unsigned char byte2 = 0;
  unsigned char byte3 = 0;
  //unsigned int next_pc;
  unsigned int data;
  unsigned int hartid = 1;
  unsigned int waddr;
  unsigned int offset;
  unsigned int csridx;
  unsigned int tmp;
  unsigned int op1;
  unsigned int op2;
  bool taken;

  bool valid = false;

  if (irq) {
    csr[RISCV_CSR_MCAUSE] = MCAUSE32_INT;
    csr[RISCV_CSR_MEPC] = pc;
    next_pc = csr[RISCV_CSR_MTVEC];
  } else {
    addr = addr32(pc);
    ir = pack_bytes(mem0[addr], mem1[addr], mem2[addr], mem3[addr]);

    dc = decode(ir);
#ifndef __SYNTHESIS__
    trace_insn_dc(pc, ir, x[dc.rs1], x[dc.rs1]);
#endif

    next_pc = pc + 4;
    valid = true;

    switch (dc.opcode) {

    case RISCV_LUI: {
      write_reg(x, dc.rd, dc.imm_U);
      break;
    }
    case RISCV_AUIPC: {
      write_reg(x, dc.rd, pc + dc.imm_U);
      break;
    }
    case RISCV_OPI: {
      switch (dc.funct3) {
      case RISCV_OPI_ADDI: {
        write_reg(x, dc.rd, x[dc.rs1] + dc.simm_I);
        break;
      }
      case RISCV_OPI_ANDI: {
        write_reg(x, dc.rd, x[dc.rs1] & dc.simm_I);
        break;
      }
      case RISCV_OPI_ORI: {
        write_reg(x, dc.rd, x[dc.rs1] | dc.simm_I);
        break;
      }
      case RISCV_OPI_XORI: {
        write_reg(x, dc.rd, x[dc.rs1] ^ dc.simm_I);
        break;
      }
      case RISCV_OPI_SLTI: {
        write_reg(x, dc.rd, ((int)x[dc.rs1] < dc.simm_I) ? 1 : 0);
        break;
      }
      case RISCV_OPI_SLTIU: {
        write_reg(x, dc.rd, (x[dc.rs1] < dc.simm_I) ? 1 : 0);
        break;
      }
      case RISCV_OPI_SRI: {
        valid = true;
        if (dc.funct7 == RISCV_OPI_SRI_SRAI) {
          write_reg(x, dc.rd, (((int)x[dc.rs1]) >> dc.shamt));
        } else if (dc.funct7 == RISCV_OPI_SRI_SRLI) {
          write_reg(x, dc.rd, (x[dc.rs1] >> dc.shamt));
        } else
          valid = false;
        break;
      }
      case RISCV_OPI_SLLI: {
        write_reg(x, dc.rd, (x[dc.rs1] << (dc.shamt)));
        break;
      }
      }
      break;
    }
    case RISCV_OP: {
      switch (dc.funct3) {
      case RISCV_OP_ADD: {
        if (dc.funct7 == RISCV_OP_ADD_ADD) {
          write_reg(x, dc.rd, x[dc.rs1] + x[dc.rs2]);
        } else if (dc.funct7 == RISCV_OP_ADD_SUB) {
          write_reg(x, dc.rd, x[dc.rs1] - x[dc.rs2]);
        } else
          valid = false;
        break;
      }
      case RISCV_OP_AND: {
        write_reg(x, dc.rd, x[dc.rs1] & x[dc.rs2]);
        break;
      }
      case RISCV_OP_OR: {
        write_reg(x, dc.rd, x[dc.rs1] | x[dc.rs2]);
        break;
      }
      case RISCV_OP_XOR: {
        write_reg(x, dc.rd, x[dc.rs1] ^ x[dc.rs2]);
        break;
      }
      case RISCV_OP_SLT: {
        write_reg(x, dc.rd, (int32_t)x[dc.rs1] < (int32_t)x[dc.rs2] ? 1 : 0);
        break;
      }
      case RISCV_OP_SLTU: {
        write_reg(x, dc.rd, x[dc.rs1] < x[dc.rs2] ? 1 : 0);
        break;
      }
      case RISCV_OP_SLL: {
        write_reg(x, dc.rd, x[dc.rs1] << x[dc.rs2]);
        break;
      }
      case RISCV_OP_SR: {
        switch (dc.funct7) {
        case RISCV_OP_SR_SRA: {
          write_reg(x, dc.rd, (int32_t)x[dc.rs1] >> x[dc.rs2]);
          break;
        }
        case RISCV_OP_SR_SRL: {
          write_reg(x, dc.rd, x[dc.rs1] >> x[dc.rs2]);
          break;
        }
        }
        break;
      }
      }
      break;
    }
#ifndef NO_BRANCH
    case RISCV_BR: {
      switch (dc.funct3) {
      case RISCV_BR_BEQ: {
        cpu_branch_insn(dc, x[dc.rs1] == x[dc.rs2]);
        break;
      }
      case RISCV_BR_BLT: {
        cpu_branch_insn(dc, (int32_t)x[dc.rs1] < (int32_t)x[dc.rs2]);
        break;
      }
      case RISCV_BR_BNE: {
        cpu_branch_insn(dc, x[dc.rs1] != x[dc.rs2]);
        break;
      }
      case RISCV_BR_BGE: {
        cpu_branch_insn(dc, (int32_t)x[dc.rs1] >= (int32_t)x[dc.rs2]);
        break;
      }
      case RISCV_BR_BGEU: {
        cpu_branch_insn(dc, x[dc.rs1] >= x[dc.rs2]);
        break;
      }
      case RISCV_BR_BLTU: {
        cpu_branch_insn(dc, x[dc.rs1] < x[dc.rs2]);
        break;
      }
      default:
        valid = false;
        break;
      }
      break;
    }
    case RISCV_JAL: {
      write_reg(x, dc.rd, next_pc);
      next_pc = pc + dc.simm_J;
      break;
    }
    case RISCV_JALR: {
      uint32_t rs1_value = x[dc.rs1]; /* Handle the case where rs1 == rd */
      write_reg(x, dc.rd, next_pc);
      next_pc = rs1_value + dc.simm_I;
      break;
    }
#endif
#ifndef NO_LDST
    case RISCV_ST:
      valid = cpu_store_insn(dc);
      break;
    case RISCV_LD:
      valid = cpu_load_insn(dc);
      break;
#endif
#ifndef NO_SYSCALL
    case RISCV_SYS:
      valid = cpu_sys_insn(dc);
      break;
#endif
    case RISCV_MM_FENCE:
      break;
    default:
      valid = false;
      break;
    }

#ifndef __SYNTHESIS__
    trace_insn_ex(x[dc.rd]);
#endif
    csr[RISCV_CSR_MINSTRET] = insncnt;

    if (valid) {
      insncnt++;
      pc = next_pc;
      if (pc % 4 != 0) {
        PRINTF("Unaligned insn address at PC=%08X\n", pc);
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
