PROG=helloworld

OBJS= crt.o $(PROG).o 

CC=riscv32-unknown-elf-gcc
CFLAGS=-march=rv32i_zicsr -g -O0

INCLUDES=../include/

OBJCPY=riscv32-unknown-elf-objcopy

OBJDUMP=riscv32-unknown-elf-objdump
 
$(PROG).bin : $(PROG).elf 
	$(OBJCPY) -O binary $(PROG).elf $(PROG).bin  
	$(OBJCPY) -O ihex $(PROG).elf $(PROG).hex  
	$(OBJDUMP) -drwC -S $(PROG).elf > $(PROG).lst
	genrom $(PROG).bin ../../riscv-core/src/rom.h
	
$(PROG).elf : $(OBJS)    
	$(CC) -g -static -nostartfiles -o $(PROG).elf -lm -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)    

$(PROG).o : $(PROG).c
	$(CC) $(CFLAGS) -c -I$(INCLUDES) -g -o $(PROG).o $(PROG).c 
	$(CC) $(CFLAGS) -S -I$(INCLUDES) -g -o $(PROG).s $(PROG).c 

crt.o : crt.s
	$(CC) $(CFLAGS) -I$(INCLUDES) -c -o $@ $^  
	
clean:
	rm *.o *.elf *.hex *.bin *.lst	
	