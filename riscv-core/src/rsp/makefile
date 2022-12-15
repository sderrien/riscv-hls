all: rsp-server-pipe rsp-server-iss

rsp-server-iss : rsp-server.cpp target-sim.cpp ../core/miniriscv.cpp ../core/asm.cpp
	g++ -g -O0 -I../core/ -o rsp-server-iss rsp-server.cpp target-sim.cpp ../core/miniriscv.cpp ../core/asm.cpp 


rsp-server-pipe : rsp-server.cpp target-pipe.cpp target-common.cpp
	g++ -g -O0 -o rsp-server-pipe rsp-server.cpp target-pipe.cpp target-common.cpp 
	
rsp-server-uart : rsp-server.cpp target-uart.cpp target-common.cpp
	g++ -g -O0 -o rsp-server-uart rsp-server.cpp target-uart.cpp target-common.cpp 
	
	