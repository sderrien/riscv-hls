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

bool client_init_device(const char *device) {
	// Nothing to do
	return true;
}

bool server_init_device(const char *device) {
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

