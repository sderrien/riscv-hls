OUTPUT_DIR=bin

REMOTE_PATH=./riscv-hls
#test-riscv-hls

REMOTE_HOST=sderrien@ubuntu18vm

list:
	@echo "Targets : upload [r]hls [r]elf [r]bistream [r]program [r]debug (r for remote)"

setup:
	@mkdir -p $(OUTPUT_DIR)

elf: setup
	$(MAKE) -C riscv-programs 
	
gdb: setup
	$(MAKE) -C riscv-gdbserver
	$(MAKE) -C riscv-core/src
	
hls: setup
	$(MAKE) -C riscv-core/hls 

	
bitstream: setup
	$(MAKE) -C riscv-core/vivado bitstream

program: setup
	$(MAKE) -C riscv-core/vivado program


rgdb:
	ssh -t $(REMOTE_HOST) $(MAKE) -C $(REMOTE_PATH) gdb

relf: 
	ssh -t $(REMOTE_HOST) $(MAKE) -C $(REMOTE_PATH) elf

rhls: 
	ssh -t $(REMOTE_HOST) $(MAKE) -C $(REMOTE_PATH) hls

rprogram: 
	ssh $(REMOTE_HOST) $(MAKE) -C $(REMOTE_PATH) program
	
rbitstream: 
	ssh $(REMOTE_HOST) $(MAKE) -C $(REMOTE_PATH) bitstream
	
upload:
	-scp -r ../riscv-hls $(REMOTE_HOST):$(REMOTE_PATH)/../
	
rsync: 
	rsync -rav -e ssh --include '*/' --exclude={'*.o','.git','dir4'} $(REMOTE_HOST):$(REMOTE_PATH) ../riscv-hls/

debug:
	open -a Terminal ./bin/gdb-server-iss 
	riscv32-unknown-elf-gdb ./riscv-programs/example.elf --ex='break main' --ex='target remote:1234'

rdebug: rgdb
	ssh $(REMOTE_HOST) $(REMOTE_PATH)/bin/gdb-server-uart $(DEVICE)
	riscv32-unknown-elf-gdb ../riscv-programs/example.elf --ex='target $(REMOTE_HOST):1234'
