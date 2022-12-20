-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Dec 16 14:37:40 2022
-- Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sderrien/riscv-hls/riscv-core/vivado/nexys4-ddr/nexys4-ddr.srcs/sources_1/bd/toplevel/ip/toplevel_debug_if_0_2/toplevel_debug_if_0_2_stub.vhdl
-- Design      : toplevel_debug_if_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel_debug_if_0_2 is
  Port ( 
    clk : in STD_LOGIC;
    BTNC : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    debug : out STD_LOGIC;
    step : out STD_LOGIC;
    pc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ir : in STD_LOGIC_VECTOR ( 31 downto 0 );
    a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    b : in STD_LOGIC_VECTOR ( 31 downto 0 );
    r : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end toplevel_debug_if_0_2;

architecture stub of toplevel_debug_if_0_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,BTNC,BTNU,BTND,BTNR,SW[15:0],CN[7:0],AN[7:0],LED[15:0],debug,step,pc[31:0],ir[31:0],a[31:0],b[31:0],r[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "debug_if,Vivado 2020.1";
begin
end;
