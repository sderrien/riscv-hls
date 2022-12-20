#define IO_BASE 0xFFFF0000
volatile unsigned int *iomap = (void*) (IO_BASE);
const char message[] = "Hello world from RISC-V HLS\10\n";


void print_message() {
	for (int i=0;i<sizeof(message);i++) {
		iomap[0]=0x80 | message[i];
	}
}
void main() {
	int sum;

	while (1) {
		sum += 1;
		print_message();
		if (sum == 16)
			sum =0;
		sum += 2;
		sum += 3;
	}

}
