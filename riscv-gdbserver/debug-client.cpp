#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <termios.h>
#include <unistd.h>

typedef uint32_t u32;
typedef uint64_t u64;
typedef int32_t i32;
typedef int64_t i64;
typedef uint8_t u8;
typedef uint16_t u16;

#include <gdb-target.h>
#include <riscv-debug.h>
#include <pthread.h>
#include <gdb-server.h>
#include <gdb-target.h>
#include <riscv-iss.h>


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

struct termios orig_termios;

bool init_device(char *device);

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

void flush();

int main(int argc,  char *argv[]) {

	set_conio_terminal_mode();

	uint8_t regid = 0;
	uint32_t cpt = 0;
	uint32_t addr, data;
	bool success ;
	if (argc!=2) {
		success = init_device("/dev/ttyUSB1");
	} else {
		success = init_device(argv[1]);
	}
	if (!success) exit(-1);
	set_conio_terminal_mode();
	while (1) {
		flush();
		if (kbhit()) {
			int c = getch();

			switch (c) {
			case 'Q': {
				reset_terminal_mode();
				exit(-1);
				break;
			}
			case STEP: {
				printf("PC=%08x\r\n",cpu_step(false));
				break;
			}
			case HALT: {
				cpu_halt();
				break;
			}
			case RUN: {
				cpu_run();
				break;
			}
			case WRITE_MEM: {
				printf("Writing MEM\r\n");
				fflush(stdin);
				scanf("%d", &addr);
				fflush(stdin);
				scanf("%d", &data);
				write_mem(addr, data);
				break;
			}
			case READ_MEM: {
				printf("Reading MEM\r\n");
				fflush(stdin);
				scanf("%d", &addr);
				data = read_mem(addr);
				printf("mem[%d]=%08X\r\n", addr, data);
				break;
			}
			case WRITE_REG: {
				printf("Writing REG\r\n");
				fflush(stdin);
				scanf("%d", &addr);
				fflush(stdin);
				scanf("%d", &data);
				printf("Writing x[%02X]=%08X\r\n",addr,data);
				write_reg(addr, data);
				break;
			}
			case READ_REG: {
				printf("Reading REG\r\n");
				fflush(stdout);
				fflush(stdin);
				scanf("%d", &addr);
				printf("Reading x[%d]=", addr);fflush(stdout);
				data = read_reg(addr);
				printf("%08X\r\n", data);fflush(stdout);
				break;
			}
			case SET_BKPT: {
				printf("Reading REG\r\n");
				fflush(stdout);
				fflush(stdin);
				scanf("%d", &addr);
				data = read_reg(addr);
				printf("x[%d]=%08X\r\n", addr, data);
				break;
			}
			case UNSET_BKPT: {
				printf("Reading REG\r\n");
				fflush(stdout);
				fflush(stdin);
				scanf("%d", &addr);
				data = read_reg(addr);
				printf("x[%d]=%08X\r\n", addr, data);
				break;
			}
			}

		}

	}
}
