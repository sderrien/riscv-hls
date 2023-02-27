#include <stdint.h>

#define MEMSIZE 0x10000000
#define IOSIZE 0x10000000

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
