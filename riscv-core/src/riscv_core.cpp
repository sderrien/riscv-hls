
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


#include <riscv-debug.h>
#include <riscv-iss.h>
#include <gdb-target.h>
#include <rvi32.h>




int riscv_core(
		volatile char *dbg_cmd,
		volatile bool *dbg_ack,
		volatile uint64_t *dbg_din,
		volatile uint32_t *dbg_dout,
		volatile unsigned int *sseg,
		volatile unsigned int *leds,
		volatile unsigned int iomap[MEMSIZE]) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE ap_none port=sseg register
#pragma HLS INTERFACE ap_none port=leds register
#pragma HLS INTERFACE m_axi depth=4 port=iomap offset=direct bundle=mem
	uint32_t regid ;
	uint32_t value ;
	bool step;

	cpu_reset();
	do {
		*dbg_ack = false;
		char command = *dbg_cmd;
		switch (command) {
			case RESET:
				cpu_reset();
				cpu_halt();
				break;
			case HALT:
				cpu_halt();
				break;
			case RUN:
				cpu_halt();
				break;
			case STEP:
				step = true;
				cpu_halt();
				break;
			case STATUS:
				*dbg_dout = cpu_is_halted();
				break;
			case READ_MEM:
				*dbg_dout = cpu_memread_u8(*dbg_din);
				*dbg_ack =  true;
				break;
			case READ_REG:
				regid = (*dbg_din>>32)&0x1F;
				*dbg_dout = cpu_getreg(regid);
				*dbg_ack =  true;
				break;
			case WRITE_MEM:
				cpu_memwrite_u8(*dbg_din>>32,*dbg_din);
				break;
			case WRITE_REG:
				regid = (*dbg_din>>32)&0x1F;
				value = *dbg_din;
				write_reg(regid, value);
				break;
			default:
				if (!cpu_is_halted()|| step) cpu_step(false);
				break;
		}
	} while(1);

}


