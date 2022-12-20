
#define MEMSIZE 4096

#ifndef __SYNTHESIS__
#include<stdio.h>
#include<stdlib.h>
#include<signal.h>
#include<stdint.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#endif


#ifdef __SYNTHESIS__

#define FFLUSH(...)
#define PRINTF(...)
#define FPRINTF(...)
#define EXIT(a)

#else

#define EXIT(c) exit(c)
#define FFLUSH(...) {  fflush(__VA_ARGS__); }
#define PRINTF(...) { printf( __VA_ARGS__) ; fflush(stdout); }
#define FPRINTF(...) fprintf( __VA_ARGS__)

#endif


#include <gdb-target.h>
#include <rvi32.h>

#ifndef __SYNTHESIS__

FILE *in_trace , *out_trace = NULL;

void trace_out(unsigned char value) {
	if (out_trace == NULL) {
		out_trace  = fopen("uart_server_out.txt", "w");
		if (out_trace  == NULL)
			exit(-2);
	}
	FPRINTF(out_trace , "%c", (char ) value);
	FFLUSH(out_trace );
}

void trace_in(unsigned char value) {
	if (in_trace == NULL) {
		in_trace  = fopen("uart_server_in.txt", "w");
		if (in_trace  == NULL)
			exit(-2);
	}
	FPRINTF(in_trace , "%c", (char ) value);
	fflush(in_trace );
}
#endif
unsigned char c;
bool hasbyte=false;

bool has_byte(volatile unsigned int *uart) {
#ifdef __SYNTHESIS__
	return ((uart[2] & 0x1));
#else
#ifdef __TTY__
	return true;
#else
	if (!hasbyte)
		hasbyte= (read(uart[0], &c, sizeof(char))==1);
	return hasbyte;
#endif
#endif
}

int read_byte(volatile unsigned int *uart) {
#ifdef __SYNTHESIS__
	while ((uart[2] & 0x1)==0);
	return uart[0];
#else
#ifdef __TTY__
	return true;
#else
	int cpt =0;
	while (!has_byte(uart)) {
		if (cpt > 0x100) {
			cpt=0;
			FFLUSH(stdout);
			usleep(1000);
		} else {
			cpt++;
		}
	}
	//trace_in(c);
	//printf("Received %c/%02X\n",c,c);
	hasbyte=0;
	return c;
#endif
#endif
}



void write_byte(volatile unsigned int *uart, unsigned char data) {
#ifdef __SYNTHESIS__
	int x;
	for (int k=0;k<0x1000;k++) {
		x= uart[2];
	}
	while ((uart[2] & 0x2)!=0);
	uart[1] = data;
	return;
#else
#ifdef __TTY__
	putc((char) data, stdout);
	FFLUSH(stdout);
#else
	FPRINTF(stdout,"%c",data);FFLUSH(stdout);
	trace_out(data);
	write(uart[1],&data, sizeof(char));
#endif
#endif
}

void write_string(volatile unsigned int *uart, const char mess[]) {
	int k = 0, x;
	do {
		write_byte(uart, 0x80 | mess[k++]);

	} while (mess[k] != 0);
	return;
}

void write_u32(volatile unsigned int *uart, unsigned int value) {
	int k = 0, x;
	for (k = 0; k < 8; k++) {
		int digit = ((value >> (4*k)) & 0xF);
		if (digit < 10) {
			digit += '0';
		} else {
			digit += ('A' - 10);
		}
		write_byte(uart, digit);
	}
	return;
}

void write_u8(volatile unsigned int *uart, unsigned char value) {
	int k = 0, x;
	for (k = 0; k < 2; k++) {
		int digit = ((value >> (4*k)) & 0xF);
		if (digit < 10) {
			digit += '0';
		} else {
			digit += ('A' - 10);
		}
		write_byte(uart, digit);
	}
	return;
}

unsigned char get_digit(volatile unsigned int *uart) {
	int digit = read_byte(uart);
	int c = digit;
	if (digit >= '0' && digit <= '9') {
		digit -= '0';
	} else if (digit >= 'A' && digit <= 'F') {
		digit -= ('A' - 10);
	} else {
		digit = 0;
	}
	//printf("\n%c->%01X\n",c,digit);
	return digit;
}

unsigned int read_u8(volatile unsigned int *uart) {
	int k = 0;
	unsigned int value=0;
	for (k = 0; k < 2; k++) {
		unsigned char digit = get_digit(uart);
		value = value | (digit<< (4*k));
	}
	return value;
}

unsigned int read_u32(volatile unsigned int *uart) {
	int k = 0;
	unsigned int value=0;
	for (k = 0; k < 8; k++) {
		unsigned char digit;
		digit = get_digit(uart);
		value = value | (digit<< (4*k));
	}
	return value;
}

#define REGSIZE 32

extern int x[REGSIZE];

extern unsigned int pc;


uint32_t cpu_step(bool irq);
int cpu_load(uint32_t addr);
void cpu_store(uint32_t addr,uint8_t data);
int cpu_reset();

extern bool halted ;
int cmd_count = 0xAB000000;


