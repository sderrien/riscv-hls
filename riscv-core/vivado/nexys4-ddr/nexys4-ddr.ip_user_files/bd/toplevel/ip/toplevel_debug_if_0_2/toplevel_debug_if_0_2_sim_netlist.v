// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Dec 16 14:37:40 2022
// Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sderrien/riscv-hls/riscv-core/vivado/nexys4-ddr/nexys4-ddr.srcs/sources_1/bd/toplevel/ip/toplevel_debug_if_0_2/toplevel_debug_if_0_2_sim_netlist.v
// Design      : toplevel_debug_if_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "toplevel_debug_if_0_2,debug_if,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "debug_if,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module toplevel_debug_if_0_2
   (clk,
    BTNC,
    BTNU,
    BTND,
    BTNR,
    SW,
    CN,
    AN,
    LED,
    debug,
    step,
    pc,
    ir,
    a,
    b,
    r);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN toplevel_clk, INSERT_VIP 0" *) input clk;
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

  wire \<const1> ;
  wire [7:0]AN;
  wire BTND;
  wire BTNR;
  wire BTNU;
  wire [6:0]\^CN ;
  wire [15:0]LED;
  wire [15:0]SW;
  wire [31:0]a;
  wire [31:0]b;
  wire clk;
  wire debug;
  wire [31:0]ir;
  wire [31:0]pc;
  wire [31:0]r;
  wire step;

  assign CN[7] = \<const1> ;
  assign CN[6:0] = \^CN [6:0];
  toplevel_debug_if_0_2_debug_if U0
       (.AN(AN),
        .BTND(BTND),
        .BTNR(BTNR),
        .BTNU(BTNU),
        .CN(\^CN ),
        .LED(LED),
        .SW({SW[15],SW[2:0]}),
        .a(a),
        .b(b),
        .clk(clk),
        .debug(debug),
        .ir(ir),
        .pc(pc),
        .r(r),
        .step(step));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "debug_if" *) 
