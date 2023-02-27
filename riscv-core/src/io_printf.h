#include <stdarg.h>

#ifndef __IO_PRINTF
#define __IO_PRINTF
int io_printf(int state,bool enable, const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    if (enable) {
        vprintf(fmt, args);
    	state++;
    }
    va_end(args);

    return state;
}
#endif