void process_debug_command(volatile unsigned int *uart,volatile unsigned int *ir) {
	int cmd ;

	cmd = read_byte(uart);
	unsigned int c, sseg = 0;
	*ir = 0xCAFE;
	switch (cmd) {
	case HALT:
		printf("->Halt\n");
		*ir = cmd_count | 0xDEAD;
		halted = true;
		//write_byte(uart, OK);
		break;
	case STATUS:
		printf("->Halt\n");
		*ir = cmd_count | 0xDEAD;
		if (halted)
			write_byte(uart, OK);
		else
			write_byte(uart, NOK);
		break;
	case READ_MEM:
		if (halted) {
			*ir = cmd_count | 0xCAFE;

			//printf("->Read mem ");
			unsigned int addr = read_u32(uart);
			unsigned int data ;
			data = cpu_load(addr);
			//printf("[%08X]=%02X ; {%02X,%02X,%02X,%02X}\n",addr,data,mem0[addr>>2],mem1[addr>>2],mem2[addr>>2],mem3[addr>>2]);FFLUSH(stdout);
			write_u8(uart, data);
			//write_byte(uart, OK);
		} else {
			//printf("->Can't read mem (not halted)\n");
			//write_byte(uart, NOK);
		}
		break;
	case WRITE_MEM:
		if (halted) {
			*ir = cmd_count | 0xBABE;
			//printf("-> Write mem");FFLUSH(stdout);
			unsigned int addr = read_u32(uart);
			//write_byte(uart, OK);
			unsigned int data = read_u8(uart);
			cpu_store(addr, data);
		}
		break;
	case READ_REG:
		if (halted) {
			*ir = cmd_count | 0xFACE;
			uint8_t regid;
			// FIXME : This is magic code, uncomment it and you'll be in trouble (gdb will show errors)
			printf(".");
			FFLUSH(stdout);
			// end of magic code
			regid= read_u8(uart);
			if (regid==32) {
				printf("Reading pc=%08X\n",pc);
				write_u32(uart, pc);
			} else {
				printf("Reading x[%d]=%08X\n",regid,x[regid & 0x0F]);
				write_u32(uart, x[regid & 0x0F]);
			}
		}
		break;
	case WRITE_REG:
		printf("Write reg\n");
		if (halted) {
			*ir = cmd_count | 0x1234;
			int regid = read_u8(uart);
			int regvalue = read_u32(uart);
			printf("Write x[%d]=%08X\n",regid,regvalue);
			x[regid & 0x0F] = regvalue;
		}
		break;
	case SET_BKPT: {
		printf("Set BKPT\n");
		int bkptaddr = read_u32(uart);
		if (add_hw_bkpt(bkptaddr)) {
			//write_byte(uart, OK);
		} else {
			//write_byte(uart, NOK);
		}
		break;
	}
	case RESET: {
		cpu_reset();
		break;
	}
	case INFO: {
		printf("Device INFO\n");
		int id = read_u8(uart);
		switch(id) {
			case MISA_INFO:{
				write_u32(uart, EXTENSION_I);
			}
			case MVENDOR_INFO:{
				write_u32(uart, 0xCAFE00);
			}
		}
		write_u32(uart, cpu_info(id));
		break;
	}
	case UNSET_BKPT: {
		printf("Unset BKPT\n");
		int bkptaddr = read_u32(uart);
		if (remove_hw_bkpt(bkptaddr)) {
			//write_byte(uart, OK);
		} else {
			//write_byte(uart, NOK);
		}
		break;
	}
	case STEP: {
		if (halted) {
			*ir = cmd_count | 0xF00D;
			printf("Step PC=%08X\n",pc);
			cpu_step(false);
			sseg = pc;
			write_u32(uart, pc);
		}
		break;
	}
	case RUN: {
		if (halted) {
			*ir = cmd_count | 0xFEED;
			printf("Run from PC=%08X\n",pc);
			halted = false;
		}
		break;
	}
#ifndef __SYNTHESIS__
	case 'Q': {
		system("/bin/stty -raw");
		exit(0);
		break;
	}
#endif

	default: {
		printf("Unknown command %c:%08X\n",cmd,cmd);
		break;
	}
	}

}


int uart_master(volatile bool *debug, volatile bool *step,
		volatile unsigned int *dbg_pc, volatile unsigned int *dbg_ir,
		//volatile unsigned short *leds,
		volatile unsigned int iomap[MEMSIZE]) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE ap_none port=dbg_pc register
#pragma HLS INTERFACE ap_none port=dbg_ir register
#pragma HLS INTERFACE m_axi depth=4 port=iomap offset=direct bundle=mem
	volatile unsigned int *uart;
	int addr;
	unsigned int sseg = 0;

	uart = iomap;
	cpu_reset();
	*dbg_pc = pc;
	*dbg_ir = cmd_count;
	halted = true;
	write_string(uart, "Helloworld from hls-riscv on nexys4-DDR\r\n");
	while (1) {

		if (*step ) {
			*dbg_ir = 0xABBADEDE;
		}
		*dbg_pc = pc;
		if (has_byte(uart)) {
			//write_string(uart, "Command received\r\n");
			cmd_count +=0x00010000 ;
			*dbg_ir = cmd_count | 0xBEEF;
			process_debug_command(uart,dbg_ir);
		}
	}
}


