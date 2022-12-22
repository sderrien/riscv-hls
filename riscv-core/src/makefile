CFLAGS= -g -O0 -Wc++11-compat-deprecated-writable-strings

all:  ../../bin/riscv-sim ../../bin/pipe-riscv-sim 

../../bin/pipe-riscv-sim:  asm.cpp riscv-iss.cpp pipe_server.cpp uart_server.cpp
	g++ $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^

../../bin/riscv-sim:  asm.cpp riscv-iss.cpp riscv-sim.cpp
	g++ $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^

clean:
	@\rm -f riscv-sim uart_test uart_server uart_client-uart uart_client-pipe  *.txt