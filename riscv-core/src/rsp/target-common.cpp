
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

int init_device();
bool has_byte();
int read_byte();
void write_byte(unsigned char data);

unsigned int read_hex(int size) {
	int k = 0;
	unsigned int value=0;
	for (k=0;k<size;k++) {
		unsigned char digit = read_byte();
		if (digit>='0' && digit<='9' ) {
			digit -= '0';
		} else if (digit>='A' && digit<='F') {
			digit -= 'A'-10;
		} else {
			digit = 0;
		}
		value = value | (digit<< (4*k));
	}
	return value;
}

unsigned int read_u32() {
	return read_hex(8);
}

unsigned int read_u16() {
	return read_hex(4);
}

unsigned int read_u8() {
	return read_hex(2);
}

void write_hex(uint8_t digit) {
	int c = digit;
	if (digit<10) {
		digit +='0';
	} else {
		digit += ('A'-10);
	}
	write_byte(digit);
	//printf(" %01X->%c : ",c,digit);

}


void write_uxx(uint32_t value, uint8_t size) {
	for (int k=0;k<size;k++) {
		write_hex((value)&0xF);
		value = value >> 4;
	}
}

void write_u32( uint32_t value) {
	//printf("Sending %08X ->",value);
	write_uxx(value, 8);
	//printf("\n");
}

void write_u16(uint16_t value) {
	write_uxx(value, 4);
}

void write_u8(uint16_t value) {
	write_uxx(value, 2);
}

int cpu_reset(void){
	write_byte(RESET);
	return 1;
}

void flush() {
	while (has_byte()) {
		int c = read_byte();
		printf("%c", c);
		fflush(stdout);
	}
}

int add_hw_bkpt(u32 addr) {
	write_byte(SET_BKPT);
	write_u32(addr);
	return 1;
}

int remove_hw_bkpt(u32 addr) {
	write_byte(UNSET_BKPT);
	write_u32(addr);
	return 1;
}

int cpu_run() {
	write_byte(RUN);
	return 1;
}

int cpu_step(bool irq) {
	printf("Sending command %c\n",STEP);
	write_byte(STEP);
	return 1;
}

int cpu_halt() {
	write_byte(HALT);
	return 1;
}

void write_reg(uint16_t id, uint32_t value) {
	//printf("write reg %d\n",id);
	write_byte(WRITE_MEM);
	write_u8(id);
	write_u32(value);
}

uint32_t read_reg(uint16_t id) {
	printf("read reg %d\n",id);
	write_byte(READ_REG);
	write_u8(id);
	return read_u32();
}

int get_pc() {
	return read_reg(32);
}

void write_mem(uint32_t addr, uint8_t value) {
	//printf("write mem %d\n",addr);
	write_byte(WRITE_MEM);
	write_u32(addr);
	write_u8(value);
}

uint8_t read_mem(uint32_t addr) {
	//printf("read mem %d\n",addr);
	write_byte(READ_MEM);
	write_u32(addr);
	return read_u8();
}


bool is_valid_addr(uint32_t addr) {
	return 1;
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
