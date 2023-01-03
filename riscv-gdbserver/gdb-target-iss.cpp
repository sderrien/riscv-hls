#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <termios.h>
#include <unistd.h>

#include<stdlib.h>
#include<signal.h>
#include<stdint.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include <pthread.h>
#include <gdb-server.h>
#include <gdb-target.h>
#include <riscv-iss.h>



pthread_t iss_thread;
extern bool halted;
bool interrupt= false;

void write_to_stdout(int data) {
	printf("%c",data);fflush(stdout);
}

extern bool trace_instr;

bool server_init_device(const char *device) {
	printf("Mocking device %s for ISS simulator \n", device);
	trace_instr= false;
	return true;
}

void* cpu_thread(void* arg) {
	halted=false;
	printf("Starting CPU thread from PC=%08XC\n",cpu_getpc());
	while(!halted) {
		cpu_step();
		if (interrupt) {
			halted=true;
			printf("Exiting ISS thread due to CTRL-C\n");
		}
	}
	if (halted) {
		printf("Exiting ISS thread due to breakpoint or exception\n");
	}
	pthread_exit(arg);
}



uint32_t debug_reset(){
	cpu_reset();
	return 1;
}

uint32_t debug_get_pc() {
	return cpu_getpc();
}

//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
uint32_t debug_run() {
	pthread_create(&iss_thread, NULL, cpu_thread,NULL);
	return 1;
}

//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
uint32_t debug_wait() {
	pthread_join(iss_thread, NULL);
	return 1;
}


//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
uint32_t debug_step() {
	cpu_step();
	return 1;
}

//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
uint32_t debug_halt() {
	printf("Sending interrupt to ISS thread\n");
	interrupt = true;
	pthread_join(iss_thread, NULL);
	interrupt = true;
	printf("ISS and gdbserver threads synched\n");
	return 1;
}



uint32_t debug_read_reg(uint16_t id) {
	return cpu_getreg(id);
}

void debug_write_reg(uint16_t id, uint32_t value) {
	cpu_setreg(id, value);
}

uint8_t debug_read_mem(uint32_t addr)  {
	return cpu_memread_u8(addr);
}

void debug_write_mem(uint32_t addr, uint8_t data)  {
	cpu_memwrite_u8(addr, data);
}

void debug_write_insn(uint32_t addr, uint32_t value) {
	if ((addr%4)!=0) {
		printf("Unaligned insn write\n");
		exit(-1);
	} else {
		cpu_memwrite_u32(addr,value);
	}
}

uint32_t debug_read_insn(uint32_t addr) {
	return cpu_memread_u32(addr);
}

bool debug_is_valid_addr(uint32_t addr) {
	return true;
}

int debug_add_hw_bkpt(unsigned int addr) {
	return add_hw_bkpt(addr);
}
