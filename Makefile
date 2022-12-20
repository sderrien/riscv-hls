REMOTE_PATH=./riscv-hls
#test-riscv-hls

REMOTE_HOST=sderrien@ubuntu18vm

all:
	@echo "targets : upload [r]hls [r]program [r]bistream [r]program [r]debug (r for remote)" 

elf:
	make -C ./riscv-programs 
	
gdb:
	make -C ./riscv-gdbserver
	
hls: 
	make -C ./riscv-core/hls 

	
bitstream: 
	make -C ./riscv-core/vivado bitstream

program: 
	make -C ./riscv-core/vivado program


rgdb:
	ssh -t sderrien@ubuntu18vm make -C $(REMOTE_PATH) gdb 

relf: 
	ssh -t sderrien@ubuntu18vm make -C $(REMOTE_PATH) elf

rhls: 
	ssh -t sderrien@ubuntu18vm make -C $(REMOTE_PATH) hls 

rprogram: 
	ssh sderrien@ubuntu18vm make -C $(REMOTE_PATH) program
	
rbitstream: 
	ssh sderrien@ubuntu18vm make -C $(REMOTE_PATH) bitstream
	
upload:
	-scp -r ../riscv-hls sderrien@ubuntu18vm:$(REMOTE_PATH)/../
	
rsync: 
	rsync -rav -e ssh --include '*/' \
	--exclude={'*.o','.git','dir4'} \
	sderrien@ubuntu18vm:$(REMOTE_PATH) \ 
	../riscv-hls/	
	
	
rdebug: rgdb
	ssh sderrien@ubuntu18vm $(REMOTE_PATH)/bin/gdb-server-uart 
	riscv32-unknown-elf-gdb ../riscv-programs/example.elf --ex='target $(REMOTE_HOST):1234'
	
debug:
	gdb-server-iss 
	riscv32-unknown-elf-gdb ../riscv-programs/example.elf --ex='target remote:1234'