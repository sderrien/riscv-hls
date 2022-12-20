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


#define MEMSIZE 0x10000




int cpu_load(uint32_t addr) ;
void cpu_store(uint32_t addr,uint8_t data) ;
int cpu_getreg(uint16_t id);
int cpu_setreg(uint16_t id,uint32_t value);


pthread_t id[2];
extern bool halted;
bool interrupt= false;
bool init_device(char *device) {
	printf("Mocking device %s for ISS simulator \n", device);
	return true;
}

void* cpu_thread(void* arg) {
	halted=false;
	while(!halted) {
		cpu_step(false);
		if (interrupt) break;
	}
	printf("Exiting thread\n");
	pthread_exit(arg);
}

//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
int cpu_run() {
	pthread_create(&id[0], NULL, cpu_thread,NULL);
	return 1;
}


//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)
int cpu_halt() {
	printf("Halting CPU\n");
	interrupt = true;
	pthread_join(id[0],NULL);
	interrupt = false;
	printf("CPU thread synched\n");
	sleep(2);
	return 1;
}



uint32_t read_reg(uint16_t id) {
	return cpu_getreg(id);
}

void write_reg(uint16_t id, uint32_t value) {
	cpu_setreg(id, value);
}

uint8_t read_mem(uint32_t addr)  {
	return cpu_load(addr);
}

void write_mem(uint32_t addr, uint8_t data)  {
	cpu_store(addr, data);
}

void write_insn(uint32_t addr, uint32_t value) {
	if ((addr%4)!=0) {
		printf("Unaligned insn write\n");
		exit(-1);
	} else {
		cpu_store(addr,value);
		cpu_store(addr+1,value>>8);
		cpu_store(addr+2,value>>16);
		cpu_store(addr+3,value>>24);
	}
}

uint32_t read_insn(uint32_t addr) {
	return  cpu_load(addr) |
			cpu_load(addr+1)<<8 |
			cpu_load(addr+1)<<16 |
			cpu_load(addr+1)<<24 ;
			;
}

bool is_valid_addr(uint32_t addr) {
	return true;
}
