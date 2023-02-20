#ifndef SIMSUPPORT_HEADER
#define SIMSUPPORT_HEADER

#include <riscv-iss.h>
#include <stdint.h>
#include <stdio.h>

typedef uint32_t u32;
typedef uint64_t u64;
typedef int32_t i32;
typedef int64_t i64;
typedef uint8_t u8;
typedef uint16_t u16;

#define EBREAK 0x00100073

uint32_t debug_run();
uint32_t debug_halt();
uint32_t debug_wait();
uint32_t debug_step();
uint32_t debug_reset();
uint32_t debug_get_pc();

int debug_add_hw_bkpt(u32 addr);
int debug_remove_hw_bkpt(u32 addr);
void debug_write_reg(uint16_t id, uint32_t value);
uint32_t debug_read_reg(uint16_t id);
void debug_write_mem(uint32_t addr, uint8_t value);
uint8_t debug_read_mem(uint32_t addr);
bool debug_is_valid_addr(uint32_t addr);
void debug_write_insn(uint32_t addr, uint32_t value);
uint32_t debug_read_insn(uint32_t addr);

#endif
