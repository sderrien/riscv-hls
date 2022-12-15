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
#include "../rsp/rsp-server.h"
#include "../rsp/target.h"

int cpu_step() ;
int cpu_reset() ;
int cpu_halt() ;
int cpu_run() ;
int add_hw_bkpt(u32 addr);
int remove_hw_bkpt(u32 addr);

#define MEMSIZE 0x10000

extern unsigned char mem0[MEMSIZE/4];
extern unsigned char mem1[MEMSIZE/4];
extern unsigned char mem2[MEMSIZE/4];
extern unsigned char mem3[MEMSIZE/4];

extern unsigned int pc;
extern unsigned int x[32];
extern unsigned int csr[4096];

void init_device(char *device) {

}

uint32_t read_reg(uint16_t id) {
	if (id>=0 && id <32) {
		return x[id];
	} else if (id==32){
		return pc;
	} else if (id<4096 ){
		return csr[id];
	} else {
		printf("error");return -1;
	}
}

void write_reg(uint16_t id, uint32_t value) {
	if (id>=0 && id <32) {
		x[id]=value;
	} else if (id==32){
		pc=value;
	} else {
		csr[id]=value;
	}
}

uint8_t read_mem(uint32_t addr)  {
	switch (addr%4) {
	case 0: {return mem0[addr>>2];break;}
	case 1: {return mem1[addr>>2];break;}
	case 2: {return mem2[addr>>2];break;}
	case 3: {return mem3[addr>>2];break;}
	}
}

void write_mem(uint32_t addr, uint8_t value)  {
	switch (addr%4) {
	case 0: {mem0[addr>>2]=value;break;}
	case 1: {mem1[addr>>2]=value;break;}
	case 2: {mem2[addr>>2]=value;break;}
	case 3: {mem3[addr>>2]=value;break;}
	}
}

void write_insn(uint32_t addr, uint32_t value) {
	write_mem(addr+0, (value>>0) &0xFF);
	write_mem(addr+1, (value>>8) &0xFF);
	write_mem(addr+2, (value>>16) &0xFF);
	write_mem(addr+3, (value>>24) &0xFF);
}

uint32_t read_insn(uint32_t addr) {
	unsigned char byte0 = read_mem(addr+0);
	unsigned char byte1 = read_mem(addr+1);
	unsigned char byte2 = read_mem(addr+2);
	unsigned char byte3 = read_mem(addr+3);
	return (byte3<<24)| (byte2<<16) | (byte1<<8) | byte0;
}

bool is_valid_addr(uint32_t addr) {
	return true;
}