module toplevel_debug_if_0_2_debug_if
   (CN,
    AN,
    debug,
    LED,
    step,
    clk,
    BTND,
    BTNU,
    SW,
    BTNR,
    r,
    b,
    a,
    ir,
    pc);
  output [6:0]CN;
  output [7:0]AN;
  output debug;
  output [15:0]LED;
  output step;
  input clk;
  input BTND;
  input BTNU;
  input [3:0]SW;
  input BTNR;
  input [31:0]r;
  input [31:0]b;
  input [31:0]a;
  input [31:0]ir;
  input [31:0]pc;

  wire [7:0]AN;
  wire \AN[0]_i_1_n_0 ;
  wire \AN[1]_i_1_n_0 ;
  wire \AN[2]_i_1_n_0 ;
  wire \AN[3]_i_1_n_0 ;
  wire \AN[4]_i_1_n_0 ;
  wire \AN[5]_i_1_n_0 ;
  wire \AN[6]_i_1_n_0 ;
  wire \AN[7]_i_1_n_0 ;
  wire BTND;
  wire BTNR;
  wire BTNU;
  wire [6:0]CN;
  wire \CN[0]_i_10_n_0 ;
  wire \CN[0]_i_11_n_0 ;
  wire \CN[0]_i_13_n_0 ;
  wire \CN[0]_i_6_n_0 ;
  wire \CN[0]_i_7_n_0 ;
  wire \CN[0]_i_8_n_0 ;
  wire \CN[0]_i_9_n_0 ;
  wire \CN[1]_i_10_n_0 ;
  wire \CN[1]_i_11_n_0 ;
  wire \CN[1]_i_13_n_0 ;
  wire \CN[1]_i_6_n_0 ;
  wire \CN[1]_i_7_n_0 ;
  wire \CN[1]_i_8_n_0 ;
  wire \CN[1]_i_9_n_0 ;
  wire \CN[2]_i_10_n_0 ;
  wire \CN[2]_i_11_n_0 ;
  wire \CN[2]_i_13_n_0 ;
  wire \CN[2]_i_6_n_0 ;
  wire \CN[2]_i_7_n_0 ;
  wire \CN[2]_i_8_n_0 ;
  wire \CN[2]_i_9_n_0 ;
  wire \CN[3]_i_10_n_0 ;
  wire \CN[3]_i_11_n_0 ;
  wire \CN[3]_i_13_n_0 ;
  wire \CN[3]_i_6_n_0 ;
  wire \CN[3]_i_7_n_0 ;
  wire \CN[3]_i_8_n_0 ;
  wire \CN[3]_i_9_n_0 ;
  wire \CN[4]_i_10_n_0 ;
  wire \CN[4]_i_11_n_0 ;
  wire \CN[4]_i_13_n_0 ;
  wire \CN[4]_i_6_n_0 ;
  wire \CN[4]_i_7_n_0 ;
  wire \CN[4]_i_8_n_0 ;
  wire \CN[4]_i_9_n_0 ;
  wire \CN[5]_i_10_n_0 ;
  wire \CN[5]_i_11_n_0 ;
  wire \CN[5]_i_13_n_0 ;
  wire \CN[5]_i_6_n_0 ;
  wire \CN[5]_i_7_n_0 ;
  wire \CN[5]_i_8_n_0 ;
  wire \CN[5]_i_9_n_0 ;
  wire \CN[6]_i_10_n_0 ;
  wire \CN[6]_i_11_n_0 ;
  wire \CN[6]_i_13_n_0 ;
  wire \CN[6]_i_6_n_0 ;
  wire \CN[6]_i_7_n_0 ;
  wire \CN[6]_i_8_n_0 ;
  wire \CN[6]_i_9_n_0 ;
  wire [6:0]CN_1;
  wire \CN_reg[0]_i_2_n_0 ;
  wire \CN_reg[0]_i_3_n_0 ;
  wire \CN_reg[0]_i_4_n_0 ;
  wire \CN_reg[0]_i_5_n_0 ;
  wire \CN_reg[1]_i_2_n_0 ;
  wire \CN_reg[1]_i_3_n_0 ;
  wire \CN_reg[1]_i_4_n_0 ;
  wire \CN_reg[1]_i_5_n_0 ;
  wire \CN_reg[2]_i_2_n_0 ;
  wire \CN_reg[2]_i_3_n_0 ;
  wire \CN_reg[2]_i_4_n_0 ;
  wire \CN_reg[2]_i_5_n_0 ;
  wire \CN_reg[3]_i_2_n_0 ;
  wire \CN_reg[3]_i_3_n_0 ;
  wire \CN_reg[3]_i_4_n_0 ;
  wire \CN_reg[3]_i_5_n_0 ;
  wire \CN_reg[4]_i_2_n_0 ;
  wire \CN_reg[4]_i_3_n_0 ;
  wire \CN_reg[4]_i_4_n_0 ;
  wire \CN_reg[4]_i_5_n_0 ;
  wire \CN_reg[5]_i_2_n_0 ;
  wire \CN_reg[5]_i_3_n_0 ;
  wire \CN_reg[5]_i_4_n_0 ;
  wire \CN_reg[5]_i_5_n_0 ;
  wire \CN_reg[6]_i_2_n_0 ;
  wire \CN_reg[6]_i_3_n_0 ;
  wire \CN_reg[6]_i_4_n_0 ;
  wire \CN_reg[6]_i_5_n_0 ;
  wire [15:0]LED;
  wire [3:0]SW;
  wire [31:0]a;
  wire [31:0]b;
  wire [3:0]bounceregd;
  wire [3:0]bounceregr;
  wire [3:0]bounceregu;
  wire clk;
  wire \count[0]_i_2_n_0 ;
  wire \count_reg[0]_i_1_n_0 ;
  wire \count_reg[0]_i_1_n_1 ;
  wire \count_reg[0]_i_1_n_2 ;
  wire \count_reg[0]_i_1_n_3 ;
  wire \count_reg[0]_i_1_n_4 ;
  wire \count_reg[0]_i_1_n_5 ;
  wire \count_reg[0]_i_1_n_6 ;
  wire \count_reg[0]_i_1_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[19]_i_1_n_0 ;
  wire \count_reg[19]_i_1_n_1 ;
  wire \count_reg[19]_i_1_n_2 ;
  wire \count_reg[19]_i_1_n_3 ;
  wire \count_reg[19]_i_1_n_4 ;
  wire \count_reg[19]_i_1_n_5 ;
  wire \count_reg[19]_i_1_n_6 ;
  wire \count_reg[19]_i_1_n_7 ;
  wire \count_reg[23]_i_1_n_0 ;
  wire \count_reg[23]_i_1_n_1 ;
  wire \count_reg[23]_i_1_n_2 ;
  wire \count_reg[23]_i_1_n_3 ;
  wire \count_reg[23]_i_1_n_4 ;
  wire \count_reg[23]_i_1_n_5 ;
  wire \count_reg[23]_i_1_n_6 ;
  wire \count_reg[23]_i_1_n_7 ;
  wire \count_reg[27]_i_1_n_0 ;
  wire \count_reg[27]_i_1_n_1 ;
  wire \count_reg[27]_i_1_n_2 ;
  wire \count_reg[27]_i_1_n_3 ;
  wire \count_reg[27]_i_1_n_4 ;
  wire \count_reg[27]_i_1_n_5 ;
  wire \count_reg[27]_i_1_n_6 ;
  wire \count_reg[27]_i_1_n_7 ;
  wire \count_reg[31]_i_1_n_1 ;
  wire \count_reg[31]_i_1_n_2 ;
  wire \count_reg[31]_i_1_n_3 ;
  wire \count_reg[31]_i_1_n_4 ;
  wire \count_reg[31]_i_1_n_5 ;
  wire \count_reg[31]_i_1_n_6 ;
  wire \count_reg[31]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[12] ;
  wire \count_reg_n_0_[13] ;
  wire \count_reg_n_0_[14] ;
  wire \count_reg_n_0_[15] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire \count_reg_n_0_[5] ;
  wire \count_reg_n_0_[6] ;
  wire \count_reg_n_0_[7] ;
  wire \count_reg_n_0_[8] ;
  wire cpt;
  wire \cpt[0]_i_3_n_0 ;
  wire \cpt[0]_i_4_n_0 ;
  wire \cpt[0]_i_5_n_0 ;
  wire \cpt[0]_i_6_n_0 ;
  wire \cpt[0]_i_7_n_0 ;
  wire \cpt[0]_i_8_n_0 ;
  wire \cpt[0]_i_9_n_0 ;
  wire \cpt[12]_i_2_n_0 ;
  wire \cpt[12]_i_3_n_0 ;
  wire \cpt[12]_i_4_n_0 ;
  wire \cpt[12]_i_5_n_0 ;
  wire \cpt[16]_i_2_n_0 ;
  wire \cpt[16]_i_3_n_0 ;
  wire \cpt[16]_i_4_n_0 ;
  wire \cpt[16]_i_5_n_0 ;
  wire \cpt[20]_i_2_n_0 ;
  wire \cpt[20]_i_3_n_0 ;
  wire \cpt[20]_i_4_n_0 ;
  wire \cpt[20]_i_5_n_0 ;
  wire \cpt[24]_i_2_n_0 ;
  wire \cpt[24]_i_3_n_0 ;
  wire \cpt[24]_i_4_n_0 ;
  wire \cpt[24]_i_5_n_0 ;
  wire \cpt[28]_i_2_n_0 ;
  wire \cpt[28]_i_3_n_0 ;
  wire \cpt[28]_i_4_n_0 ;
  wire \cpt[28]_i_5_n_0 ;
  wire \cpt[4]_i_2_n_0 ;
  wire \cpt[4]_i_3_n_0 ;
  wire \cpt[4]_i_4_n_0 ;
  wire \cpt[4]_i_5_n_0 ;
  wire \cpt[8]_i_2_n_0 ;
  wire \cpt[8]_i_3_n_0 ;
  wire \cpt[8]_i_4_n_0 ;
  wire \cpt[8]_i_5_n_0 ;
  wire [31:0]cpt_reg;
  wire \cpt_reg[0]_i_2_n_0 ;
  wire \cpt_reg[0]_i_2_n_1 ;
  wire \cpt_reg[0]_i_2_n_2 ;
  wire \cpt_reg[0]_i_2_n_3 ;
  wire \cpt_reg[0]_i_2_n_4 ;
  wire \cpt_reg[0]_i_2_n_5 ;
  wire \cpt_reg[0]_i_2_n_6 ;
  wire \cpt_reg[0]_i_2_n_7 ;
  wire \cpt_reg[12]_i_1_n_0 ;
  wire \cpt_reg[12]_i_1_n_1 ;
  wire \cpt_reg[12]_i_1_n_2 ;
  wire \cpt_reg[12]_i_1_n_3 ;
  wire \cpt_reg[12]_i_1_n_4 ;
  wire \cpt_reg[12]_i_1_n_5 ;
  wire \cpt_reg[12]_i_1_n_6 ;
  wire \cpt_reg[12]_i_1_n_7 ;
  wire \cpt_reg[16]_i_1_n_0 ;
  wire \cpt_reg[16]_i_1_n_1 ;
  wire \cpt_reg[16]_i_1_n_2 ;
  wire \cpt_reg[16]_i_1_n_3 ;
  wire \cpt_reg[16]_i_1_n_4 ;
  wire \cpt_reg[16]_i_1_n_5 ;
  wire \cpt_reg[16]_i_1_n_6 ;
  wire \cpt_reg[16]_i_1_n_7 ;
  wire \cpt_reg[20]_i_1_n_0 ;
  wire \cpt_reg[20]_i_1_n_1 ;
  wire \cpt_reg[20]_i_1_n_2 ;
  wire \cpt_reg[20]_i_1_n_3 ;
  wire \cpt_reg[20]_i_1_n_4 ;
  wire \cpt_reg[20]_i_1_n_5 ;
  wire \cpt_reg[20]_i_1_n_6 ;
  wire \cpt_reg[20]_i_1_n_7 ;
  wire \cpt_reg[24]_i_1_n_0 ;
  wire \cpt_reg[24]_i_1_n_1 ;
  wire \cpt_reg[24]_i_1_n_2 ;
  wire \cpt_reg[24]_i_1_n_3 ;
  wire \cpt_reg[24]_i_1_n_4 ;
  wire \cpt_reg[24]_i_1_n_5 ;
  wire \cpt_reg[24]_i_1_n_6 ;
  wire \cpt_reg[24]_i_1_n_7 ;
  wire \cpt_reg[28]_i_1_n_1 ;
  wire \cpt_reg[28]_i_1_n_2 ;
  wire \cpt_reg[28]_i_1_n_3 ;
  wire \cpt_reg[28]_i_1_n_4 ;
  wire \cpt_reg[28]_i_1_n_5 ;
  wire \cpt_reg[28]_i_1_n_6 ;
  wire \cpt_reg[28]_i_1_n_7 ;
  wire \cpt_reg[4]_i_1_n_0 ;
  wire \cpt_reg[4]_i_1_n_1 ;
  wire \cpt_reg[4]_i_1_n_2 ;
  wire \cpt_reg[4]_i_1_n_3 ;
  wire \cpt_reg[4]_i_1_n_4 ;
  wire \cpt_reg[4]_i_1_n_5 ;
  wire \cpt_reg[4]_i_1_n_6 ;
  wire \cpt_reg[4]_i_1_n_7 ;
  wire \cpt_reg[8]_i_1_n_0 ;
  wire \cpt_reg[8]_i_1_n_1 ;
  wire \cpt_reg[8]_i_1_n_2 ;
  wire \cpt_reg[8]_i_1_n_3 ;
  wire \cpt_reg[8]_i_1_n_4 ;
  wire \cpt_reg[8]_i_1_n_5 ;
  wire \cpt_reg[8]_i_1_n_6 ;
  wire \cpt_reg[8]_i_1_n_7 ;
  wire [31:0]data;
  wire \data[0]_i_2_n_0 ;
  wire \data[10]_i_2_n_0 ;
  wire \data[11]_i_2_n_0 ;
  wire \data[12]_i_2_n_0 ;
  wire \data[13]_i_2_n_0 ;
  wire \data[14]_i_2_n_0 ;
  wire \data[15]_i_2_n_0 ;
  wire \data[16]_i_2_n_0 ;
  wire \data[17]_i_2_n_0 ;
  wire \data[18]_i_2_n_0 ;
  wire \data[19]_i_2_n_0 ;
  wire \data[1]_i_2_n_0 ;
  wire \data[20]_i_2_n_0 ;
  wire \data[21]_i_2_n_0 ;
  wire \data[22]_i_2_n_0 ;
  wire \data[23]_i_2_n_0 ;
  wire \data[24]_i_2_n_0 ;
  wire \data[25]_i_2_n_0 ;
  wire \data[26]_i_2_n_0 ;
  wire \data[27]_i_2_n_0 ;
  wire \data[28]_i_2_n_0 ;
  wire \data[29]_i_2_n_0 ;
  wire \data[2]_i_2_n_0 ;
  wire \data[30]_i_2_n_0 ;
  wire \data[31]_i_2_n_0 ;
  wire \data[3]_i_2_n_0 ;
  wire \data[4]_i_2_n_0 ;
  wire \data[5]_i_2_n_0 ;
  wire \data[6]_i_2_n_0 ;
  wire \data[7]_i_2_n_0 ;
  wire \data[8]_i_2_n_0 ;
  wire \data[9]_i_2_n_0 ;
  wire \data_reg_n_0_[0] ;
  wire \data_reg_n_0_[10] ;
  wire \data_reg_n_0_[11] ;
  wire \data_reg_n_0_[12] ;
  wire \data_reg_n_0_[13] ;
  wire \data_reg_n_0_[14] ;
  wire \data_reg_n_0_[15] ;
  wire \data_reg_n_0_[16] ;
  wire \data_reg_n_0_[17] ;
  wire \data_reg_n_0_[18] ;
  wire \data_reg_n_0_[19] ;
  wire \data_reg_n_0_[1] ;
  wire \data_reg_n_0_[20] ;
  wire \data_reg_n_0_[21] ;
  wire \data_reg_n_0_[22] ;
  wire \data_reg_n_0_[23] ;
  wire \data_reg_n_0_[24] ;
  wire \data_reg_n_0_[25] ;
  wire \data_reg_n_0_[26] ;
  wire \data_reg_n_0_[27] ;
  wire \data_reg_n_0_[28] ;
  wire \data_reg_n_0_[29] ;
  wire \data_reg_n_0_[2] ;
  wire \data_reg_n_0_[30] ;
  wire \data_reg_n_0_[31] ;
  wire \data_reg_n_0_[3] ;
  wire \data_reg_n_0_[8] ;
  wire \data_reg_n_0_[9] ;
  wire debug;
  wire eqOp;
  wire eqOp_0;
  wire [31:0]ir;
  wire [2:0]p_0_in;
  wire [31:0]pc;
  wire [31:0]r;
  wire [6:0]res__32;
  wire [3:0]sel0;
  wire step;
  wire step_i_1_n_0;
  wire step_i_2_n_0;
  wire step_i_3_n_0;
  wire step_i_4_n_0;
  wire step_i_5_n_0;
  wire [3:3]\NLW_count_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_cpt_reg[28]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \AN[0]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[2]),
        .O(\AN[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \AN[1]_i_1 
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .O(\AN[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \AN[2]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .O(\AN[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \AN[3]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in[2]),
        .O(\AN[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \AN[4]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[2]),
        .O(\AN[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \AN[5]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[2]),
        .O(\AN[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \AN[6]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[2]),
        .I2(p_0_in[0]),
        .O(\AN[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \AN[7]_i_1 
       (.I0(p_0_in[2]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\AN[7]_i_1_n_0 ));
  FDSE \AN_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[0]_i_1_n_0 ),
        .Q(AN[0]),
        .S(p_0_in[1]));
  FDSE \AN_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[1]_i_1_n_0 ),
        .Q(AN[1]),
        .S(p_0_in[1]));
  FDRE \AN_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[2]_i_1_n_0 ),
        .Q(AN[2]),
        .R(1'b0));
  FDRE \AN_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[3]_i_1_n_0 ),
        .Q(AN[3]),
        .R(1'b0));
  FDSE \AN_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[4]_i_1_n_0 ),
        .Q(AN[4]),
        .S(p_0_in[1]));
  FDSE \AN_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[5]_i_1_n_0 ),
        .Q(AN[5]),
        .S(p_0_in[1]));
  FDRE \AN_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[6]_i_1_n_0 ),
        .Q(AN[6]),
        .R(1'b0));
  FDRE \AN_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\AN[7]_i_1_n_0 ),
        .Q(AN[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[0]_i_1 
       (.I0(\CN_reg[0]_i_2_n_0 ),
        .I1(\CN_reg[0]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[0]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[0]_i_5_n_0 ),
        .O(CN_1[0]));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[10] ),
        .I2(\data_reg_n_0_[8] ),
        .I3(\data_reg_n_0_[9] ),
        .O(\CN[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[14] ),
        .I2(\data_reg_n_0_[12] ),
        .I3(\data_reg_n_0_[13] ),
        .O(\CN[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[2] ),
        .I2(\data_reg_n_0_[0] ),
        .I3(\data_reg_n_0_[1] ),
        .O(res__32[0]));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(\CN[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[26] ),
        .I2(\data_reg_n_0_[24] ),
        .I3(\data_reg_n_0_[25] ),
        .O(\CN[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[30] ),
        .I2(\data_reg_n_0_[28] ),
        .I3(\data_reg_n_0_[29] ),
        .O(\CN[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[18] ),
        .I2(\data_reg_n_0_[16] ),
        .I3(\data_reg_n_0_[17] ),
        .O(\CN[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0094)) 
    \CN[0]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[22] ),
        .I2(\data_reg_n_0_[20] ),
        .I3(\data_reg_n_0_[21] ),
        .O(\CN[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[1]_i_1 
       (.I0(\CN_reg[1]_i_2_n_0 ),
        .I1(\CN_reg[1]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[1]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[1]_i_5_n_0 ),
        .O(CN_1[1]));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[10] ),
        .I2(\data_reg_n_0_[9] ),
        .I3(\data_reg_n_0_[8] ),
        .O(\CN[1]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[14] ),
        .I2(\data_reg_n_0_[13] ),
        .I3(\data_reg_n_0_[12] ),
        .O(\CN[1]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[2] ),
        .I2(\data_reg_n_0_[1] ),
        .I3(\data_reg_n_0_[0] ),
        .O(res__32[1]));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(\CN[1]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[26] ),
        .I2(\data_reg_n_0_[25] ),
        .I3(\data_reg_n_0_[24] ),
        .O(\CN[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[30] ),
        .I2(\data_reg_n_0_[29] ),
        .I3(\data_reg_n_0_[28] ),
        .O(\CN[1]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[18] ),
        .I2(\data_reg_n_0_[17] ),
        .I3(\data_reg_n_0_[16] ),
        .O(\CN[1]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h84C8)) 
    \CN[1]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[22] ),
        .I2(\data_reg_n_0_[21] ),
        .I3(\data_reg_n_0_[20] ),
        .O(\CN[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[2]_i_1 
       (.I0(\CN_reg[2]_i_2_n_0 ),
        .I1(\CN_reg[2]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[2]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[2]_i_5_n_0 ),
        .O(CN_1[2]));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[8] ),
        .I2(\data_reg_n_0_[9] ),
        .I3(\data_reg_n_0_[10] ),
        .O(\CN[2]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[12] ),
        .I2(\data_reg_n_0_[13] ),
        .I3(\data_reg_n_0_[14] ),
        .O(\CN[2]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[0] ),
        .I2(\data_reg_n_0_[1] ),
        .I3(\data_reg_n_0_[2] ),
        .O(res__32[2]));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[0]),
        .I2(sel0[1]),
        .I3(sel0[2]),
        .O(\CN[2]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[24] ),
        .I2(\data_reg_n_0_[25] ),
        .I3(\data_reg_n_0_[26] ),
        .O(\CN[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[28] ),
        .I2(\data_reg_n_0_[29] ),
        .I3(\data_reg_n_0_[30] ),
        .O(\CN[2]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[16] ),
        .I2(\data_reg_n_0_[17] ),
        .I3(\data_reg_n_0_[18] ),
        .O(\CN[2]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hA290)) 
    \CN[2]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[20] ),
        .I2(\data_reg_n_0_[21] ),
        .I3(\data_reg_n_0_[22] ),
        .O(\CN[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[3]_i_1 
       (.I0(\CN_reg[3]_i_2_n_0 ),
        .I1(\CN_reg[3]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[3]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[3]_i_5_n_0 ),
        .O(CN_1[3]));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[10] ),
        .I2(\data_reg_n_0_[8] ),
        .I3(\data_reg_n_0_[9] ),
        .O(\CN[3]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[14] ),
        .I2(\data_reg_n_0_[12] ),
        .I3(\data_reg_n_0_[13] ),
        .O(\CN[3]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[2] ),
        .I2(\data_reg_n_0_[0] ),
        .I3(\data_reg_n_0_[1] ),
        .O(res__32[3]));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(\CN[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[26] ),
        .I2(\data_reg_n_0_[24] ),
        .I3(\data_reg_n_0_[25] ),
        .O(\CN[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[30] ),
        .I2(\data_reg_n_0_[28] ),
        .I3(\data_reg_n_0_[29] ),
        .O(\CN[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[18] ),
        .I2(\data_reg_n_0_[16] ),
        .I3(\data_reg_n_0_[17] ),
        .O(\CN[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hE214)) 
    \CN[3]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[22] ),
        .I2(\data_reg_n_0_[20] ),
        .I3(\data_reg_n_0_[21] ),
        .O(\CN[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[4]_i_1 
       (.I0(\CN_reg[4]_i_2_n_0 ),
        .I1(\CN_reg[4]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[4]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[4]_i_5_n_0 ),
        .O(CN_1[4]));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[9] ),
        .I2(\data_reg_n_0_[10] ),
        .I3(\data_reg_n_0_[8] ),
        .O(\CN[4]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[13] ),
        .I2(\data_reg_n_0_[14] ),
        .I3(\data_reg_n_0_[12] ),
        .O(\CN[4]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[1] ),
        .I2(\data_reg_n_0_[2] ),
        .I3(\data_reg_n_0_[0] ),
        .O(res__32[4]));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[1]),
        .I2(sel0[2]),
        .I3(sel0[0]),
        .O(\CN[4]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[25] ),
        .I2(\data_reg_n_0_[26] ),
        .I3(\data_reg_n_0_[24] ),
        .O(\CN[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[29] ),
        .I2(\data_reg_n_0_[30] ),
        .I3(\data_reg_n_0_[28] ),
        .O(\CN[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[17] ),
        .I2(\data_reg_n_0_[18] ),
        .I3(\data_reg_n_0_[16] ),
        .O(\CN[4]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h5F10)) 
    \CN[4]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[21] ),
        .I2(\data_reg_n_0_[22] ),
        .I3(\data_reg_n_0_[20] ),
        .O(\CN[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[5]_i_1 
       (.I0(\CN_reg[5]_i_2_n_0 ),
        .I1(\CN_reg[5]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[5]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[5]_i_5_n_0 ),
        .O(CN_1[5]));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[10] ),
        .I2(\data_reg_n_0_[8] ),
        .I3(\data_reg_n_0_[9] ),
        .O(\CN[5]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[14] ),
        .I2(\data_reg_n_0_[12] ),
        .I3(\data_reg_n_0_[13] ),
        .O(\CN[5]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[2] ),
        .I2(\data_reg_n_0_[0] ),
        .I3(\data_reg_n_0_[1] ),
        .O(res__32[5]));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(\CN[5]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[26] ),
        .I2(\data_reg_n_0_[24] ),
        .I3(\data_reg_n_0_[25] ),
        .O(\CN[5]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[30] ),
        .I2(\data_reg_n_0_[28] ),
        .I3(\data_reg_n_0_[29] ),
        .O(\CN[5]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[18] ),
        .I2(\data_reg_n_0_[16] ),
        .I3(\data_reg_n_0_[17] ),
        .O(\CN[5]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7190)) 
    \CN[5]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[22] ),
        .I2(\data_reg_n_0_[20] ),
        .I3(\data_reg_n_0_[21] ),
        .O(\CN[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \CN[6]_i_1 
       (.I0(\CN_reg[6]_i_2_n_0 ),
        .I1(\CN_reg[6]_i_3_n_0 ),
        .I2(p_0_in[2]),
        .I3(\CN_reg[6]_i_4_n_0 ),
        .I4(p_0_in[1]),
        .I5(\CN_reg[6]_i_5_n_0 ),
        .O(CN_1[6]));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_10 
       (.I0(\data_reg_n_0_[11] ),
        .I1(\data_reg_n_0_[8] ),
        .I2(\data_reg_n_0_[10] ),
        .I3(\data_reg_n_0_[9] ),
        .O(\CN[6]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_11 
       (.I0(\data_reg_n_0_[15] ),
        .I1(\data_reg_n_0_[12] ),
        .I2(\data_reg_n_0_[14] ),
        .I3(\data_reg_n_0_[13] ),
        .O(\CN[6]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_12 
       (.I0(\data_reg_n_0_[3] ),
        .I1(\data_reg_n_0_[0] ),
        .I2(\data_reg_n_0_[2] ),
        .I3(\data_reg_n_0_[1] ),
        .O(res__32[6]));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_13 
       (.I0(sel0[3]),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .O(\CN[6]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_6 
       (.I0(\data_reg_n_0_[27] ),
        .I1(\data_reg_n_0_[24] ),
        .I2(\data_reg_n_0_[26] ),
        .I3(\data_reg_n_0_[25] ),
        .O(\CN[6]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_7 
       (.I0(\data_reg_n_0_[31] ),
        .I1(\data_reg_n_0_[28] ),
        .I2(\data_reg_n_0_[30] ),
        .I3(\data_reg_n_0_[29] ),
        .O(\CN[6]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_8 
       (.I0(\data_reg_n_0_[19] ),
        .I1(\data_reg_n_0_[16] ),
        .I2(\data_reg_n_0_[18] ),
        .I3(\data_reg_n_0_[17] ),
        .O(\CN[6]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h4825)) 
    \CN[6]_i_9 
       (.I0(\data_reg_n_0_[23] ),
        .I1(\data_reg_n_0_[20] ),
        .I2(\data_reg_n_0_[22] ),
        .I3(\data_reg_n_0_[21] ),
        .O(\CN[6]_i_9_n_0 ));
  FDRE \CN_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[0]),
        .Q(CN[0]),
        .R(1'b0));
  MUXF7 \CN_reg[0]_i_2 
       (.I0(\CN[0]_i_6_n_0 ),
        .I1(\CN[0]_i_7_n_0 ),
        .O(\CN_reg[0]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[0]_i_3 
       (.I0(\CN[0]_i_8_n_0 ),
        .I1(\CN[0]_i_9_n_0 ),
        .O(\CN_reg[0]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[0]_i_4 
       (.I0(\CN[0]_i_10_n_0 ),
        .I1(\CN[0]_i_11_n_0 ),
        .O(\CN_reg[0]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[0]_i_5 
       (.I0(res__32[0]),
        .I1(\CN[0]_i_13_n_0 ),
        .O(\CN_reg[0]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[1]),
        .Q(CN[1]),
        .R(1'b0));
  MUXF7 \CN_reg[1]_i_2 
       (.I0(\CN[1]_i_6_n_0 ),
        .I1(\CN[1]_i_7_n_0 ),
        .O(\CN_reg[1]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[1]_i_3 
       (.I0(\CN[1]_i_8_n_0 ),
        .I1(\CN[1]_i_9_n_0 ),
        .O(\CN_reg[1]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[1]_i_4 
       (.I0(\CN[1]_i_10_n_0 ),
        .I1(\CN[1]_i_11_n_0 ),
        .O(\CN_reg[1]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[1]_i_5 
       (.I0(res__32[1]),
        .I1(\CN[1]_i_13_n_0 ),
        .O(\CN_reg[1]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[2]),
        .Q(CN[2]),
        .R(1'b0));
  MUXF7 \CN_reg[2]_i_2 
       (.I0(\CN[2]_i_6_n_0 ),
        .I1(\CN[2]_i_7_n_0 ),
        .O(\CN_reg[2]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[2]_i_3 
       (.I0(\CN[2]_i_8_n_0 ),
        .I1(\CN[2]_i_9_n_0 ),
        .O(\CN_reg[2]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[2]_i_4 
       (.I0(\CN[2]_i_10_n_0 ),
        .I1(\CN[2]_i_11_n_0 ),
        .O(\CN_reg[2]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[2]_i_5 
       (.I0(res__32[2]),
        .I1(\CN[2]_i_13_n_0 ),
        .O(\CN_reg[2]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[3]),
        .Q(CN[3]),
        .R(1'b0));
  MUXF7 \CN_reg[3]_i_2 
       (.I0(\CN[3]_i_6_n_0 ),
        .I1(\CN[3]_i_7_n_0 ),
        .O(\CN_reg[3]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[3]_i_3 
       (.I0(\CN[3]_i_8_n_0 ),
        .I1(\CN[3]_i_9_n_0 ),
        .O(\CN_reg[3]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[3]_i_4 
       (.I0(\CN[3]_i_10_n_0 ),
        .I1(\CN[3]_i_11_n_0 ),
        .O(\CN_reg[3]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[3]_i_5 
       (.I0(res__32[3]),
        .I1(\CN[3]_i_13_n_0 ),
        .O(\CN_reg[3]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[4]),
        .Q(CN[4]),
        .R(1'b0));
  MUXF7 \CN_reg[4]_i_2 
       (.I0(\CN[4]_i_6_n_0 ),
        .I1(\CN[4]_i_7_n_0 ),
        .O(\CN_reg[4]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[4]_i_3 
       (.I0(\CN[4]_i_8_n_0 ),
        .I1(\CN[4]_i_9_n_0 ),
        .O(\CN_reg[4]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[4]_i_4 
       (.I0(\CN[4]_i_10_n_0 ),
        .I1(\CN[4]_i_11_n_0 ),
        .O(\CN_reg[4]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[4]_i_5 
       (.I0(res__32[4]),
        .I1(\CN[4]_i_13_n_0 ),
        .O(\CN_reg[4]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[5]),
        .Q(CN[5]),
        .R(1'b0));
  MUXF7 \CN_reg[5]_i_2 
       (.I0(\CN[5]_i_6_n_0 ),
        .I1(\CN[5]_i_7_n_0 ),
        .O(\CN_reg[5]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[5]_i_3 
       (.I0(\CN[5]_i_8_n_0 ),
        .I1(\CN[5]_i_9_n_0 ),
        .O(\CN_reg[5]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[5]_i_4 
       (.I0(\CN[5]_i_10_n_0 ),
        .I1(\CN[5]_i_11_n_0 ),
        .O(\CN_reg[5]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[5]_i_5 
       (.I0(res__32[5]),
        .I1(\CN[5]_i_13_n_0 ),
        .O(\CN_reg[5]_i_5_n_0 ),
        .S(p_0_in[0]));
  FDRE \CN_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(CN_1[6]),
        .Q(CN[6]),
        .R(1'b0));
  MUXF7 \CN_reg[6]_i_2 
       (.I0(\CN[6]_i_6_n_0 ),
        .I1(\CN[6]_i_7_n_0 ),
        .O(\CN_reg[6]_i_2_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[6]_i_3 
       (.I0(\CN[6]_i_8_n_0 ),
        .I1(\CN[6]_i_9_n_0 ),
        .O(\CN_reg[6]_i_3_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[6]_i_4 
       (.I0(\CN[6]_i_10_n_0 ),
        .I1(\CN[6]_i_11_n_0 ),
        .O(\CN_reg[6]_i_4_n_0 ),
        .S(p_0_in[0]));
  MUXF7 \CN_reg[6]_i_5 
       (.I0(res__32[6]),
        .I1(\CN[6]_i_13_n_0 ),
        .O(\CN_reg[6]_i_5_n_0 ),
        .S(p_0_in[0]));
  LUT4 #(
    .INIT(16'h4000)) 
    \bounceregd[3]_i_1 
       (.I0(step_i_5_n_0),
        .I1(step_i_4_n_0),
        .I2(step_i_3_n_0),
        .I3(step_i_2_n_0),
        .O(eqOp_0));
  FDRE \bounceregd_reg[0] 
       (.C(clk),
        .CE(eqOp_0),
        .D(BTND),
        .Q(bounceregd[0]),
        .R(1'b0));
  FDRE \bounceregd_reg[1] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregd[0]),
        .Q(bounceregd[1]),
        .R(1'b0));
  FDRE \bounceregd_reg[2] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregd[1]),
        .Q(bounceregd[2]),
        .R(1'b0));
  FDRE \bounceregd_reg[3] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregd[2]),
        .Q(bounceregd[3]),
        .R(1'b0));
  FDRE \bounceregr_reg[0] 
       (.C(clk),
        .CE(eqOp_0),
        .D(BTNR),
        .Q(bounceregr[0]),
        .R(1'b0));
  FDRE \bounceregr_reg[1] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregr[0]),
        .Q(bounceregr[1]),
        .R(1'b0));
  FDRE \bounceregr_reg[2] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregr[1]),
        .Q(bounceregr[2]),
        .R(1'b0));
  FDRE \bounceregr_reg[3] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregr[2]),
        .Q(bounceregr[3]),
        .R(1'b0));
  FDRE \bounceregu_reg[0] 
       (.C(clk),
        .CE(eqOp_0),
        .D(BTNU),
        .Q(bounceregu[0]),
        .R(1'b0));
  FDRE \bounceregu_reg[1] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregu[0]),
        .Q(bounceregu[1]),
        .R(1'b0));
  FDRE \bounceregu_reg[2] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregu[1]),
        .Q(bounceregu[2]),
        .R(1'b0));
  FDRE \bounceregu_reg[3] 
       (.C(clk),
        .CE(eqOp_0),
        .D(bounceregu[2]),
        .Q(bounceregu[3]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_2 
       (.I0(\count_reg_n_0_[0] ),
        .O(\count[0]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_7 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\count_reg[0]_i_1_n_0 ,\count_reg[0]_i_1_n_1 ,\count_reg[0]_i_1_n_2 ,\count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\count_reg[0]_i_1_n_4 ,\count_reg[0]_i_1_n_5 ,\count_reg[0]_i_1_n_6 ,\count_reg[0]_i_1_n_7 }),
        .S({\count_reg_n_0_[3] ,\count_reg_n_0_[2] ,\count_reg_n_0_[1] ,\count[0]_i_2_n_0 }));
  FDRE \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(p_0_in[2]),
        .R(1'b0));
  FDRE \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(\count_reg_n_0_[12] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S({\count_reg_n_0_[15] ,\count_reg_n_0_[14] ,\count_reg_n_0_[13] ,\count_reg_n_0_[12] }));
  FDRE \count_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(\count_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \count_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(\count_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \count_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(\count_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \count_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[19]_i_1_n_7 ),
        .Q(LED[0]),
        .R(1'b0));
  FDRE \count_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[19]_i_1_n_6 ),
        .Q(LED[1]),
        .R(1'b0));
  FDRE \count_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[19]_i_1_n_5 ),
        .Q(LED[2]),
        .R(1'b0));
  FDRE \count_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[19]_i_1_n_4 ),
        .Q(LED[3]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[19]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CO({\count_reg[19]_i_1_n_0 ,\count_reg[19]_i_1_n_1 ,\count_reg[19]_i_1_n_2 ,\count_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[19]_i_1_n_4 ,\count_reg[19]_i_1_n_5 ,\count_reg[19]_i_1_n_6 ,\count_reg[19]_i_1_n_7 }),
        .S(LED[3:0]));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_6 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \count_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[23]_i_1_n_7 ),
        .Q(LED[4]),
        .R(1'b0));
  FDRE \count_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[23]_i_1_n_6 ),
        .Q(LED[5]),
        .R(1'b0));
  FDRE \count_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[23]_i_1_n_5 ),
        .Q(LED[6]),
        .R(1'b0));
  FDRE \count_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[23]_i_1_n_4 ),
        .Q(LED[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[23]_i_1 
       (.CI(\count_reg[19]_i_1_n_0 ),
        .CO({\count_reg[23]_i_1_n_0 ,\count_reg[23]_i_1_n_1 ,\count_reg[23]_i_1_n_2 ,\count_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[23]_i_1_n_4 ,\count_reg[23]_i_1_n_5 ,\count_reg[23]_i_1_n_6 ,\count_reg[23]_i_1_n_7 }),
        .S(LED[7:4]));
  FDRE \count_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[27]_i_1_n_7 ),
        .Q(LED[8]),
        .R(1'b0));
  FDRE \count_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[27]_i_1_n_6 ),
        .Q(LED[9]),
        .R(1'b0));
  FDRE \count_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[27]_i_1_n_5 ),
        .Q(LED[10]),
        .R(1'b0));
  FDRE \count_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[27]_i_1_n_4 ),
        .Q(LED[11]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[27]_i_1 
       (.CI(\count_reg[23]_i_1_n_0 ),
        .CO({\count_reg[27]_i_1_n_0 ,\count_reg[27]_i_1_n_1 ,\count_reg[27]_i_1_n_2 ,\count_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[27]_i_1_n_4 ,\count_reg[27]_i_1_n_5 ,\count_reg[27]_i_1_n_6 ,\count_reg[27]_i_1_n_7 }),
        .S(LED[11:8]));
  FDRE \count_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[31]_i_1_n_7 ),
        .Q(LED[12]),
        .R(1'b0));
  FDRE \count_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[31]_i_1_n_6 ),
        .Q(LED[13]),
        .R(1'b0));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_5 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \count_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[31]_i_1_n_5 ),
        .Q(LED[14]),
        .R(1'b0));
  FDRE \count_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[31]_i_1_n_4 ),
        .Q(LED[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[31]_i_1 
       (.CI(\count_reg[27]_i_1_n_0 ),
        .CO({\NLW_count_reg[31]_i_1_CO_UNCONNECTED [3],\count_reg[31]_i_1_n_1 ,\count_reg[31]_i_1_n_2 ,\count_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[31]_i_1_n_4 ,\count_reg[31]_i_1_n_5 ,\count_reg[31]_i_1_n_6 ,\count_reg[31]_i_1_n_7 }),
        .S(LED[15:12]));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_4 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(\count_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_1_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S({\count_reg_n_0_[7] ,\count_reg_n_0_[6] ,\count_reg_n_0_[5] ,\count_reg_n_0_[4] }));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(\count_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(\count_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(\count_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(\count_reg_n_0_[8] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S({p_0_in,\count_reg_n_0_[8] }));
  FDRE \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(p_0_in[0]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0080008000800000)) 
    \cpt[0]_i_1 
       (.I0(step_i_2_n_0),
        .I1(step_i_3_n_0),
        .I2(step_i_4_n_0),
        .I3(step_i_5_n_0),
        .I4(\cpt[0]_i_3_n_0 ),
        .I5(\cpt[0]_i_4_n_0 ),
        .O(cpt));
  LUT4 #(
    .INIT(16'h1000)) 
    \cpt[0]_i_3 
       (.I0(bounceregu[2]),
        .I1(bounceregu[3]),
        .I2(bounceregu[1]),
        .I3(bounceregu[0]),
        .O(\cpt[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \cpt[0]_i_4 
       (.I0(bounceregd[2]),
        .I1(bounceregd[3]),
        .I2(bounceregd[1]),
        .I3(bounceregd[0]),
        .O(\cpt[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \cpt[0]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .O(\cpt[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[0]_i_6 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[3]),
        .O(\cpt[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[0]_i_7 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[2]),
        .O(\cpt[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[0]_i_8 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[1]),
        .O(\cpt[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[0]_i_9 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[0]),
        .O(\cpt[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[12]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[15]),
        .O(\cpt[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[12]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[14]),
        .O(\cpt[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[12]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[13]),
        .O(\cpt[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[12]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[12]),
        .O(\cpt[12]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[16]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[19]),
        .O(\cpt[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[16]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[18]),
        .O(\cpt[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[16]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[17]),
        .O(\cpt[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[16]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[16]),
        .O(\cpt[16]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[20]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[23]),
        .O(\cpt[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[20]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[22]),
        .O(\cpt[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[20]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[21]),
        .O(\cpt[20]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[20]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[20]),
        .O(\cpt[20]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[24]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[27]),
        .O(\cpt[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[24]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[26]),
        .O(\cpt[24]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[24]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[25]),
        .O(\cpt[24]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[24]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[24]),
        .O(\cpt[24]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[28]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[31]),
        .O(\cpt[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[28]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[30]),
        .O(\cpt[28]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[28]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[29]),
        .O(\cpt[28]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[28]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[28]),
        .O(\cpt[28]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[4]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[7]),
        .O(\cpt[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[4]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[6]),
        .O(\cpt[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[4]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[5]),
        .O(\cpt[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[4]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[4]),
        .O(\cpt[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[8]_i_2 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[11]),
        .O(\cpt[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[8]_i_3 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[10]),
        .O(\cpt[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[8]_i_4 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[9]),
        .O(\cpt[8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \cpt[8]_i_5 
       (.I0(bounceregd[0]),
        .I1(bounceregd[1]),
        .I2(bounceregd[3]),
        .I3(bounceregd[2]),
        .I4(cpt_reg[8]),
        .O(\cpt[8]_i_5_n_0 ));
  FDRE \cpt_reg[0] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[0]_i_2_n_7 ),
        .Q(cpt_reg[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cpt_reg[0]_i_2_n_0 ,\cpt_reg[0]_i_2_n_1 ,\cpt_reg[0]_i_2_n_2 ,\cpt_reg[0]_i_2_n_3 }),
        .CYINIT(\cpt[0]_i_5_n_0 ),
        .DI(cpt_reg[3:0]),
        .O({\cpt_reg[0]_i_2_n_4 ,\cpt_reg[0]_i_2_n_5 ,\cpt_reg[0]_i_2_n_6 ,\cpt_reg[0]_i_2_n_7 }),
        .S({\cpt[0]_i_6_n_0 ,\cpt[0]_i_7_n_0 ,\cpt[0]_i_8_n_0 ,\cpt[0]_i_9_n_0 }));
  FDRE \cpt_reg[10] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[8]_i_1_n_5 ),
        .Q(cpt_reg[10]),
        .R(1'b0));
  FDRE \cpt_reg[11] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[8]_i_1_n_4 ),
        .Q(cpt_reg[11]),
        .R(1'b0));
  FDRE \cpt_reg[12] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[12]_i_1_n_7 ),
        .Q(cpt_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[12]_i_1 
       (.CI(\cpt_reg[8]_i_1_n_0 ),
        .CO({\cpt_reg[12]_i_1_n_0 ,\cpt_reg[12]_i_1_n_1 ,\cpt_reg[12]_i_1_n_2 ,\cpt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[15:12]),
        .O({\cpt_reg[12]_i_1_n_4 ,\cpt_reg[12]_i_1_n_5 ,\cpt_reg[12]_i_1_n_6 ,\cpt_reg[12]_i_1_n_7 }),
        .S({\cpt[12]_i_2_n_0 ,\cpt[12]_i_3_n_0 ,\cpt[12]_i_4_n_0 ,\cpt[12]_i_5_n_0 }));
  FDRE \cpt_reg[13] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[12]_i_1_n_6 ),
        .Q(cpt_reg[13]),
        .R(1'b0));
  FDRE \cpt_reg[14] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[12]_i_1_n_5 ),
        .Q(cpt_reg[14]),
        .R(1'b0));
  FDRE \cpt_reg[15] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[12]_i_1_n_4 ),
        .Q(cpt_reg[15]),
        .R(1'b0));
  FDRE \cpt_reg[16] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[16]_i_1_n_7 ),
        .Q(cpt_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[16]_i_1 
       (.CI(\cpt_reg[12]_i_1_n_0 ),
        .CO({\cpt_reg[16]_i_1_n_0 ,\cpt_reg[16]_i_1_n_1 ,\cpt_reg[16]_i_1_n_2 ,\cpt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[19:16]),
        .O({\cpt_reg[16]_i_1_n_4 ,\cpt_reg[16]_i_1_n_5 ,\cpt_reg[16]_i_1_n_6 ,\cpt_reg[16]_i_1_n_7 }),
        .S({\cpt[16]_i_2_n_0 ,\cpt[16]_i_3_n_0 ,\cpt[16]_i_4_n_0 ,\cpt[16]_i_5_n_0 }));
  FDRE \cpt_reg[17] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[16]_i_1_n_6 ),
        .Q(cpt_reg[17]),
        .R(1'b0));
  FDRE \cpt_reg[18] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[16]_i_1_n_5 ),
        .Q(cpt_reg[18]),
        .R(1'b0));
  FDRE \cpt_reg[19] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[16]_i_1_n_4 ),
        .Q(cpt_reg[19]),
        .R(1'b0));
  FDRE \cpt_reg[1] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[0]_i_2_n_6 ),
        .Q(cpt_reg[1]),
        .R(1'b0));
  FDRE \cpt_reg[20] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[20]_i_1_n_7 ),
        .Q(cpt_reg[20]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[20]_i_1 
       (.CI(\cpt_reg[16]_i_1_n_0 ),
        .CO({\cpt_reg[20]_i_1_n_0 ,\cpt_reg[20]_i_1_n_1 ,\cpt_reg[20]_i_1_n_2 ,\cpt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[23:20]),
        .O({\cpt_reg[20]_i_1_n_4 ,\cpt_reg[20]_i_1_n_5 ,\cpt_reg[20]_i_1_n_6 ,\cpt_reg[20]_i_1_n_7 }),
        .S({\cpt[20]_i_2_n_0 ,\cpt[20]_i_3_n_0 ,\cpt[20]_i_4_n_0 ,\cpt[20]_i_5_n_0 }));
  FDRE \cpt_reg[21] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[20]_i_1_n_6 ),
        .Q(cpt_reg[21]),
        .R(1'b0));
  FDRE \cpt_reg[22] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[20]_i_1_n_5 ),
        .Q(cpt_reg[22]),
        .R(1'b0));
  FDRE \cpt_reg[23] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[20]_i_1_n_4 ),
        .Q(cpt_reg[23]),
        .R(1'b0));
  FDRE \cpt_reg[24] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[24]_i_1_n_7 ),
        .Q(cpt_reg[24]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[24]_i_1 
       (.CI(\cpt_reg[20]_i_1_n_0 ),
        .CO({\cpt_reg[24]_i_1_n_0 ,\cpt_reg[24]_i_1_n_1 ,\cpt_reg[24]_i_1_n_2 ,\cpt_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[27:24]),
        .O({\cpt_reg[24]_i_1_n_4 ,\cpt_reg[24]_i_1_n_5 ,\cpt_reg[24]_i_1_n_6 ,\cpt_reg[24]_i_1_n_7 }),
        .S({\cpt[24]_i_2_n_0 ,\cpt[24]_i_3_n_0 ,\cpt[24]_i_4_n_0 ,\cpt[24]_i_5_n_0 }));
  FDRE \cpt_reg[25] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[24]_i_1_n_6 ),
        .Q(cpt_reg[25]),
        .R(1'b0));
  FDRE \cpt_reg[26] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[24]_i_1_n_5 ),
        .Q(cpt_reg[26]),
        .R(1'b0));
  FDRE \cpt_reg[27] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[24]_i_1_n_4 ),
        .Q(cpt_reg[27]),
        .R(1'b0));
  FDRE \cpt_reg[28] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[28]_i_1_n_7 ),
        .Q(cpt_reg[28]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[28]_i_1 
       (.CI(\cpt_reg[24]_i_1_n_0 ),
        .CO({\NLW_cpt_reg[28]_i_1_CO_UNCONNECTED [3],\cpt_reg[28]_i_1_n_1 ,\cpt_reg[28]_i_1_n_2 ,\cpt_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,cpt_reg[30:28]}),
        .O({\cpt_reg[28]_i_1_n_4 ,\cpt_reg[28]_i_1_n_5 ,\cpt_reg[28]_i_1_n_6 ,\cpt_reg[28]_i_1_n_7 }),
        .S({\cpt[28]_i_2_n_0 ,\cpt[28]_i_3_n_0 ,\cpt[28]_i_4_n_0 ,\cpt[28]_i_5_n_0 }));
  FDRE \cpt_reg[29] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[28]_i_1_n_6 ),
        .Q(cpt_reg[29]),
        .R(1'b0));
  FDRE \cpt_reg[2] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[0]_i_2_n_5 ),
        .Q(cpt_reg[2]),
        .R(1'b0));
  FDRE \cpt_reg[30] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[28]_i_1_n_5 ),
        .Q(cpt_reg[30]),
        .R(1'b0));
  FDRE \cpt_reg[31] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[28]_i_1_n_4 ),
        .Q(cpt_reg[31]),
        .R(1'b0));
  FDRE \cpt_reg[3] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[0]_i_2_n_4 ),
        .Q(cpt_reg[3]),
        .R(1'b0));
  FDRE \cpt_reg[4] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[4]_i_1_n_7 ),
        .Q(cpt_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[4]_i_1 
       (.CI(\cpt_reg[0]_i_2_n_0 ),
        .CO({\cpt_reg[4]_i_1_n_0 ,\cpt_reg[4]_i_1_n_1 ,\cpt_reg[4]_i_1_n_2 ,\cpt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[7:4]),
        .O({\cpt_reg[4]_i_1_n_4 ,\cpt_reg[4]_i_1_n_5 ,\cpt_reg[4]_i_1_n_6 ,\cpt_reg[4]_i_1_n_7 }),
        .S({\cpt[4]_i_2_n_0 ,\cpt[4]_i_3_n_0 ,\cpt[4]_i_4_n_0 ,\cpt[4]_i_5_n_0 }));
  FDRE \cpt_reg[5] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[4]_i_1_n_6 ),
        .Q(cpt_reg[5]),
        .R(1'b0));
  FDRE \cpt_reg[6] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[4]_i_1_n_5 ),
        .Q(cpt_reg[6]),
        .R(1'b0));
  FDRE \cpt_reg[7] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[4]_i_1_n_4 ),
        .Q(cpt_reg[7]),
        .R(1'b0));
  FDRE \cpt_reg[8] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[8]_i_1_n_7 ),
        .Q(cpt_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cpt_reg[8]_i_1 
       (.CI(\cpt_reg[4]_i_1_n_0 ),
        .CO({\cpt_reg[8]_i_1_n_0 ,\cpt_reg[8]_i_1_n_1 ,\cpt_reg[8]_i_1_n_2 ,\cpt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(cpt_reg[11:8]),
        .O({\cpt_reg[8]_i_1_n_4 ,\cpt_reg[8]_i_1_n_5 ,\cpt_reg[8]_i_1_n_6 ,\cpt_reg[8]_i_1_n_7 }),
        .S({\cpt[8]_i_2_n_0 ,\cpt[8]_i_3_n_0 ,\cpt[8]_i_4_n_0 ,\cpt[8]_i_5_n_0 }));
  FDRE \cpt_reg[9] 
       (.C(clk),
        .CE(cpt),
        .D(\cpt_reg[8]_i_1_n_6 ),
        .Q(cpt_reg[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[0]_i_1 
       (.I0(\data[0]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[0]),
        .I4(SW[0]),
        .I5(r[0]),
        .O(data[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[0]_i_2 
       (.I0(b[0]),
        .I1(a[0]),
        .I2(SW[1]),
        .I3(ir[0]),
        .I4(SW[0]),
        .I5(pc[0]),
        .O(\data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[10]_i_1 
       (.I0(\data[10]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[10]),
        .I4(SW[0]),
        .I5(r[10]),
        .O(data[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[10]_i_2 
       (.I0(b[10]),
        .I1(a[10]),
        .I2(SW[1]),
        .I3(ir[10]),
        .I4(SW[0]),
        .I5(pc[10]),
        .O(\data[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[11]_i_1 
       (.I0(\data[11]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[11]),
        .I4(SW[0]),
        .I5(r[11]),
        .O(data[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[11]_i_2 
       (.I0(b[11]),
        .I1(a[11]),
        .I2(SW[1]),
        .I3(ir[11]),
        .I4(SW[0]),
        .I5(pc[11]),
        .O(\data[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[12]_i_1 
       (.I0(\data[12]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[12]),
        .I4(SW[0]),
        .I5(r[12]),
        .O(data[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[12]_i_2 
       (.I0(b[12]),
        .I1(a[12]),
        .I2(SW[1]),
        .I3(ir[12]),
        .I4(SW[0]),
        .I5(pc[12]),
        .O(\data[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[13]_i_1 
       (.I0(\data[13]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[13]),
        .I4(SW[0]),
        .I5(r[13]),
        .O(data[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[13]_i_2 
       (.I0(b[13]),
        .I1(a[13]),
        .I2(SW[1]),
        .I3(ir[13]),
        .I4(SW[0]),
        .I5(pc[13]),
        .O(\data[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[14]_i_1 
       (.I0(\data[14]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[14]),
        .I4(SW[0]),
        .I5(r[14]),
        .O(data[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[14]_i_2 
       (.I0(b[14]),
        .I1(a[14]),
        .I2(SW[1]),
        .I3(ir[14]),
        .I4(SW[0]),
        .I5(pc[14]),
        .O(\data[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[15]_i_1 
       (.I0(\data[15]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[15]),
        .I4(SW[0]),
        .I5(r[15]),
        .O(data[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[15]_i_2 
       (.I0(b[15]),
        .I1(a[15]),
        .I2(SW[1]),
        .I3(ir[15]),
        .I4(SW[0]),
        .I5(pc[15]),
        .O(\data[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[16]_i_1 
       (.I0(\data[16]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[16]),
        .I4(SW[0]),
        .I5(r[16]),
        .O(data[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[16]_i_2 
       (.I0(b[16]),
        .I1(a[16]),
        .I2(SW[1]),
        .I3(ir[16]),
        .I4(SW[0]),
        .I5(pc[16]),
        .O(\data[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[17]_i_1 
       (.I0(\data[17]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[17]),
        .I4(SW[0]),
        .I5(r[17]),
        .O(data[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[17]_i_2 
       (.I0(b[17]),
        .I1(a[17]),
        .I2(SW[1]),
        .I3(ir[17]),
        .I4(SW[0]),
        .I5(pc[17]),
        .O(\data[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[18]_i_1 
       (.I0(\data[18]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[18]),
        .I4(SW[0]),
        .I5(r[18]),
        .O(data[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[18]_i_2 
       (.I0(b[18]),
        .I1(a[18]),
        .I2(SW[1]),
        .I3(ir[18]),
        .I4(SW[0]),
        .I5(pc[18]),
        .O(\data[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[19]_i_1 
       (.I0(\data[19]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[19]),
        .I4(SW[0]),
        .I5(r[19]),
        .O(data[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[19]_i_2 
       (.I0(b[19]),
        .I1(a[19]),
        .I2(SW[1]),
        .I3(ir[19]),
        .I4(SW[0]),
        .I5(pc[19]),
        .O(\data[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[1]_i_1 
       (.I0(\data[1]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[1]),
        .I4(SW[0]),
        .I5(r[1]),
        .O(data[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[1]_i_2 
       (.I0(b[1]),
        .I1(a[1]),
        .I2(SW[1]),
        .I3(ir[1]),
        .I4(SW[0]),
        .I5(pc[1]),
        .O(\data[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[20]_i_1 
       (.I0(\data[20]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[20]),
        .I4(SW[0]),
        .I5(r[20]),
        .O(data[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[20]_i_2 
       (.I0(b[20]),
        .I1(a[20]),
        .I2(SW[1]),
        .I3(ir[20]),
        .I4(SW[0]),
        .I5(pc[20]),
        .O(\data[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[21]_i_1 
       (.I0(\data[21]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[21]),
        .I4(SW[0]),
        .I5(r[21]),
        .O(data[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[21]_i_2 
       (.I0(b[21]),
        .I1(a[21]),
        .I2(SW[1]),
        .I3(ir[21]),
        .I4(SW[0]),
        .I5(pc[21]),
        .O(\data[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[22]_i_1 
       (.I0(\data[22]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[22]),
        .I4(SW[0]),
        .I5(r[22]),
        .O(data[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[22]_i_2 
       (.I0(b[22]),
        .I1(a[22]),
        .I2(SW[1]),
        .I3(ir[22]),
        .I4(SW[0]),
        .I5(pc[22]),
        .O(\data[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[23]_i_1 
       (.I0(\data[23]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[23]),
        .I4(SW[0]),
        .I5(r[23]),
        .O(data[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[23]_i_2 
       (.I0(b[23]),
        .I1(a[23]),
        .I2(SW[1]),
        .I3(ir[23]),
        .I4(SW[0]),
        .I5(pc[23]),
        .O(\data[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[24]_i_1 
       (.I0(\data[24]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[24]),
        .I4(SW[0]),
        .I5(r[24]),
        .O(data[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[24]_i_2 
       (.I0(b[24]),
        .I1(a[24]),
        .I2(SW[1]),
        .I3(ir[24]),
        .I4(SW[0]),
        .I5(pc[24]),
        .O(\data[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[25]_i_1 
       (.I0(\data[25]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[25]),
        .I4(SW[0]),
        .I5(r[25]),
        .O(data[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[25]_i_2 
       (.I0(b[25]),
        .I1(a[25]),
        .I2(SW[1]),
        .I3(ir[25]),
        .I4(SW[0]),
        .I5(pc[25]),
        .O(\data[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[26]_i_1 
       (.I0(\data[26]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[26]),
        .I4(SW[0]),
        .I5(r[26]),
        .O(data[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[26]_i_2 
       (.I0(b[26]),
        .I1(a[26]),
        .I2(SW[1]),
        .I3(ir[26]),
        .I4(SW[0]),
        .I5(pc[26]),
        .O(\data[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[27]_i_1 
       (.I0(\data[27]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[27]),
        .I4(SW[0]),
        .I5(r[27]),
        .O(data[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[27]_i_2 
       (.I0(b[27]),
        .I1(a[27]),
        .I2(SW[1]),
        .I3(ir[27]),
        .I4(SW[0]),
        .I5(pc[27]),
        .O(\data[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[28]_i_1 
       (.I0(\data[28]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[28]),
        .I4(SW[0]),
        .I5(r[28]),
        .O(data[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[28]_i_2 
       (.I0(b[28]),
        .I1(a[28]),
        .I2(SW[1]),
        .I3(ir[28]),
        .I4(SW[0]),
        .I5(pc[28]),
        .O(\data[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[29]_i_1 
       (.I0(\data[29]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[29]),
        .I4(SW[0]),
        .I5(r[29]),
        .O(data[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[29]_i_2 
       (.I0(b[29]),
        .I1(a[29]),
        .I2(SW[1]),
        .I3(ir[29]),
        .I4(SW[0]),
        .I5(pc[29]),
        .O(\data[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[2]_i_1 
       (.I0(\data[2]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[2]),
        .I4(SW[0]),
        .I5(r[2]),
        .O(data[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[2]_i_2 
       (.I0(b[2]),
        .I1(a[2]),
        .I2(SW[1]),
        .I3(ir[2]),
        .I4(SW[0]),
        .I5(pc[2]),
        .O(\data[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[30]_i_1 
       (.I0(\data[30]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[30]),
        .I4(SW[0]),
        .I5(r[30]),
        .O(data[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[30]_i_2 
       (.I0(b[30]),
        .I1(a[30]),
        .I2(SW[1]),
        .I3(ir[30]),
        .I4(SW[0]),
        .I5(pc[30]),
        .O(\data[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[31]_i_1 
       (.I0(\data[31]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[31]),
        .I4(SW[0]),
        .I5(r[31]),
        .O(data[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[31]_i_2 
       (.I0(b[31]),
        .I1(a[31]),
        .I2(SW[1]),
        .I3(ir[31]),
        .I4(SW[0]),
        .I5(pc[31]),
        .O(\data[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[3]_i_1 
       (.I0(\data[3]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[3]),
        .I4(SW[0]),
        .I5(r[3]),
        .O(data[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[3]_i_2 
       (.I0(b[3]),
        .I1(a[3]),
        .I2(SW[1]),
        .I3(ir[3]),
        .I4(SW[0]),
        .I5(pc[3]),
        .O(\data[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[4]_i_1 
       (.I0(\data[4]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[4]),
        .I4(SW[0]),
        .I5(r[4]),
        .O(data[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[4]_i_2 
       (.I0(b[4]),
        .I1(a[4]),
        .I2(SW[1]),
        .I3(ir[4]),
        .I4(SW[0]),
        .I5(pc[4]),
        .O(\data[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[5]_i_1 
       (.I0(\data[5]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[5]),
        .I4(SW[0]),
        .I5(r[5]),
        .O(data[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[5]_i_2 
       (.I0(b[5]),
        .I1(a[5]),
        .I2(SW[1]),
        .I3(ir[5]),
        .I4(SW[0]),
        .I5(pc[5]),
        .O(\data[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[6]_i_1 
       (.I0(\data[6]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[6]),
        .I4(SW[0]),
        .I5(r[6]),
        .O(data[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[6]_i_2 
       (.I0(b[6]),
        .I1(a[6]),
        .I2(SW[1]),
        .I3(ir[6]),
        .I4(SW[0]),
        .I5(pc[6]),
        .O(\data[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[7]_i_1 
       (.I0(\data[7]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[7]),
        .I4(SW[0]),
        .I5(r[7]),
        .O(data[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[7]_i_2 
       (.I0(b[7]),
        .I1(a[7]),
        .I2(SW[1]),
        .I3(ir[7]),
        .I4(SW[0]),
        .I5(pc[7]),
        .O(\data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[8]_i_1 
       (.I0(\data[8]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[8]),
        .I4(SW[0]),
        .I5(r[8]),
        .O(data[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[8]_i_2 
       (.I0(b[8]),
        .I1(a[8]),
        .I2(SW[1]),
        .I3(ir[8]),
        .I4(SW[0]),
        .I5(pc[8]),
        .O(\data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFA0AFA3AFA0ACA0A)) 
    \data[9]_i_1 
       (.I0(\data[9]_i_2_n_0 ),
        .I1(SW[1]),
        .I2(SW[2]),
        .I3(cpt_reg[9]),
        .I4(SW[0]),
        .I5(r[9]),
        .O(data[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \data[9]_i_2 
       (.I0(b[9]),
        .I1(a[9]),
        .I2(SW[1]),
        .I3(ir[9]),
        .I4(SW[0]),
        .I5(pc[9]),
        .O(\data[9]_i_2_n_0 ));
  FDRE \data_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(data[0]),
        .Q(\data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \data_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(data[10]),
        .Q(\data_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \data_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(data[11]),
        .Q(\data_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \data_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(data[12]),
        .Q(\data_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \data_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(data[13]),
        .Q(\data_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \data_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(data[14]),
        .Q(\data_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \data_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(data[15]),
        .Q(\data_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \data_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(data[16]),
        .Q(\data_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \data_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(data[17]),
        .Q(\data_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \data_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(data[18]),
        .Q(\data_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \data_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(data[19]),
        .Q(\data_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \data_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(data[1]),
        .Q(\data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \data_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(data[20]),
        .Q(\data_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \data_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(data[21]),
        .Q(\data_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \data_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(data[22]),
        .Q(\data_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \data_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(data[23]),
        .Q(\data_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \data_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(data[24]),
        .Q(\data_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \data_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(data[25]),
        .Q(\data_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \data_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(data[26]),
        .Q(\data_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \data_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(data[27]),
        .Q(\data_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \data_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(data[28]),
        .Q(\data_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \data_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(data[29]),
        .Q(\data_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \data_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(data[2]),
        .Q(\data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \data_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(data[30]),
        .Q(\data_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \data_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(data[31]),
        .Q(\data_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \data_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(data[3]),
        .Q(\data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \data_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(data[4]),
        .Q(sel0[0]),
        .R(1'b0));
  FDRE \data_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(data[5]),
        .Q(sel0[1]),
        .R(1'b0));
  FDRE \data_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(data[6]),
        .Q(sel0[2]),
        .R(1'b0));
  FDRE \data_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(data[7]),
        .Q(sel0[3]),
        .R(1'b0));
  FDRE \data_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(data[8]),
        .Q(\data_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \data_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(data[9]),
        .Q(\data_reg_n_0_[9] ),
        .R(1'b0));
  FDRE debug_reg
       (.C(clk),
        .CE(1'b1),
        .D(SW[3]),
        .Q(debug),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00800000)) 
    step_i_1
       (.I0(step_i_2_n_0),
        .I1(step_i_3_n_0),
        .I2(step_i_4_n_0),
        .I3(step_i_5_n_0),
        .I4(eqOp),
        .O(step_i_1_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    step_i_2
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(step_i_2_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    step_i_3
       (.I0(\count_reg_n_0_[7] ),
        .I1(\count_reg_n_0_[6] ),
        .I2(\count_reg_n_0_[5] ),
        .I3(\count_reg_n_0_[4] ),
        .O(step_i_3_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    step_i_4
       (.I0(\count_reg_n_0_[14] ),
        .I1(\count_reg_n_0_[15] ),
        .I2(\count_reg_n_0_[13] ),
        .I3(\count_reg_n_0_[12] ),
        .O(step_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    step_i_5
       (.I0(p_0_in[0]),
        .I1(\count_reg_n_0_[8] ),
        .I2(p_0_in[2]),
        .I3(p_0_in[1]),
        .O(step_i_5_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    step_i_6
       (.I0(bounceregr[2]),
        .I1(bounceregr[3]),
        .I2(bounceregr[1]),
        .I3(bounceregr[0]),
        .O(eqOp));
  FDRE step_reg
       (.C(clk),
        .CE(1'b1),
        .D(step_i_1_n_0),
        .Q(step),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
