
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

extern int s2c_channel;
extern int c2s_channel;

int create_tube(const char* name) {
	int res;
	res = unlink(name);
	if (res>=0)
		FPRINTF(stdout,"Unlinked tube %s\n",name); FFLUSH(stdout);
	res = mkfifo(name,0666);
	if (res< 0) {
		FPRINTF(stderr,"Error %d\n",res); FFLUSH(stdout);
		perror ("Coudl not create named tube");
		exit (2);
	} else {
		FPRINTF(stderr,"Created tube %s\n",name); FFLUSH(stdout);
	}
	return res;
}

bool client_init_device(const char *device) {

//	create_tube("/tmp/uart_in");
//	create_tube("/tmp/uart_out");

	PRINTF("Opening names tubes\n");

	c2s_channel = open("/tmp/uart_out", O_RDWR);
	PRINTF("Created names tubes\n");
	if (c2s_channel <0) {
		FPRINTF(stderr,"error uart_out\n");
		return false;
	}
	PRINTF("Opened /tmp/uart_out in write-only mode successfully\n");

	s2c_channel = open("/tmp/uart_in", O_RDONLY);
	if (s2c_channel<0) {
		FPRINTF(stderr,"error uart_in\n");
		return false;
	}
	PRINTF("Opened /tmp/uart_in in read-only mode successfully\n");


	PRINTF("Named pipes initialization successfull\n");
	return true;
}

bool server_init_device(const char *device) {

	PRINTF("Opening name pipes to emulate TTY device %s\n", device);

	c2s_channel = open("/tmp/uart_out", O_RDWR);
	if (c2s_channel<0) {
		FPRINTF(stderr,"error while opening c2s pipe\n");
		return false;
	}
	PRINTF("Opened /tmp/uart_out in read-write mode successfully\n");

	s2c_channel = open("/tmp/uart_in", O_WRONLY);
	if (s2c_channel<0) {
		FPRINTF(stderr,"error while opening s2c pipe\n");
		return false;
	}
	PRINTF("Opened /tmp/uart_in in write-only mode successfully\n");


	PRINTF("Opened /tmp/uart_out successfully\n");
	PRINTF("Named pipes initialization successfull\n");
	return true;
}



