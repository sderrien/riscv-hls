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


typedef uint32_t u32;
typedef uint64_t u64;
typedef int32_t i32;
typedef int64_t i64;
typedef uint8_t u8;
typedef uint16_t u16;

#include<stdlib.h>
#include<signal.h>
#include<stdint.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/select.h>
#include <termios.h>

#include <gdb-server.h>
#include <gdb-target.h>
#include <uart.h>

struct termios orig_termios;



void reset_terminal_mode() {
	tcsetattr(0, TCSANOW, &orig_termios);
}

void set_conio_terminal_mode() {
	struct termios new_termios;

	/* take two copies - one for now, one for later */
	tcgetattr(0, &orig_termios);
	memcpy(&new_termios, &orig_termios, sizeof(new_termios));

	/* register cleanup handler, and set the new terminal mode */
	atexit(reset_terminal_mode);
	cfmakeraw(&new_termios);
	tcsetattr(0, TCSANOW, &new_termios);
}

int kbhit() {
	struct timeval tv = { 0L, 0L };
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(0, &fds);
	return select(1, &fds, NULL, NULL, &tv) > 0;
}

int getch() {
	int r;
	unsigned char c;
	if ((r = read(0, &c, sizeof(c))) < 0) {
		return r;
	} else {
		return c;
	}
}

void flush() {
	while (uart_has_byte()) {
		int c = uart_read_byte();
		printf("%c|%08x", c,c);
		fflush(stdout);
	}
}

int main() {
	uart_init_device("/dev/ttyUSB1");

	set_conio_terminal_mode();
	while (1) {
		flush();
		if (kbhit()) {
			int c = getch();
			if (c=='Q') {
				reset_terminal_mode();
				return 0;
			}
			uart_write_byte(c);
		}

		if (uart_has_byte()) {
			int z = uart_read_byte();
			printf("%c",z);fflush(stdout);
		}
	}
	return 0;
}
