//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1, sderrien@irisa.fr
//============================================================================

#include <stdio.h>
#include <string.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include "asm.h"
#include "rvi32.h"
#include "riscv-iss.h"


int loadbinary(char *filename) {
	int i;
	FILE *f;
	char buffer[16];
	f = fopen(filename, "r");
	i = 0;
	if (f != NULL) {
		while (!feof(f) && i < (MEMSIZE)) {
			fread(buffer, 1, 1, f);
			cpu_memwrite_u8(i ,buffer[0]);
			i += 1;
		}
		fclose(f);
		return i;
	} else {
		fprintf(stderr, "Could not open %s\n", filename);
		return -1;
	}
}

int main (int argc, char ** argv) {
	loadbinary(argv[1]);
	cpu_reset();
	cpu_run();

}
