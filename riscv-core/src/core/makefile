all: uart_server uart_client  

uart_server: asm.cpp miniriscv.cpp uart_server.cpp
	g++ -g -O0 -o uart_server asm.cpp miniriscv.cpp uart_server.cpp 

uart_client: uart_client.cpp ../rsp/target-pipe.cpp ../rsp/target-common.cpp
	gcc -g -O0 -o uart_client uart_client.cpp ../rsp/target-pipe.cpp ../rsp/target-common.cpp

clean:
	rm uart_server uart_client  *.txt