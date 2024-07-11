#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ac_int.h>
#include "riscv.h"
#include "riscv-nano-config.h"
#include "elf-loader.h"

#pragma SHLS SPEC_DEPENDENCY variable=instr_mem distance=4

unsigned int instr_mem[MEMSIZE / 4];
unsigned char mem0[MEMSIZE / 4];
unsigned char mem1[MEMSIZE / 4];
unsigned char mem2[MEMSIZE / 4];
unsigned char mem3[MEMSIZE / 4];

extern uint32_t insncnt;
extern uint32_t x[32];
extern uint32_t pc, next_pc;

char* rname(unsigned int ir);
uint32_t nano_cpu_run(uint32_t init_pc, unsigned int *memw, unsigned char *mem0, unsigned char *mem1, unsigned char *mem2, unsigned char *mem3);

int main(int argc, char **argv) {

    if (argc != 2) {
        fprintf(stderr, "ERROR: Expected ELF file name\nUsage: %s <elf-file>\n",
                argv[0]);
        return 1;
    }

    uint32_t init_pc;
    if (!elf32_load(argv[1], instr_mem, mem0, mem1, mem2, mem3, &init_pc))
        return 1;

    printf("Reset CPU\n");
#ifdef TARGET_ISA
    printf("Target is %s\n", TARGET_ISA);
#endif
    int res = nano_cpu_run(init_pc, instr_mem, mem0, mem1, mem2, mem3);

    if (res >= 0) {
#ifndef __SYNTHESIS__
        printf("PC=%08X\n", pc);
        printf("Executed %d instructions\n", insncnt);
        for (int regid = 0; regid < 32; regid++) {
            printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
        }
        printf("End of program\n");
#endif
        return 0;
    } else {
#ifndef __SYNTHESIS__
        printf("Program halted due to error after %d instructions\n", insncnt);
        fprintf(stderr, "Program halted due to error after %d instructions\n",
                insncnt);
        for (int regid = 0; regid < 32; regid++) {
            printf("%s[%d]=%08X\n", rname(regid), regid, x[regid]);
        }
#endif
        return -1;
    }
//    fclose(stdout);
}
