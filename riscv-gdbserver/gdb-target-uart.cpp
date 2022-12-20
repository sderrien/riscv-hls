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
#include <sys/ioctl.h>
int tty;

#define UART_BAUDRATE B115200

FILE *in_trace , *out_trace = NULL;

void trace_out(unsigned char value) {
	if (out_trace == NULL) {
		out_trace  = fopen("uart_server_out.txt", "w");
		if (out_trace  == NULL)
			exit(-2);
	}
	fprintf(out_trace , "%c", (char ) value);
	fflush(out_trace );
}

void trace_in(unsigned char value) {
	if (in_trace == NULL) {
		in_trace  = fopen("uart_server_in.txt", "w");
		if (in_trace  == NULL)
			exit(-2);
	}
	fprintf(in_trace , "%c", (char ) value);
	fflush(in_trace );
}

bool init_device(char *device) {
	printf("Opening TTY device %s\n", device);
	tty = open(device, O_RDWR | O_RDWR | O_NOCTTY);
	if (tty < 0) {
		printf("Could not open device %s\n", device);
		return false;
	} else if (isatty(tty)) {
		struct termios tb;

		printf("Setting up TTY for %d Baud\n", UART_BAUDRATE);
		if (tcgetattr(tty, &tb) < 0) {
			printf("Could not get TTY attributes\n");
			perror("O/S Err:");
			return false;
		}

		cfmakeraw(&tb); // Sets no parity, 8 bits, one stop bit
		tb.c_cflag &= (~(CRTSCTS)); // Sets no parity, 8 bit
		tb.c_cflag &= (~(CSTOPB)); // One stop bit

		// 8-bit
		tb.c_cflag &= ~(CSIZE);
		tb.c_cflag |= CS8;

		cfsetispeed(&tb, UART_BAUDRATE);
		cfsetospeed(&tb, UART_BAUDRATE);

		if (tcsetattr(tty, TCSANOW, &tb) < 0) {
			printf("Could not set any TTY attributes\n");
			perror("O/S Err:");
		}
		tcflow(tty, TCOON);
	}
	return true;
}


bool has_byte() {
	int bytes;
	ioctl(tty, FIONREAD, &bytes);
	return bytes>1;
}

int read_byte() {
	unsigned char c;
	do {
		int hasbyte = (read(tty, &c, sizeof(char))==1) ;
		if (hasbyte<0) {
			fprintf(stderr,"Error tty\n");
			exit(-1);
		}
		trace_in(c);
		if ((c&0x80)==0) {
			return c;
		} else {
			printf("stdout: %c",c);
		}
	} while(1);
}


void write_byte(unsigned char data) {
	trace_out(data);
	write(tty,&data, sizeof(char));
}
