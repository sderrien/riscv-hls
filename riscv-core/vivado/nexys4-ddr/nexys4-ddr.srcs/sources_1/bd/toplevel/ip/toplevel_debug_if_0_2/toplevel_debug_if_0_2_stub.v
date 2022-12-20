// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Dec 16 14:37:40 2022
// Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/sderrien/riscv-hls/riscv-core/vivado/nexys4-ddr/nexys4-ddr.srcs/sources_1/bd/toplevel/ip/toplevel_debug_if_0_2/toplevel_debug_if_0_2_stub.v
// Design      : toplevel_debug_if_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "debug_if,Vivado 2020.1" *)
module toplevel_debug_if_0_2(clk, BTNC, BTNU, BTND, BTNR, SW, CN, AN, LED, debug, step, pc, 
  ir, a, b, r)
/* synthesis syn_black_box black_box_pad_pin="clk,BTNC,BTNU,BTND,BTNR,SW[15:0],CN[7:0],AN[7:0],LED[15:0],debug,step,pc[31:0],ir[31:0],a[31:0],b[31:0],r[31:0]" */;
  input clk;
  input BTNC;
  input BTNU;
  input BTND;
  input BTNR;
  input [15:0]SW;
  output [7:0]CN;
  output [7:0]AN;
  output [15:0]LED;
  output debug;
  output step;
  input [31:0]pc;
  input [31:0]ir;
  input [31:0]a;
  input [31:0]b;
  input [31:0]r;
endmodule
