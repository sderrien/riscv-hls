CFLAGS= -g -O0 -I./

PROGS = \
	$(BINDIR)/gdb-server-pipe \
	$(BINDIR)/gdb-server-iss \
	$(BINDIR)/gdb-server-uart \
	$(BINDIR)/uart_client-pipe \
	$(BINDIR)/uart_client-uart \
	$(BINDIR)/uart_test

BINDIR= ../bin/

all: $(PROGS)

$(BINDIR)/gdb-server-iss : gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp ../riscv-core/src/rom.h
	g++ $(CFLAGS) -g -O0 -pthread -o  $@ gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp

$(BINDIR)/gdb-server-pipe : gdb-server.cpp gdb-target-pipe.cpp gdb-target-common.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^
	
$(BINDIR)/gdb-server-uart : gdb-server.cpp gdb-target-uart.cpp gdb-target-common.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^
	

#$(BINDIR)/uart_client-pipe: uart_client.cpp gdb-target-pipe.cpp gdb-target-common.cpp
#	g++ $(CFLAGS) -g -O0 -o $@ $^
#
#$(BINDIR)/uart_client-uart: uart_client.cpp gdb-target-uart.cpp gdb-target-common.cpp
#	g++ $(CFLAGS) -g -O0 -o $@ $^
#
#$(BINDIR)/uart_test: uart_test.cpp 
#	g++ $(CFLAGS) -g -O0 -o $@ $^

clean:
	rm  $(PROGS)
		