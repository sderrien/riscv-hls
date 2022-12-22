
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

bool uart_init_device(const char *device);
bool uart_has_byte();
int uart_read_byte();
void uart_write_byte(unsigned char data);

int s2c,c2s;
unsigned char c;
unsigned int hasbyte = 0;

bool uart_init_device(const char *device) {
	printf("Opening name pipes to emulate TTY device %s\n", device);
	c2s = open("/tmp/c2s", O_WRONLY);
	if (c2s<0) {
		fprintf(stderr,"error while opening c2s pipe\n");
		return false;
	}
	s2c = open("/tmp/s2c", O_RDONLY);
	if (s2c<0) {
		fprintf(stderr,"error while opening s2c pipe\n");
		return false;
	}
	printf("Named pipes initialization successfull\n");
	return true;
}



bool uart_has_byte() {
	int bytes;
	ioctl(s2c, FIONREAD, &bytes);
	return bytes>1;
}

int uart_read_byte() {
	unsigned char c;
	do {
		int hasbyte = (read(s2c, &c, sizeof(char))==1) ;
		if (hasbyte<0) {
			fprintf(stderr,"Error tty\n");
			exit(-1);
		}
		if ((c&0x80)==0) {
			return c;
		} else {
			printf("stdout: %c",c);
		}
	} while(1);
}


void uart_write_byte(unsigned char data) {
	write(c2s,&data, sizeof(char));
}

