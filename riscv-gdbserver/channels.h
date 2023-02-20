#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

#include <fcntl.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

bool client_init_device(const char *device);
bool client_has_byte();
int client_read_byte();
void client_write_byte(unsigned char data);

bool server_init_device(const char *device);
bool server_has_byte();
int server_read_byte();
void server_write_byte(unsigned char data);
