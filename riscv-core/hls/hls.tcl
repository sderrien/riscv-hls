############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project uart_master
set_top uart_master
add_files -cflags "-I../../riscv-gdbserver -I../src" ../src/asm.cpp
add_files -cflags "-I../../riscv-gdbserver -I../src" ../src/riscv-iss.cpp
add_files -cflags "-I../../riscv-gdbserver -I../src" ../src/uart_master.cpp
open_solution "solution1"
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog  -version 2.0.1;
csynth_design
export_design -rtl verilog -format ip_catalog 
exit