PROG=femto-rv32i

OBJS= $(PROG).o 

CC=riscv32-unknown-elf-gcc
CFLAGS=-march=rv32i_zicsr -mabi=ilp32 -g -O0

INCLUDES=../include/

OBJCPY=riscv32-unknown-elf-objcopy

OBJDUMP=riscv32-unknown-elf-objdump
 
all: $(PROG).bin
 
$(PROG).bin : $(PROG).elf 
	$(OBJCPY) -O binary $(PROG).elf $(PROG).bin  
	$(OBJCPY) -O ihex $(PROG).elf $(PROG).hex  
	$(OBJDUMP) -drwC -Mno-aliases -S $(PROG).elf > $(PROG).lst
	
$(PROG).elf : $(OBJS)    
	$(CC) -g -static -nostartfiles -o $(PROG).elf -lm -lgcc -Tlink.ld -Wl,-gc-sections $(OBJS)    

$(PROG).o : $(PROG).s
	$(CC) $(CFLAGS) -g -I$(INCLUDES) -c -o $@ $^  

rom:
	genrom $(PROG).bin rom.h
	
clean:
	rm -f *.o *.elf *.hex *.bin *.lst

