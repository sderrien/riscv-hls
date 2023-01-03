
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
#include <stdint.h>

#include <gdb-server.h>
#include <gdb-target.h>
#include <riscv-iss.h>
#include <channels.h>
#include <riscv-debug.h>

#ifdef VERBOSE
#define debug(...) { printf( __VA_ARGS__) ; fflush(stdout); }
#else
#define debug(...)
#endif


unsigned int read_hex(int size) {
	int k = 0;
	unsigned int value=0;
	for (k=0;k<size;k++) {
		unsigned char digit = server_read_byte();
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
	server_write_byte(digit);
}

void write_uxx(uint32_t value, uint8_t size) {
	for (int k=0;k<size;k++) {
		write_hex((value)&0xF);
		value = value >> 4;
	}
}

void write_u32( uint32_t value) {
	write_uxx(value, 8);
}

void write_u16(uint16_t value) {
	write_uxx(value, 4);
}

void write_u8(uint16_t value) {
	write_uxx(value, 2);
}


bool wait_client_ack() {
	int res;
	res = server_read_byte();
	while(res!=OK) {
		debug("received %02X:%c , expected %02X\n",res,res,OK);
		res = server_read_byte();
	}
	return true;
}

uint32_t debug_reset(){
	server_write_byte(RESET);
	wait_client_ack();
	return 1;
}

uint32_t debug_get_pc() {
	return debug_read_reg(32);
}

void debug_flush() {
	debug("flushing\n");
	while (server_has_byte()) {
		int c = server_read_byte();
		debug("%c", c);
		fflush(stdout);
	}
}

int debug_add_hw_bkpt(u32 addr) {
	server_write_byte(SET_BKPT);
	write_u32(addr);
	wait_client_ack();
	return 1;
}

int debug_remove_hw_bkpt(u32 addr) {
	server_write_byte(UNSET_BKPT);
	write_u32(addr);
	wait_client_ack();
	return 1;
}

uint32_t debug_run() {
	debug("sending run command\n");
	server_write_byte(RUN);
	uint32_t u32 = read_u32();
	wait_client_ack();
	return 1;
}

uint32_t debug_step() {
	debug("sending step command\n");
	server_write_byte(STEP);
	uint32_t u32 = read_u32();
	wait_client_ack();
	return u32;
}

uint32_t debug_halt() {
	debug("sending halt command\n");
	server_write_byte(HALT);
	uint32_t u32 = read_u32();
	wait_client_ack();
	return u32;
}

//int pthread_create(pthread_t *restrict tidp, const pthread_attr_t *restrict attr, void *(*start_rtn)(void), void *restrict arg)


bool debug_is_halted() {
	//printf("Sending command %c\n",STATUS);
	server_write_byte(STATUS);
	uint8_t status = read_u32();
	wait_client_ack();
	return status!=0;
}

uint32_t debug_wait() {
	while(!debug_is_halted()) {
		usleep(1000);
	}
	return 1;
}

uint32_t debug_info(uint8_t id) {
	//printf("Sending command %c\n",STEP);
	server_write_byte(INFO);
	write_u8(id);
	uint32_t u32 = read_u32();
	wait_client_ack();
	return u32;
}

void debug_write_reg(uint16_t id, uint32_t value) {
	debug("sending write_reg(%02X, %08X)\n",id,value);
	server_write_byte(WRITE_MEM);
	write_u8(id);
	write_u32(value);
	wait_client_ack();
}

uint32_t debug_read_reg(uint16_t id) {
	debug("sending read_reg(%02X)\n",id);
	server_write_byte(READ_REG);
	write_u8(id);
	uint32_t res = read_u32();
	debug("	-> read %08X\n",res);
	wait_client_ack();
	return res;
}


void debug_write_mem(uint32_t addr, uint8_t value) {
	server_write_byte(WRITE_MEM);
	write_u32(addr);
	write_u8(value);
	wait_client_ack();
}

uint8_t debug_read_mem(uint32_t addr) {
	//printf("read mem %d\n",addr);
	server_write_byte(READ_MEM);
	write_u32(addr);
	uint8_t res =read_u8();
	wait_client_ack();
	return res;
}


bool debug_is_valid_addr(uint32_t addr) {
	return 1;
}

void debug_write_insn(uint32_t addr, uint32_t value) {
	debug_write_mem(addr+0, (value>>0) &0xFF);
	debug_write_mem(addr+1, (value>>8) &0xFF);
	debug_write_mem(addr+2, (value>>16) &0xFF);
	debug_write_mem(addr+3, (value>>24) &0xFF);
}

uint32_t debug_read_insn(uint32_t addr) {
	unsigned char byte0 = debug_read_mem(addr+0);
	unsigned char byte1 = debug_read_mem(addr+1);
	unsigned char byte2 = debug_read_mem(addr+2);
	unsigned char byte3 = debug_read_mem(addr+3);
	return (byte3<<24)| (byte2<<16) | (byte1<<8) | byte0;
}
