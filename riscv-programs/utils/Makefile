CFLAGS = -g -O0

all : genrom 

../../bin/genrom:	genrom.cpp ../core/asm.cpp 
	g++ $(INCLUDES) -Wno-write-strings -o $@ $^  


clean:
	rm -fr *.o genrom
	