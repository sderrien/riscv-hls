CXX=g++
CFLAGS= -g -O0

BINDIR= ../../bin/

all: \
	$(BINDIR)riscv-sim \
	$(BINDIR)pipe-riscv-sim \
	$(BINDIR)riscv-iss  

$(BINDIR)pipe-riscv-sim:  asm.cpp riscv-iss.cpp uart_master.cpp uart_mock.cpp ../../riscv-gdbserver/channels.cpp ../../riscv-gdbserver/channels-pipe.cpp 
	$(CXX) $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^

$(BINDIR)riscv-sim:  asm.cpp riscv-iss.cpp riscv-sim.cpp
	$(CXX) $(CFLAGS) -I../../riscv-gdbserver/ -I./ -o $@ $^


$(BINDIR)riscv-iss:  main-elf-rvi32.cpp riscv-nano-utils.cpp riscv-nano-iss.cpp elf-loader.cpp
	$(CXX) $(CFLAGS) -Wno-parentheses -Wno-shift-negative-value -fsanitize=address  -I./ -o $@ $^


clean:
	@rm -f $(BINDIR)riscv-sim $(BINDIR)pipe-riscv-sim *.txt