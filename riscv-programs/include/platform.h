#ifndef _PLATFORM_H_
#define _PLATFORM_H_
#define IO_BASE 0x80000000

void initialise_board();
void start_trigger();
void stop_trigger();

unsigned long long get_mcycle();
unsigned long long get_minsn();
int printf(const char *format, ...);
#endif
