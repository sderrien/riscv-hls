//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asm.h"
#include "riscv-iss.h"
#include "rvi32.h"

#include "assert.h"

void write_to_stdout(int data) {
  printf("%c", data);
  fflush(stdout);
}

const char *suffic(const char path[]) {
  const char *result;
  int i, n;

  assert(path != NULL);
  n = strlen(path);
  i = n - 1;
  while ((i >= 0) && (path[i] != '.') && (path[i] != '/') & (path[i] != '\\')) {
    i--;
  }
  if ((i > 0) && (path[i] == '.') && (path[i - 1] != '/') &&
      (path[i - 1] != '\\')) {
    result = path + i;
  } else {
    result = path + n;
  }
  return result;
}

int loadbinary(char *filename) {
  int i;
  FILE *f;
  char buffer[16];
  if (strcmp(suffic(filename), ".bin") != 0) {
    fprintf(stderr, "wrong filename extension binray file (.bin) expected");
    exit(-1);
  }
  f = fopen(filename, "r");
  i = 0;
  if (f != NULL) {
    while (!feof(f) && i < (MEMSIZE)) {
      fread(buffer, 1, 1, f);
      cpu_memwrite_u8(i, buffer[0]);
      i += 1;
    }
    fclose(f);
    return i;
  } else {
    fprintf(stderr, "Could not open %s\n", filename);
    return -1;
  }
}

extern bool trace_instr;
int main(int argc, char **argv) {

  trace_instr = false;
  for (int k = 1; k < argc; k++) {
    if (strcmp(argv[k], "-trace") == 0) {
      trace_instr = true;
    }
  }
  loadbinary(argv[1]);
  printf("reset CPU\n");
  cpu_reset();

  printf("Run CPU\n");
  cpu_run();
  printf("End of program\n");
}
