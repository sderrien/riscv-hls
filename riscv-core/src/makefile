CFLAGS= -g -O0 -Wc++11-compat-deprecated-writable-strings

BINDIR= ../../bin/

all:  $(BINDIR)riscv-sim $(BINDIR)pipe-riscv-sim 

$(BINDIR)pipe-riscv-sim:  asm.cpp riscv-iss.cpp uart_master.cpp uart_mock.cpp ../../riscv-gdbserver/channels.cpp ../../riscv-gdbserver/channels-pipe.cpp 
	g++ $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^

$(BINDIR)riscv-sim:  asm.cpp riscv-iss.cpp riscv-sim.cpp
	g++ $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^

clean:
	@\rm -f $(BINDIR)riscv-sim $(BINDIR)pipe-riscv-sim   *.txt