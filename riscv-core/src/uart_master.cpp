#ifndef __SYNTHESIS__
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <gdb-target.h>
#include <riscv-iss.h>
#include <riscv-debug.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <channels.h>

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




bool has_byte(volatile unsigned int *uart) {
#ifdef __SYNTHESIS__
	return ((uart[2] & 0x1));
#else
#ifdef __TTY__
	return true;
#else
	return client_has_byte();
#endif
#endif
}

int read_byte(volatile unsigned int *uart) {
#ifdef __SYNTHESIS__
	while ((uart[2] & 0x1)==0);
	return uart[0];
#else
	return client_read_byte();
#endif
}

#define TX_FULL_MASK 0x8
//#define TX_FULL_MASK 0x2 //should be 0x according to doc

void write_byte(volatile unsigned int *uart, unsigned char data) {
#ifdef __SYNTHESIS__
	int x;
	while ((uart[2] & TX_FULL_MASK)!=0);
	uart[1] = data;
	return;
#else
	return client_write_byte(data);
#endif
}

void write_to_stdout(int data) {
	client_write_byte(data | 0x80);
}


void write_string(volatile unsigned int *uart, const char mess[]) {
	write_byte(uart, '-');
	write_byte(uart, '>');
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



extern bool halted ;
bool step =false;
int cmd_count = 0xAB000000;


void process_debug_command(volatile unsigned int *uart,volatile unsigned int *sseg) {
	int cmd ;
	cmd = read_byte(uart);
	unsigned int c;
	*sseg = 0xCAFE;

		switch (cmd) {
	case HALT: {
		printf("->Halt\n");
		*sseg = cmd_count | 0xDEAD;
		halted = true;
		write_u32(uart,cpu_getpc());
		write_byte(uart,OK);
		break;
	}
	case STATUS: {
		printf("->Status\n");
		*sseg = cmd_count | 0xDEAD;
		if (halted)
			write_byte(uart, -1);
		else
			write_byte(uart, 0);
		break;
		write_byte(uart, OK);
	}
	case READ_MEM: {
		unsigned int addr = read_u32(uart);
		*sseg = cmd_count | 0xCAFE;

		unsigned int data ;
		data = cpu_memread_u8(addr);
		write_u8(uart, data);
		write_byte(uart,OK);
		break;
	}
	case WRITE_MEM: {
		if (halted) {
			*sseg = cmd_count | 0xBABE;
			//printf("-> Write mem");FFLUSH(stdout);
			unsigned int addr = read_u32(uart);
			//write_byte(uart, OK);
			unsigned int data = read_u8(uart);
			cpu_memwrite_u8(addr, data);
			write_byte(uart,OK);

		}
		break;
	}
	case READ_REG: {
		if (halted) {
			*sseg = cmd_count | 0xFACE;
			uint8_t regid;
			regid= read_u8(uart);
			if (regid==32) {
				//printf("Reading pc=%08X\n",cpu_getpc());
				write_u32(uart, cpu_getpc());
			} else {
				//printf("Reading x[%d]=%08X\n",regid,cpu_getreg(regid));
				write_u32(uart, cpu_getreg(regid));
			}
			write_byte(uart,OK);

		}
		break;
	}
	case WRITE_REG: {
		printf("Write reg\n");
		if (halted) {
			*sseg = cmd_count | 0x1234;
			int regid = read_u8(uart);
			int regvalue = read_u32(uart);
			printf("Write x[%d]=%08X\n",regid,regvalue);
			cpu_setreg(regid ,regvalue);
			write_byte(uart,OK);

		}
		break;
	}
//	case SET_BKPT: {
//		printf("Set BKPT\n");
//		int bkptaddr = read_u32(uart);
//		if (add_hw_bkpt(bkptaddr)) {
//			//write_byte(uart, OK);
//		} else {
//			//write_byte(uart, NOK);
//		}
//		break;
//	}
	case RESET: {
		cpu_reset();
		write_byte(uart,OK);

		break;
	}
	case INFO: {
		printf("Device INFO\n");
		int id = read_u8(uart);
		write_u32(uart, 0xCAFE00);
		write_byte(uart,OK);
		break;
	}
//	case UNSET_BKPT: {
//		printf("Unset BKPT\n");
//		int bkptaddr = read_u32(uart);
//		if (remove_hw_bkpt(bkptaddr)) {
//			//write_byte(uart, OK);
//		} else {
//			//write_byte(uart, NOK);
//		}
//		break;
//	}
	case STEP: {
		if(is_cpu_halted()) {
			printf("->Setting Step mode at PC=%08X\n",cpu_getpc());
			step = true;
		} else {
			printf("-> Cannot Step as the CPU is running (at PC=%08X)\n",cpu_getpc());
		}
		break;
	}
	case RUN: {
		*sseg = cmd_count | 0xFEED;
		printf("Run from PC=%08X\n",cpu_getpc());
		halted = false;


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


int uart_master(
		volatile unsigned int *sseg,
		volatile unsigned int *leds,
		volatile unsigned int iomap[IOSIZE]) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE ap_none port=sseg register
#pragma HLS INTERFACE ap_none port=leds register
#pragma HLS INTERFACE m_axi depth=IOSIZE port=iomap offset=direct bundle=mem
	volatile unsigned int *uart;
	int addr;

	uart = iomap;
	cpu_reset();
	halted = true;
	write_string(uart, "Helloworld from the debug monitor.\r\n");
	while (1) {
		*sseg = cpu_getpc();

		if (!is_cpu_halted()) {
			cpu_step();
			printf("->Running to PC=%08X\n", cpu_getpc());
			if (is_cpu_halted()) {
				write_u32(uart, cpu_getpc());
				write_byte(uart, OK);
			}
		}
		if (step) {
			cpu_step();
			printf("->Stepping to PC=%08X\n", cpu_getpc());
			step = false;
			write_u32(uart, cpu_getpc());
			write_byte(uart, OK);
		}

		if (has_byte(uart)) {
			cmd_count +=0x00010000 ;
			process_debug_command(uart,sseg);
		}
	}
}


