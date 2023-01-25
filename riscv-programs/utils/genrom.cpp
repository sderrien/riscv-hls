//============================================================================
// Name        : riscv-sim.cpp
// Author      :
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <stdio.h>
#include <string.h>

#include <asm.h>
#include <riscv-iss.h>
#include <rvi32.h>

unsigned int addr32(unsigned int pc) { return (pc >> 2) % MEMSIZE; }

int loadbinary(char *filename, unsigned int *mem) {
  int i;
  FILE *f;
  f = fopen(filename, "r");
  i = 0;
  if (f != NULL) {
    while (!feof(f) && i < (MEMSIZE / 4)) {
      unsigned int v;
      fread(&v, 4, 1, f);
      // printf("%08X\n",v);
      mem[i] = v;
      i++;
    }
    fclose(f);
    return i;
  } else {
    return -1;
  }
}

int main(int argc, char **argv) {
  unsigned int imem[MEMSIZE / 4] = {0xdeadbeef};
  if (argc == 3) {
    int i;
    printf("Loading input program file '%s'\n", argv[1]);
    int size;
    size = loadbinary(argv[1], imem);
    if (size == -1) {
      fprintf(stderr, "Cannot open RISC-V binary '%s'\n", argv[1]);
      return -1;
    }
    printf("Converting %d words to rom_file '%s'\n", size, argv[2]);
    FILE *f = fopen(argv[2], "wb");
    fprintf(f, "#if MEMSIZE<0x%08X \n", 4 * size);
    fprintf(f, "#error binary image does not fit memory \n");
    fprintf(f, "#endif\n");

    fprintf(f, "unsigned int memw[MEMSIZE/4]= {");
    for (int i = 0; i < size; i++) {
      unsigned int ir = imem[i];
      if (i > 0)
        fprintf(f, ",");
      fprintf(f, "\n\t0x%08X, // %08X: %s", ir, 4 * i, mnemonic(ir));
    }
    fprintf(f, "\n};\n");

    fprintf(f, "unsigned char mem0[MEMSIZE/4]= {");
    for (int i = 0; i < (size); i++) {
      if (i > 0)
        fprintf(f, ",");
      fprintf(f, "\n\t0x%02X ", (imem[i]) & 0xFF);
    }
    fprintf(f, "\n};\n");
    fprintf(f, "unsigned char mem1[MEMSIZE/4]= {");
    for (int i = 0; i < (size); i++) {
      if (i > 0)
        fprintf(f, ",");
      fprintf(f, "\n\t0x%02X ", (imem[i] >> 8) & 0xFF);
    }
    fprintf(f, "\n};\n");
    fprintf(f, "unsigned char mem2[MEMSIZE/4]= {");
    for (int i = 0; i < (size); i++) {
      if (i > 0)
        fprintf(f, ",");
      fprintf(f, "\n\t0x%02X ", (imem[i] >> 16) & 0xFF);
    }
    fprintf(f, "\n};\n");
    fprintf(f, "unsigned char mem3[MEMSIZE/4]= {");
    for (int i = 0; i < (size); i++) {
      if (i > 0)
        fprintf(f, ",");
      fprintf(f, "\n\t0x%02X ", (imem[i] >> 24) & 0xFF);
    }
    fprintf(f, "\n};\n");

    fclose(f);
  } else {
    fprintf(stderr, "Usage : genrom infile  outfile \n");
    return -1;
  }
}
