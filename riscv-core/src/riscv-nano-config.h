//#define RISCV_PICO
//#define RISCV_FEMTO
//#define RISCV_PICO

#define RISCV_NANO
#define MEMSIZE 0x10000000
#define IOSIZE 0x10000000

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
