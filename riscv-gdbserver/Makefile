CXX=g++
CFLAGS= -g -O0 -I./ -I../riscv-core/src

BINDIR= ../bin/

PROGS = \
	$(BINDIR)/gdb-server-pipe \
	$(BINDIR)/gdb-server-iss \
	$(BINDIR)/gdb-server-uart \
	$(BINDIR)/server-test-pipe \
	$(BINDIR)/server-test-uart \
	$(BINDIR)/mock-gdbserver-pipe \
	$(BINDIR)/client-test-pipe 
	
all: $(PROGS)

$(BINDIR)/client-test-pipe: client-test.cpp channels.cpp channels-pipe.cpp
	$(CXX) $(CFLAGS) -o $@ $^

$(BINDIR)/server-test-pipe: server-test.cpp channels.cpp channels-pipe.cpp
	$(CXX) $(CFLAGS) -o $@ $^

$(BINDIR)/server-test-uart: server-test.cpp channels.cpp channels-uart.cpp
	$(CXX) $(CFLAGS) -o $@ $^

$(BINDIR)/gdb-server-iss : gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp ../riscv-core/src/rom.h
	$(CXX) $(CFLAGS) -pthread -o  $@ gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp

$(BINDIR)/gdb-server-pipe : gdb-server.cpp channels.cpp channels-pipe.cpp gdb-target-core.cpp
	$(CXX) $(CFLAGS) -o $@ $^
	
$(BINDIR)/gdb-server-uart : gdb-server.cpp channels.cpp channels-uart.cpp gdb-target-core.cpp
	$(CXX) $(CFLAGS) -o $@ $^

$(BINDIR)/mock-gdbserver-pipe : mock-gdb-server.cpp channels.cpp channels-pipe.cpp gdb-target-core.cpp
	$(CXX) $(CFLAGS) -o $@ $^
	
clean:
	rm  $(PROGS)
		