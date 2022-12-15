#ifndef SIMSUPPORT_HEADER
#define SIMSUPPORT_HEADER

#include <stdio.h>
#include <stdint.h>

typedef uint32_t u32;
typedef uint64_t u64;
typedef int32_t i32;
typedef int64_t i64;
typedef uint8_t u8;
typedef uint16_t u16;

#define EBREAK 0x00100073

enum t_cmd {
	RESET = '!',
	HALT = 'H',
	READ_MEM = 'M',
	WRITE_MEM = 'W',
	READ_REG = 'R',
	WRITE_REG = 'X',
	SET_BKPT= 'B',
	UNSET_BKPT= 'U',
	STEP = 'S',
	RUN = 'P',
	ID = 'I'
};

#define OK 'O'
#define NOK 'N'

int cpu_step(bool irq) ;
int cpu_reset() ;
int cpu_halt() ;
int cpu_run() ;
int add_hw_bkpt(u32 addr);
int remove_hw_bkpt(u32 addr);
void write_reg(uint16_t id, uint32_t value) ;
uint32_t read_reg(uint16_t id) ;
void write_mem(uint32_t addr, uint8_t value) ;
uint8_t read_mem(uint32_t addr) ;
bool is_valid_addr(uint32_t addr);
void write_insn(uint32_t addr, uint32_t value) ;
uint32_t read_insn(uint32_t addr) ;

#endif
