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

bool channel_has_byte(int fd) {
  int bytes;
  ioctl(fd, FIONREAD, &bytes);
  return bytes >= 1;
}

int channel_read_byte(int fd) {
  unsigned char c;
  do {
    int hasbyte = (read(fd, &c, sizeof(char)) == 1);
    if (hasbyte < 0) {
      fprintf(stderr, "Error tty\n");
      exit(-1);
    } else {
      return c;
    }
  } while (1);
}

void channel_write_byte(int fd, unsigned char data) {
  write(fd, &data, sizeof(char));
}

bool client_init_device(const char *device);
bool client_has_byte();
int client_read_byte();
void client_write_byte(unsigned char data);

bool server_init_device(const char *device);
bool server_has_byte();
int server_read_byte();
void servert_write_byte(unsigned char data);

int s2c_channel;
int c2s_channel;

bool client_has_byte() { return channel_has_byte(s2c_channel); }
int client_read_byte() { return channel_read_byte(s2c_channel); }
void client_write_byte(unsigned char data) {
  return channel_write_byte(c2s_channel, data);
}

bool has_pending_char = false;
int pending_char;

// FIXME : never actually used
bool server_has_byte() {
  if (has_pending_char) {
    return true;
  } else if (channel_has_byte(c2s_channel)) {
    int res = channel_read_byte(c2s_channel);
    if ((res & 0x80) != 0) {
      printf("%c", res & 0x7F);
      fflush(stdout);
      return false;
    } else {
      has_pending_char = true;
      pending_char = res;
      return true;
    }
  }
  return true;
}

int server_read_byte() {
  if (has_pending_char) {
    has_pending_char = false;
    return pending_char;
  } else {
    int res = channel_read_byte(c2s_channel);
    while ((res & 0x80) != 0) {
      printf("%c", res & 0x7F);
      fflush(stdout);
      res = channel_read_byte(c2s_channel);
    }
    return res;
  }
}
void server_write_byte(unsigned char data) {
  return channel_write_byte(s2c_channel, data);
}

FILE *in_trace, *out_trace = NULL, *stdout_trace = NULL;

void trace_out(unsigned char value) {
  if (out_trace == NULL) {
    out_trace = fopen("uart_server_out.txt", "w");
    if (out_trace == NULL)
      exit(-2);
  }
  fprintf(out_trace, "%c", (char)value);
  fflush(out_trace);
}

void trace_stdout(unsigned char value) {
  if (stdout_trace == NULL) {
    stdout_trace = fopen("uart_stdout.txt", "w");
    if (stdout_trace == NULL)
      exit(-2);
  }
  fprintf(stdout_trace, "%c", (char)value);
  fflush(stdout_trace);
}

void trace_in(unsigned char value) {
  if (in_trace == NULL) {
    in_trace = fopen("uart_server_in.txt", "w");
    if (in_trace == NULL)
      exit(-2);
  }
  fprintf(in_trace, "%c", (char)value);
  fflush(in_trace);
}
