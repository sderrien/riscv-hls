#ifndef __SYNTHESIS__
#include<stdio.h>
#include<stdlib.h>
#include<signal.h>
#include<stdint.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <channels.h>

#endif


#ifdef __SYNTHESIS__

#define FFLUSH(...) 0
#define PRINTF(...) 0
#define FPRINTF(...) 0
#define EXIT(a) 0

#else

#define EXIT(c) exit(c)
#define FFLUSH(...) {  fflush(__VA_ARGS__); }
#define PRINTF(...) { printf( __VA_ARGS__) ; fflush(stdout); }
#define FPRINTF(...) fprintf( __VA_ARGS__)

#endif


int uart_master(
		volatile unsigned int *dbg_pc,
		volatile unsigned int *dbg_ir,
		volatile unsigned int* uartmap
	);








unsigned int uart[2];

int main(int argc, char** argv) {
	unsigned int pc, ir;
	bool dbg, step;

	FPRINTF(stdout,"opening pipes\n"); FFLUSH(stdout);

	client_init_device("/dev/ttyUSB1");

	FPRINTF(stdout,"opened pipes\n"); FFLUSH(stdout);

	uart_master(&pc, &ir, uart);


}

