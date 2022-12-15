#define IO_BASE 0xFFFF0000
volatile unsigned int *iomap = (void*) (IO_BASE);
const char stack[128] ;
const char message[] = "Hello world from RISC-V HLS\10\n";

extern int clockticks();

void main() {
	int sum;
	while (1) {

		for (int i=0;i<sizeof(message);i++) {
			iomap[0]=message[i];
		}

	}

}
