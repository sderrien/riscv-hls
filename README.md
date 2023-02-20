RISC-V HLS  
================

This project provides a RISCV processor IP synthesized with Vivavo HLS from a pure behavioral model (in the form of an Instruction Set Simulator), along with an example design targeting the Nexys4-DDR board.

The proposed ISS implements the rvi32 instruction set. Support for debug through `gdb` is provided by two distinct `gdbserver` implementations : one which operates from the ISS, the other interacting with the board through the USB-UART.
 

Disclaimer
----------

Our goal is *not* to obtain an efficient hardware CPU implementation (the hardware infered by HLS roughly correspond to a  micro-code implementation), but rather to provide a sandbox to play with/modify a simple hardware model.

Prerequisites
-------------


- Nexys4-DDR FPGA board from Digilent
- Vivado 2020 (Vivado HLS) -- should work on other versions too
- RISCV-32 toolchain (`gcc` + bintuils + `gdb`). For example, see https://github.com/riscv-collab/riscv-gnu-toolchain.


Setup
-----

Get the sources from the repo

```console
$ git clone https://github.com/sderrien/riscv-hls.git
```

Update `PATH` with local folders 

```console
$ cd riscv-hls
$ export PATH=$PATH:"$PWD/bin"
```


Installation
------------


Synthesize RTL for the CPU ISS with Vivado HLS.

```console
$ make hls
```

Perform logic sythesis, place & route and generate bitstream.

```console
$ make bistream
```

Program the Nexys4-DDR board through Digilent USB bridge.

```console
$ make program 
```

Compile `gdb` servers for RISCV.

```console
$ make gdb 
```

Compile RISCV example programs. 

```console
$ make elf 
```


Usage (from command line) 
-------------------------

To debug a program running on the ISS model running on the host CPU

```console
$ gdb-server-iss
$ riscv32-unknown-elf-gdb -ex "target remote :1234" ../riscv-programs/example.elf
```

To debug a program running on a behavioral model of the riscv + debug core on the host CPU

```console
$ gdb-server-pipe
$ riscv32-unknown-elf-gdb -ex "target remote :1234" ../riscv-programs/example.elf
```

To debug a program running on the FPGA using the RISCV hardware IP synthesized from the ISS model

```console
$ gdb-server-uart 
$ riscv32-unknown-elf-gdb -ex "target remote :1234" ../riscv-programs/example.elf
```


Usage (from Eclipse CDT) 
-------------------------

TODO


Limitations 
----------

- `gdb` interrupts (CTRL-C) are not yet well suppported, always add breakpoints or use step mode.
- Use `set debug remote 1` to trace rsp protocol

