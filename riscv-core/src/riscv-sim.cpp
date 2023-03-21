//============================================================================
// Copyright 2022 Steven Derrien, IRISA, Université de Rennes 1,
// sderrien@irisa.fr
//============================================================================

#include <signal.h>
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

void quit(int s) {
  printf("Caught exit signal %d\n", s);
  exit(1);
}

extern bool trace_instr;

int main(int argc, char **argv) {

  trace_instr = false;

  FILE *tmp = stdout;
  int nbopt = 0;
  for (int k = 1; k < argc; k++) {
    if (strcmp(argv[k], "-trace") == 0) {
      trace_instr = true;
      nbopt++;
    }
    if (strcmp(argv[k], "-o") == 0) {
      FILE *ofile = fopen(argv[k + 1], "w");
      printf("Using output file %s\n", argv[k + 1]);
      if (ofile == NULL) {
        return -2;
      }
      stdout = ofile;
      nbopt += 2;
    }
  }
  struct sigaction sigIntHandler;
  sigIntHandler.sa_handler = quit;
  sigemptyset(&sigIntHandler.sa_mask);
  sigIntHandler.sa_flags = 0;

  sigaction(SIGINT, &sigIntHandler, NULL);

  printf("Loading binary file %s\n", argv[nbopt + 1]);
  loadbinary(argv[nbopt + 1]);
  printf("Reset CPU\n");
  cpu_reset();
  cpu_run();

  printf("PC=%08X\n", cpu_getpc());
  for (int regid = 0; regid < 32; regid++) {
    printf("%s[%d]=%08X\n", rname(regid), regid, cpu_getreg(regid));
  }
  printf("End of program\n");
  fclose(stdout);

  printf("Run CPU\n");
  cpu_run();
  printf("End of program\n");
}
