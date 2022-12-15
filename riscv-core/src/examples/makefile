PROG=example

OBJS= crt.o  $(PROG).o 
# syscalls.o
#	  chipsupport.o \
#	  boardsupport.o \

CC=/opt/riscv32/bin/riscv32-unknown-elf-gcc -march=rv32i_zicsr
OBJCPY=/opt/riscv32/bin/riscv32-unknown-elf-objcopy
OBJDUMP=/opt/riscv32/bin/riscv32-unknown-elf-objdump
 
$(PROG).bin : $(PROG).elf    
	$(OBJCPY) -O binary $(PROG).elf $(PROG).bin  
	$(OBJCPY) -O ihex $(PROG).elf $(PROG).hex  
	$(OBJDUMP) -d $(PROG).elf > $(PROG).lst  
	
$(PROG).elf : $(OBJS)    
	$(CC) -g -static -nostdlib -nostartfiles -o $(PROG).elf -lm -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)    

$(PROG).o : $(PROG).c
	$(CC) -c -g -o $(PROG).o $(PROG).c 

chipsupport.o : chipsupport.c
	$(CC) -c -g -o chipsupport.o -c chipsupport.c 

boardsupport.o : boardsupport.c
	$(CC) -c -g -o boardsupport.o -c boardsupport.c 
 	
syscalls.o : syscalls.c  
	$(CC) -c -g -o syscalls.o -c syscalls.c 

crt.o : crt.s
	$(CC) -c -o crt.o crt.s 
	
	
	