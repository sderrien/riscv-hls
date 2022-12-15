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
#include "../gdbserver/rsp-server.h"
#include "../gdbserver/target.h"

int tty;

void init_device(char *device) {
	printf("opening device %s\n", device);
	tty = open(device, O_RDWR | O_RDWR | O_NOCTTY | O_NONBLOCK);
	if (tty < 0) {
		printf("Could not open device %s\n", device);
		exit(-1);
	} else if (isatty(tty)) {
		struct termios tb;

		printf("Setting up TTY for %d Baud\n", B230400);
		if (tcgetattr(tty, &tb) < 0) {
			printf("Could not get TTY attributes\n");
			perror("O/S Err:");
			exit(-2);
		}

		cfmakeraw(&tb); // Sets no parity, 8 bits, one stop bit
		tb.c_cflag &= (~(CRTSCTS)); // Sets no parity, 8 bit
		tb.c_cflag &= (~(CSTOPB)); // One stop bit

		// 8-bit
		tb.c_cflag &= ~(CSIZE);
		tb.c_cflag |= CS8;

		cfsetispeed(&tb, B230400);
		cfsetospeed(&tb, B230400);

		if (tcsetattr(tty, TCSANOW, &tb) < 0) {
			printf("Could not set any TTY attributes\n");
			perror("O/S Err:");
		}
		tcflow(tty, TCOON);
	}
}

unsigned char c;
unsigned int hasbyte = 0;

bool has_byte() {
	if (!hasbyte) {
		hasbyte = (read(tty, &c, sizeof(char))==1) ;
	}
	return hasbyte;
}


int read_byte() {
	while (has_byte()==0) {
		usleep(100000);
	}
	hasbyte=0;
	return c;
}


void write_byte(unsigned char data) {
	write(tty,&data, sizeof(char));
}
