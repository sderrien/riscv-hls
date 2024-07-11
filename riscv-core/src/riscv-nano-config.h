#ifndef RISCV_CONFIG_H
#define RISCV_CONFIG_H
//#define RISCV_FEMTO

//#define TARGET_ISA "RISCV_FEMTO"
//#define RISCV_FEMTO
//
//#define RISCV_PICO
//#define TARGET_ISA "RISCV_PICO"

//#define RISCV_NANO
//#define TARGET_ISA "RISCV_NANO"

#define RISCV_I32
#define TARGET_ISA "RISCV_I32"
#define BYTE_MEM

#define __SYNTHESIS__

#ifndef TARGET_ISA
#error
#define RISCV_FEMTO
#endif

#define MEMSIZE 0x100000
#define IOSIZE 0x100000

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
#define USE_LUI
#define USE_LD
#define USE_ST
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
#define USE_SLT
#define USE_SLTU
#define USE_SLLI
#define USE_SLL
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

#define USE_SYS
#endif
#endif
