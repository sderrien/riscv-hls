RISC-V HLS  
================

This project provides a RISCV processor IP synthesized with Vivavo HLS from a pure behavioral model (
in the form of an Instruction Set Simulator), along with an example design targeting the Nexys4-DDR board.

The proposed ISS implements the rvi32 instruction set. Support for debug through gdb is provided
by two distinct gdbserver implementations : one which operates from the ISS, the other interacting with 
the board through the USB-UART.
 

Disclaimer
----------

Our goal is *not* to obtain an efficient hardware implementation (the hardware infered by HLS roughly correspond to a 
micro-code implementation), but rather to provide a sandbox to play/modify the core.
  

Prerequisites
-------------


- Nexys4-DDR FPGA board from digilent

- Vivado HLS 2020 + Vivado (should work on other versions too)
 
- Riscv32 toolchain (gcc + bintuils + gdb)


Installation
------------

Get the sources from the repo

	git clone 
 
Update `PATH` with local folders 

	export PATH=$PATH:#$install_dir/bin
 
Synthesize  RTL for the CPU ISS with Vivado HLS

	make -C ./riscv-core hls_ip

Perform logic sythesis, place & route and geenrate bitstream

	make -C ./vivado bistream

Program the Nexys4-DDR board (assume /dev/ttyUSB1)   

	make -C ./vivado program

Compiling RISCV programs 

	make -C ./riscv-programs 


Usage (from command line) 
-------------------------

Debugging a progam using the ISS model running on the host CPU
	
	gdb-server-iss
	riscv32-unknown-elf-gdb -ex "target remote :1234" ../riscv-programs/example.elf

Debugging a program running on the RISCV core on the FPGA

	gdb-server-uart
	riscv32-unknown-elf-gdb -ex "target remote 1234" ../riscv-programs/example.elf


Usage (from Eclipse CDT) 
-------------------------



Limitations 
----------

- Gdb interrupts (CTRL-C) are not yet suppported, always add breakpoints or use step mode.
- Use set debug remote 1 to trace rsp protocol




