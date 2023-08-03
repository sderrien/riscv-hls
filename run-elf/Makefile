CXX=g++
CFLAGS= -g -O0 -I./ -I../riscv-core/src -I../riscv-gdbserver/

BINDIR= ../bin

PROGS = \
	$(BINDIR)/run-elf
	
all: $(PROGS)

$(BINDIR)/run-elf: run-elf.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp ../riscv-core/src/elfreader/dynamicrom.cpp ../riscv-core/src/elfreader/elfreader.cpp
	$(CXX) $(CFLAGS) -pthread -o $@ $^
	
clean:
	rm  $(PROGS)
		