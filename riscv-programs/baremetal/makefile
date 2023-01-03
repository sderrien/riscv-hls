
PROG=baremetal

OBJS= crt.o boardsupport.o $(PROG).o
# div.o 

CC=riscv32-unknown-elf-gcc -march=rv32i_zicsr -mabi=ilp32 -g -O3

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
	$(CC) -g -static -nostartfiles -o $(PROG).elf -Tlink.ld -Wl,-gc-sections $(OBJS)    
#-lm -lgcc 
#$(PROG)-libc.elf : $(OBJS)    
#	$(CC) -g -static -nostdlib -nostartfiles -o $(PROG).elf -lm -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)    

$(PROG).o : $(PROG).c
	$(CC) -c -I./include/ -g -o $(PROG).o $(PROG).c 
	$(CC) -S -I./include/ -g -o $(PROG).s $(PROG).c 

crt.o : crt.s
	$(CPP) -E crt.s > _crt.s 
	$(CC) -I$(INCLUDES) -c -o $@ _$^  

div.o : div.S
	$(CC) -I$(INCLUDES) -c -o $@ $^  


boardsupport.o : boardsupport.c
	$(CC) -c -g -I./include/ -o $@ $^  

debug:
	../../bin 
	
clean:
	rm *.o *.elf *.hex *.bin *.lst	
	