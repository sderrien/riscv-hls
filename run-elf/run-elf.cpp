#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>

#include "../riscv-core/src/riscv-iss.h"
#include "../riscv-core/src/elfreader/dynamicrom.h"



pthread_t iss_thread;
bool verbose = false;
extern bool halted;
bool interrupt = false;

void write_to_stdout(int data) {
  printf("%c", data);
  fflush(stdout);
}

void *cpu_thread(void *arg) {
  fflush(stdout);
  halted = false;
  if (verbose)
    printf("Starting CPU thread from PC=%08XC\n", cpu_getpc());
  while (!halted) {
    fflush(stdout);
    cpu_step();
    if (interrupt) {
      halted = true;
      if (verbose)
        printf("Exiting ISS thread due to CTRL-C\n");
    }
  }
  if (halted) {
    if (verbose)
      printf("Exiting ISS thread due to breakpoint or exception\n");
  }
  printf("Passed successfully!\n");
  pthread_exit(arg);
}

int main(int argc, char **argv) {

  for (int k = 1; k < argc; k++) {
    if (strcmp(argv[k], "-verbose") == 0) {
      verbose = true;
    }
  }

  for (int k = 1; k < argc; k++) {
    if (strcmp(argv[k], "-verbose")) {
      cpu_setreg(32, loadmem(argv[k]));
      init_sp(0xf0000);
      pthread_create(&iss_thread, NULL, cpu_thread, NULL);
      pthread_join(iss_thread, NULL);
    }
  }
  return 0;
}
