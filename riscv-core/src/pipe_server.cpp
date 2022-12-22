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


void cpu_memwrite_u8(uint32_t addr,uint8_t data) ;

int uart_master(
		volatile bool *debug,
		volatile bool *step,
		volatile unsigned int *dbg_pc,
		volatile unsigned int *dbg_ir,
		volatile unsigned int* uartmap
	);


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
unsigned int uart[2];

bool has_byte() {
	int bytes;
	ioctl(uart[1], FIONREAD, &bytes);
	return bytes>1;
}

int read_byte() {
	unsigned char c;
	do {
		int res= read(uart[1], &c, sizeof(char));
		if (res<0) {
			printf("Error: %x",res);
			exit(-19);
		} else if (res==0){
			printf("Non blocking !\n");
		}  else {
			trace_in(c);
			if ((c&0x80)==0) {
				return c;
			} else {
				printf("stdout: %c",c&0x7F);
			}

		}
	} while(1);
}

void write_byte(unsigned char data) {
	FPRINTF(stdout,"%c",0x7F&data);
	FFLUSH(stdout);
	trace_out(data);
	write(uart[1],&data, sizeof(char));
}

int main(int argc, char** argv) {
	unsigned int pc, ir;
	bool dbg, step;

	// Open FIFO for write only
	mkfifo("/tmp/c2s",0666);
	uart[0] = open("/tmp/c2s", O_RDONLY);
	if (uart[0]<0) {
		FPRINTF(stderr,"error c2s\n");FFLUSH(stderr);
		return -1;
	}

	mkfifo("/tmp/s2c",0666);
	uart[1] = open("/tmp/s2c", O_WRONLY);
	if (uart[1]<0) {
		FPRINTF(stderr,"error s2c\n");FFLUSH(stderr);
		return -1;
	}

	FPRINTF(stdout,"opened pipes\n"); FFLUSH(stdout);

	uart_master(&dbg, &step, &pc, &ir, uart);

	system("/bin/stty -raw");

}

