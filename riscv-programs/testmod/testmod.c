// See LICENSE for license details.

#include <stdint.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include <limits.h>
#include <sys/signal.h>

#include "../baremetal/util.h"

#define IO_BASE 0x80000000


void _init(int cid, int nc) {

}


uintptr_t __attribute__((weak)) handle_trap(uintptr_t cause, uintptr_t epc,
		uintptr_t regs[32]) {
	return 0;
}
int putchar(int c) {
	((int*) ((void*) ((unsigned int) IO_BASE)))[1] = c;
	return 1;
}


unsigned int x = 15,y;

int main(int argc, char **argv) {

	y = x % 10;
	putchar(y-'0');

	return -1;
}
