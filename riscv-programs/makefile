PROG=example

OBJS= crt.o $(PROG).o 
# syscalls.o
#	  chipsupport.o \
#	  boardsupport.o \

CC=riscv32-unknown-elf-gcc 

INCLUDES=../riscv-core/src/

OBJCPY=riscv32-unknown-elf-objcopy

OBJDUMP=riscv32-unknown-elf-objdump
 
$(PROG).bin : $(PROG).elf    ../bin/genrom
	$(OBJCPY) -O binary $(PROG).elf $(PROG).bin  
	$(OBJCPY) -O ihex $(PROG).elf $(PROG).hex  
	$(OBJDUMP) -drwC -S $(PROG).elf > $(PROG).lst
	../bin/genrom $(PROG).bin ../riscv-core/src/rom.h
	
$(PROG).elf : $(OBJS) ../bin/genrom   
	$(CC) -g -static -nostdlib -nostartfiles -o $(PROG).elf -lm -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)    

$(PROG).o : $(PROG).c
	$(CC) -c -g -o $(PROG).o $(PROG).c 

../bin/genrom: utils/genrom.cpp ../riscv-core/src/asm.cpp
	g++ -I$(INCLUDES) -Wno-write-strings -o $@ $^  	

chipsupport.o : chipsupport.c
	$(CC) -c -g -o chipsupport.o -c chipsupport.c 

boardsupport.o : boardsupport.c
	$(CC) -c -g -o boardsupport.o -c boardsupport.c 
 	
syscalls.o : syscalls.c  
	$(CC) -c -g -o syscalls.o -c syscalls.c 

crt.o : crt.s
	$(CC) -c -o crt.o crt.s 
	
clean:
	rm *.o *.elf *.hex *.bin *.lst	
	