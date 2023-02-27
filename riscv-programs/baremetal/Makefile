
PROG=baremetal

OBJS= crt.o boardsupport.o $(PROG).o
# div.o 

CC=riscv32-unknown-elf-gcc
CFLAGS = -march=rv32i_zicsr -mabi=ilp32 -g -O3

CPP=riscv32-unknown-elf-cpp

INCLUDES=./

OBJCPY=riscv32-unknown-elf-objcopy

OBJDUMP=riscv32-unknown-elf-objdump

$(PROG).bin : $(PROG).elf 
	$(OBJCPY) -O binary $(PROG).elf $(PROG).bin  
	$(OBJCPY) -O ihex $(PROG).elf $(PROG).hex  
	$(OBJDUMP) -drwC -S $(PROG).elf > $(PROG).lst
	genrom $(PROG).bin ../../riscv-core/src/rom.h
	
$(PROG).elf : $(OBJS)    
	$(CC) $(CFLAGS) -static -nostartfiles -o $(PROG).elf -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)

$(PROG).o : $(PROG).c
	$(CC) $(CFLAGS) -c -I./include/ -g -o $(PROG).o $(PROG).c 
	$(CC) $(CFLAGS) -S -I./include/ -g -o $(PROG).s $(PROG).c 

crt.o : crt.s
	$(CPP) -E crt.s > _crt.s 
	$(CC) $(CFLAGS) -I$(INCLUDES) -c -o $@ _$^  

div.o : div.S
	$(CC) $(CFLAGS) -I$(INCLUDES) -c -o $@ $^  


boardsupport.o : boardsupport.c
	$(CC) $(CFLAGS) -c -g -I./include/ -o $@ $^  

debug:
	../../bin 
	
clean:
	rm -f *.o *.elf *.hex *.bin *.lst

debug_iss: ./$(PROG).elf
	make -C ../../ gdb
	open -a Terminal ../../bin/gdb-server-iss 
	riscv32-unknown-elf-gdb ./$(PROG).elf --ex='target remote:1234' --ex='load ./$(PROG).elf' --ex='break main'  


run_iss: ./$(PROG).bin
	make -C ../../ gdb
	../../bin/riscv-sim 	./$(PROG).bin

