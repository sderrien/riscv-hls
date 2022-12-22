#define IO_BASE 0x80000000

volatile unsigned int *iomap = (void*) (IO_BASE);

const char message[] = "Hello world from RISC-V HLS\r\n";


void main() {
	int sum;

	int size = sizeof(message);
	for (int i=0;i<size;i++) {
		//while ((iomap[2]&0x80)!=0);
		iomap[1]= message[i];
	}

}
