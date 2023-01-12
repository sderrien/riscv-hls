#include<platform.h>

unsigned char message[]="Hello world from RISC-V\r\n";

void exception_handler() {
	while (1);
}

void my_putchar(char c) {
	((int*)((void*) ((unsigned int)IO_BASE)))[1]=c;
}


void main() {

	for (int i=0;i<sizeof(message);i++) {
		my_putchar(message[i]);
	}

}
