#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ac_int.h>
#include <riscv.h>
#include <riscv-nano-config.h>


#pragma SHLS SPEC_DEPENDENCY variable=memw distance=4



extern unsigned int  memw[MEMSIZE / 4];
extern unsigned char mem0[MEMSIZE / 4];
extern unsigned char mem1[MEMSIZE / 4];
extern unsigned char mem2[MEMSIZE / 4];
extern unsigned char mem3[MEMSIZE / 4];

extern uint32_t insncnt;
extern uint32_t x[32];
extern uint32_t pc, next_pc;

char* rname(unsigned int ir);
uint32_t nano_cpu_run(int nbinsn);

int parse_args(int argc, char **argv);


int main(int argc, char **argv) {

	parse_args(argc, argv);

	printf("Reset CPU\n");
#ifdef TARGET_ISA
	printf("Target is %s\n",TARGET_ISA);
#endif
	int res = nano_cpu_run(512);

	if (res >= 0) {
		printf("PC=%08X\n", pc);
		printf("Executed %08X instructions\n", insncnt);
		for (int regid = 0; regid < 32; regid++) {
			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
		}
		printf("End of program\n");
		return 0;
	} else {
		printf("Program halted due to error after %d instructions\n", insncnt);
		fprintf(stderr,"Program halted due to error after %d instructions\n", insncnt);
		for (int regid = 0; regid < 32; regid++) {
			printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
		}
		return -1;
	}
//	fclose(stdout);
}
