
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

void init_device(char *device);
bool has_byte();
int read_byte();
void write_byte(unsigned char data);

int s2c,c2s;
unsigned char c;
unsigned int hasbyte = 0;

void init_device(char *device) {
	printf("Initializing device %s\n",device);
	c2s = open("/tmp/c2s", O_WRONLY);
	if (c2s<0) {
		fprintf(stderr,"error while opening c2s pipe\n");
		exit(-1);
	}
	s2c = open("/tmp/s2c", O_RDONLY|O_NONBLOCK);
	if (s2c<0) {
		fprintf(stderr,"error while opening s2c pipe\n");
		exit(-1);
	}
	printf("Initialization successfull\n");

}


bool has_byte() {
	if (!hasbyte) {
		hasbyte = (read(s2c, &c, sizeof(char))==1) ;
	}
	return hasbyte;
}


int read_byte() {
	int cpt =0;
	while (!has_byte()) {
		if (cpt > 0x100) {
			cpt=0;
			fflush(stdout);
			usleep(1000);
		} else {
			cpt++;
		}
	}
	hasbyte=0;
	//printf("#%c",c);fflush(stdout);
	return c;
}


void write_byte(unsigned char data) {
	write(c2s,&data, sizeof(char));
}

