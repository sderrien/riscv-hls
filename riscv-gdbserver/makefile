CFLAGS= -g -O0 -I./ -I../riscv-core/src -Wc++11-compat-deprecated-writable-strings

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
	g++ $(CFLAGS) -g -O0 -o $@ $^

$(BINDIR)/server-test-pipe: server-test.cpp channels.cpp channels-pipe.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^

$(BINDIR)/server-test-uart: server-test.cpp channels.cpp channels-uart.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^

$(BINDIR)/gdb-server-iss : gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp ../riscv-core/src/rom.h
	g++ $(CFLAGS) -g -O0 -pthread -o  $@ gdb-server.cpp gdb-target-iss.cpp ../riscv-core/src/riscv-iss.cpp ../riscv-core/src/asm.cpp

$(BINDIR)/gdb-server-pipe : gdb-server.cpp channels.cpp channels-pipe.cpp gdb-target-core.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^
	
$(BINDIR)/gdb-server-uart : gdb-server.cpp channels.cpp channels-uart.cpp gdb-target-core.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^

$(BINDIR)/mock-gdbserver-pipe : mock-gdb-server.cpp channels.cpp channels-pipe.cpp gdb-target-core.cpp
	g++ $(CFLAGS) -g -O0 -o $@ $^
	
clean:
	rm  $(PROGS)
		