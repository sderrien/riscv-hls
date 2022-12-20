CFLAGS= -g -O0

all: uart_server

uart_server:  asm.cpp miniriscv.cpp uart_server.cpp
	g++ $(CFLAGS) -I../../riscv-gdbserver/ -o $@ $^

clean:
	@\rm -f uart_test uart_server uart_client-uart uart_client-pipe  *.txt