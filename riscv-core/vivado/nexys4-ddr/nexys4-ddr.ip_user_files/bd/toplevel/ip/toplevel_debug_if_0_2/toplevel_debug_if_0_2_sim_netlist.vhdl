-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Dec 16 14:37:40 2022
-- Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/sderrien/riscv-hls/riscv-core/vivado/nexys4-ddr/nexys4-ddr.srcs/sources_1/bd/toplevel/ip/toplevel_debug_if_0_2/toplevel_debug_if_0_2_sim_netlist.vhdl
-- Design      : toplevel_debug_if_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity toplevel_debug_if_0_2_debug_if is
  port (
    CN : out STD_LOGIC_VECTOR ( 6 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    debug : out STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    step : out STD_LOGIC;
    clk : in STD_LOGIC;
    BTND : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BTNR : in STD_LOGIC;
    r : in STD_LOGIC_VECTOR ( 31 downto 0 );
    b : in STD_LOGIC_VECTOR ( 31 downto 0 );
    a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ir : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pc : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of toplevel_debug_if_0_2_debug_if : entity is "debug_if";
end toplevel_debug_if_0_2_debug_if;

architecture STRUCTURE of toplevel_debug_if_0_2_debug_if is
  signal \AN[0]_i_1_n_0\ : STD_LOGIC;
  signal \AN[1]_i_1_n_0\ : STD_LOGIC;
  signal \AN[2]_i_1_n_0\ : STD_LOGIC;
  signal \AN[3]_i_1_n_0\ : STD_LOGIC;
  signal \AN[4]_i_1_n_0\ : STD_LOGIC;
  signal \AN[5]_i_1_n_0\ : STD_LOGIC;
  signal \AN[6]_i_1_n_0\ : STD_LOGIC;
  signal \AN[7]_i_1_n_0\ : STD_LOGIC;
  signal \CN[0]_i_10_n_0\ : STD_LOGIC;
  signal \CN[0]_i_11_n_0\ : STD_LOGIC;
  signal \CN[0]_i_13_n_0\ : STD_LOGIC;
  signal \CN[0]_i_6_n_0\ : STD_LOGIC;
  signal \CN[0]_i_7_n_0\ : STD_LOGIC;
  signal \CN[0]_i_8_n_0\ : STD_LOGIC;
  signal \CN[0]_i_9_n_0\ : STD_LOGIC;
  signal \CN[1]_i_10_n_0\ : STD_LOGIC;
  signal \CN[1]_i_11_n_0\ : STD_LOGIC;
  signal \CN[1]_i_13_n_0\ : STD_LOGIC;
  signal \CN[1]_i_6_n_0\ : STD_LOGIC;
  signal \CN[1]_i_7_n_0\ : STD_LOGIC;
  signal \CN[1]_i_8_n_0\ : STD_LOGIC;
  signal \CN[1]_i_9_n_0\ : STD_LOGIC;
  signal \CN[2]_i_10_n_0\ : STD_LOGIC;
  signal \CN[2]_i_11_n_0\ : STD_LOGIC;
  signal \CN[2]_i_13_n_0\ : STD_LOGIC;
  signal \CN[2]_i_6_n_0\ : STD_LOGIC;
  signal \CN[2]_i_7_n_0\ : STD_LOGIC;
  signal \CN[2]_i_8_n_0\ : STD_LOGIC;
  signal \CN[2]_i_9_n_0\ : STD_LOGIC;
  signal \CN[3]_i_10_n_0\ : STD_LOGIC;
  signal \CN[3]_i_11_n_0\ : STD_LOGIC;
  signal \CN[3]_i_13_n_0\ : STD_LOGIC;
  signal \CN[3]_i_6_n_0\ : STD_LOGIC;
  signal \CN[3]_i_7_n_0\ : STD_LOGIC;
  signal \CN[3]_i_8_n_0\ : STD_LOGIC;
  signal \CN[3]_i_9_n_0\ : STD_LOGIC;
  signal \CN[4]_i_10_n_0\ : STD_LOGIC;
  signal \CN[4]_i_11_n_0\ : STD_LOGIC;
  signal \CN[4]_i_13_n_0\ : STD_LOGIC;
  signal \CN[4]_i_6_n_0\ : STD_LOGIC;
  signal \CN[4]_i_7_n_0\ : STD_LOGIC;
  signal \CN[4]_i_8_n_0\ : STD_LOGIC;
  signal \CN[4]_i_9_n_0\ : STD_LOGIC;
  signal \CN[5]_i_10_n_0\ : STD_LOGIC;
  signal \CN[5]_i_11_n_0\ : STD_LOGIC;
  signal \CN[5]_i_13_n_0\ : STD_LOGIC;
  signal \CN[5]_i_6_n_0\ : STD_LOGIC;
  signal \CN[5]_i_7_n_0\ : STD_LOGIC;
  signal \CN[5]_i_8_n_0\ : STD_LOGIC;
  signal \CN[5]_i_9_n_0\ : STD_LOGIC;
  signal \CN[6]_i_10_n_0\ : STD_LOGIC;
  signal \CN[6]_i_11_n_0\ : STD_LOGIC;
  signal \CN[6]_i_13_n_0\ : STD_LOGIC;
  signal \CN[6]_i_6_n_0\ : STD_LOGIC;
  signal \CN[6]_i_7_n_0\ : STD_LOGIC;
  signal \CN[6]_i_8_n_0\ : STD_LOGIC;
  signal \CN[6]_i_9_n_0\ : STD_LOGIC;
  signal CN_1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \CN_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[2]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[5]_i_5_n_0\ : STD_LOGIC;
  signal \CN_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \CN_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \CN_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \CN_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal \^led\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal bounceregd : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal bounceregr : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal bounceregu : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_reg_n_0_[15]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_reg_n_0_[8]\ : STD_LOGIC;
  signal cpt : STD_LOGIC;
  signal \cpt[0]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_6_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_7_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_8_n_0\ : STD_LOGIC;
  signal \cpt[0]_i_9_n_0\ : STD_LOGIC;
  signal \cpt[12]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[12]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[12]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[12]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[16]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[16]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[16]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[16]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[20]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[20]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[20]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[20]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[24]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[24]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[24]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[24]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[28]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[28]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[28]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[28]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[4]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[4]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[4]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[4]_i_5_n_0\ : STD_LOGIC;
  signal \cpt[8]_i_2_n_0\ : STD_LOGIC;
  signal \cpt[8]_i_3_n_0\ : STD_LOGIC;
  signal \cpt[8]_i_4_n_0\ : STD_LOGIC;
  signal \cpt[8]_i_5_n_0\ : STD_LOGIC;
  signal cpt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cpt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \cpt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \cpt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \data[0]_i_2_n_0\ : STD_LOGIC;
  signal \data[10]_i_2_n_0\ : STD_LOGIC;
  signal \data[11]_i_2_n_0\ : STD_LOGIC;
  signal \data[12]_i_2_n_0\ : STD_LOGIC;
  signal \data[13]_i_2_n_0\ : STD_LOGIC;
  signal \data[14]_i_2_n_0\ : STD_LOGIC;
  signal \data[15]_i_2_n_0\ : STD_LOGIC;
  signal \data[16]_i_2_n_0\ : STD_LOGIC;
  signal \data[17]_i_2_n_0\ : STD_LOGIC;
  signal \data[18]_i_2_n_0\ : STD_LOGIC;
  signal \data[19]_i_2_n_0\ : STD_LOGIC;
  signal \data[1]_i_2_n_0\ : STD_LOGIC;
  signal \data[20]_i_2_n_0\ : STD_LOGIC;
  signal \data[21]_i_2_n_0\ : STD_LOGIC;
  signal \data[22]_i_2_n_0\ : STD_LOGIC;
  signal \data[23]_i_2_n_0\ : STD_LOGIC;
  signal \data[24]_i_2_n_0\ : STD_LOGIC;
  signal \data[25]_i_2_n_0\ : STD_LOGIC;
  signal \data[26]_i_2_n_0\ : STD_LOGIC;
  signal \data[27]_i_2_n_0\ : STD_LOGIC;
  signal \data[28]_i_2_n_0\ : STD_LOGIC;
  signal \data[29]_i_2_n_0\ : STD_LOGIC;
  signal \data[2]_i_2_n_0\ : STD_LOGIC;
  signal \data[30]_i_2_n_0\ : STD_LOGIC;
  signal \data[31]_i_2_n_0\ : STD_LOGIC;
  signal \data[3]_i_2_n_0\ : STD_LOGIC;
  signal \data[4]_i_2_n_0\ : STD_LOGIC;
  signal \data[5]_i_2_n_0\ : STD_LOGIC;
  signal \data[6]_i_2_n_0\ : STD_LOGIC;
  signal \data[7]_i_2_n_0\ : STD_LOGIC;
  signal \data[8]_i_2_n_0\ : STD_LOGIC;
  signal \data[9]_i_2_n_0\ : STD_LOGIC;
  signal \data_reg_n_0_[0]\ : STD_LOGIC;
  signal \data_reg_n_0_[10]\ : STD_LOGIC;
  signal \data_reg_n_0_[11]\ : STD_LOGIC;
  signal \data_reg_n_0_[12]\ : STD_LOGIC;
  signal \data_reg_n_0_[13]\ : STD_LOGIC;
  signal \data_reg_n_0_[14]\ : STD_LOGIC;
  signal \data_reg_n_0_[15]\ : STD_LOGIC;
  signal \data_reg_n_0_[16]\ : STD_LOGIC;
  signal \data_reg_n_0_[17]\ : STD_LOGIC;
  signal \data_reg_n_0_[18]\ : STD_LOGIC;
  signal \data_reg_n_0_[19]\ : STD_LOGIC;
  signal \data_reg_n_0_[1]\ : STD_LOGIC;
  signal \data_reg_n_0_[20]\ : STD_LOGIC;
  signal \data_reg_n_0_[21]\ : STD_LOGIC;
  signal \data_reg_n_0_[22]\ : STD_LOGIC;
  signal \data_reg_n_0_[23]\ : STD_LOGIC;
  signal \data_reg_n_0_[24]\ : STD_LOGIC;
  signal \data_reg_n_0_[25]\ : STD_LOGIC;
  signal \data_reg_n_0_[26]\ : STD_LOGIC;
  signal \data_reg_n_0_[27]\ : STD_LOGIC;
  signal \data_reg_n_0_[28]\ : STD_LOGIC;
  signal \data_reg_n_0_[29]\ : STD_LOGIC;
  signal \data_reg_n_0_[2]\ : STD_LOGIC;
  signal \data_reg_n_0_[30]\ : STD_LOGIC;
  signal \data_reg_n_0_[31]\ : STD_LOGIC;
  signal \data_reg_n_0_[3]\ : STD_LOGIC;
  signal \data_reg_n_0_[8]\ : STD_LOGIC;
  signal \data_reg_n_0_[9]\ : STD_LOGIC;
  signal eqOp : STD_LOGIC;
  signal eqOp_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \res__32\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal step_i_1_n_0 : STD_LOGIC;
  signal step_i_2_n_0 : STD_LOGIC;
  signal step_i_3_n_0 : STD_LOGIC;
  signal step_i_4_n_0 : STD_LOGIC;
  signal step_i_5_n_0 : STD_LOGIC;
  signal \NLW_count_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cpt_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \AN[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \AN[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \AN[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \AN[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \AN[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \AN[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \AN[7]_i_1\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[19]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[23]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[27]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[31]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cpt_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of step_i_5 : label is "soft_lutpair0";
begin
  LED(15 downto 0) <= \^led\(15 downto 0);
\AN[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      O => \AN[0]_i_1_n_0\
    );
\AN[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(0),
      O => \AN[1]_i_1_n_0\
    );
\AN[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      O => \AN[2]_i_1_n_0\
    );
\AN[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      O => \AN[3]_i_1_n_0\
    );
\AN[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      O => \AN[4]_i_1_n_0\
    );
\AN[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      O => \AN[5]_i_1_n_0\
    );
\AN[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(2),
      I2 => p_0_in(0),
      O => \AN[6]_i_1_n_0\
    );
\AN[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      O => \AN[7]_i_1_n_0\
    );
\AN_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => \AN[0]_i_1_n_0\,
      Q => AN(0),
      S => p_0_in(1)
    );
\AN_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => \AN[1]_i_1_n_0\,
      Q => AN(1),
      S => p_0_in(1)
    );
\AN_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \AN[2]_i_1_n_0\,
      Q => AN(2),
      R => '0'
    );
\AN_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \AN[3]_i_1_n_0\,
      Q => AN(3),
      R => '0'
    );
\AN_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => \AN[4]_i_1_n_0\,
      Q => AN(4),
      S => p_0_in(1)
    );
\AN_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => \AN[5]_i_1_n_0\,
      Q => AN(5),
      S => p_0_in(1)
    );
\AN_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \AN[6]_i_1_n_0\,
      Q => AN(6),
      R => '0'
    );
\AN_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \AN[7]_i_1_n_0\,
      Q => AN(7),
      R => '0'
    );
\CN[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[0]_i_2_n_0\,
      I1 => \CN_reg[0]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[0]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[0]_i_5_n_0\,
      O => CN_1(0)
    );
\CN[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[10]\,
      I2 => \data_reg_n_0_[8]\,
      I3 => \data_reg_n_0_[9]\,
      O => \CN[0]_i_10_n_0\
    );
\CN[0]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[14]\,
      I2 => \data_reg_n_0_[12]\,
      I3 => \data_reg_n_0_[13]\,
      O => \CN[0]_i_11_n_0\
    );
\CN[0]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[2]\,
      I2 => \data_reg_n_0_[0]\,
      I3 => \data_reg_n_0_[1]\,
      O => \res__32\(0)
    );
\CN[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      O => \CN[0]_i_13_n_0\
    );
\CN[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[26]\,
      I2 => \data_reg_n_0_[24]\,
      I3 => \data_reg_n_0_[25]\,
      O => \CN[0]_i_6_n_0\
    );
\CN[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[30]\,
      I2 => \data_reg_n_0_[28]\,
      I3 => \data_reg_n_0_[29]\,
      O => \CN[0]_i_7_n_0\
    );
\CN[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[18]\,
      I2 => \data_reg_n_0_[16]\,
      I3 => \data_reg_n_0_[17]\,
      O => \CN[0]_i_8_n_0\
    );
\CN[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0094"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[22]\,
      I2 => \data_reg_n_0_[20]\,
      I3 => \data_reg_n_0_[21]\,
      O => \CN[0]_i_9_n_0\
    );
\CN[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[1]_i_2_n_0\,
      I1 => \CN_reg[1]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[1]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[1]_i_5_n_0\,
      O => CN_1(1)
    );
\CN[1]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[10]\,
      I2 => \data_reg_n_0_[9]\,
      I3 => \data_reg_n_0_[8]\,
      O => \CN[1]_i_10_n_0\
    );
\CN[1]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[14]\,
      I2 => \data_reg_n_0_[13]\,
      I3 => \data_reg_n_0_[12]\,
      O => \CN[1]_i_11_n_0\
    );
\CN[1]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[2]\,
      I2 => \data_reg_n_0_[1]\,
      I3 => \data_reg_n_0_[0]\,
      O => \res__32\(1)
    );
\CN[1]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => sel0(0),
      O => \CN[1]_i_13_n_0\
    );
\CN[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[26]\,
      I2 => \data_reg_n_0_[25]\,
      I3 => \data_reg_n_0_[24]\,
      O => \CN[1]_i_6_n_0\
    );
\CN[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[30]\,
      I2 => \data_reg_n_0_[29]\,
      I3 => \data_reg_n_0_[28]\,
      O => \CN[1]_i_7_n_0\
    );
\CN[1]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[18]\,
      I2 => \data_reg_n_0_[17]\,
      I3 => \data_reg_n_0_[16]\,
      O => \CN[1]_i_8_n_0\
    );
\CN[1]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"84C8"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[22]\,
      I2 => \data_reg_n_0_[21]\,
      I3 => \data_reg_n_0_[20]\,
      O => \CN[1]_i_9_n_0\
    );
\CN[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[2]_i_2_n_0\,
      I1 => \CN_reg[2]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[2]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[2]_i_5_n_0\,
      O => CN_1(2)
    );
\CN[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[8]\,
      I2 => \data_reg_n_0_[9]\,
      I3 => \data_reg_n_0_[10]\,
      O => \CN[2]_i_10_n_0\
    );
\CN[2]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[12]\,
      I2 => \data_reg_n_0_[13]\,
      I3 => \data_reg_n_0_[14]\,
      O => \CN[2]_i_11_n_0\
    );
\CN[2]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[0]\,
      I2 => \data_reg_n_0_[1]\,
      I3 => \data_reg_n_0_[2]\,
      O => \res__32\(2)
    );
\CN[2]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(0),
      I2 => sel0(1),
      I3 => sel0(2),
      O => \CN[2]_i_13_n_0\
    );
\CN[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[24]\,
      I2 => \data_reg_n_0_[25]\,
      I3 => \data_reg_n_0_[26]\,
      O => \CN[2]_i_6_n_0\
    );
\CN[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[28]\,
      I2 => \data_reg_n_0_[29]\,
      I3 => \data_reg_n_0_[30]\,
      O => \CN[2]_i_7_n_0\
    );
\CN[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[16]\,
      I2 => \data_reg_n_0_[17]\,
      I3 => \data_reg_n_0_[18]\,
      O => \CN[2]_i_8_n_0\
    );
\CN[2]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A290"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[20]\,
      I2 => \data_reg_n_0_[21]\,
      I3 => \data_reg_n_0_[22]\,
      O => \CN[2]_i_9_n_0\
    );
\CN[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[3]_i_2_n_0\,
      I1 => \CN_reg[3]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[3]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[3]_i_5_n_0\,
      O => CN_1(3)
    );
\CN[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[10]\,
      I2 => \data_reg_n_0_[8]\,
      I3 => \data_reg_n_0_[9]\,
      O => \CN[3]_i_10_n_0\
    );
\CN[3]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[14]\,
      I2 => \data_reg_n_0_[12]\,
      I3 => \data_reg_n_0_[13]\,
      O => \CN[3]_i_11_n_0\
    );
\CN[3]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[2]\,
      I2 => \data_reg_n_0_[0]\,
      I3 => \data_reg_n_0_[1]\,
      O => \res__32\(3)
    );
\CN[3]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      O => \CN[3]_i_13_n_0\
    );
\CN[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[26]\,
      I2 => \data_reg_n_0_[24]\,
      I3 => \data_reg_n_0_[25]\,
      O => \CN[3]_i_6_n_0\
    );
\CN[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[30]\,
      I2 => \data_reg_n_0_[28]\,
      I3 => \data_reg_n_0_[29]\,
      O => \CN[3]_i_7_n_0\
    );
\CN[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[18]\,
      I2 => \data_reg_n_0_[16]\,
      I3 => \data_reg_n_0_[17]\,
      O => \CN[3]_i_8_n_0\
    );
\CN[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E214"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[22]\,
      I2 => \data_reg_n_0_[20]\,
      I3 => \data_reg_n_0_[21]\,
      O => \CN[3]_i_9_n_0\
    );
\CN[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[4]_i_2_n_0\,
      I1 => \CN_reg[4]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[4]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[4]_i_5_n_0\,
      O => CN_1(4)
    );
\CN[4]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[9]\,
      I2 => \data_reg_n_0_[10]\,
      I3 => \data_reg_n_0_[8]\,
      O => \CN[4]_i_10_n_0\
    );
\CN[4]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[13]\,
      I2 => \data_reg_n_0_[14]\,
      I3 => \data_reg_n_0_[12]\,
      O => \CN[4]_i_11_n_0\
    );
\CN[4]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[1]\,
      I2 => \data_reg_n_0_[2]\,
      I3 => \data_reg_n_0_[0]\,
      O => \res__32\(4)
    );
\CN[4]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(1),
      I2 => sel0(2),
      I3 => sel0(0),
      O => \CN[4]_i_13_n_0\
    );
\CN[4]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[25]\,
      I2 => \data_reg_n_0_[26]\,
      I3 => \data_reg_n_0_[24]\,
      O => \CN[4]_i_6_n_0\
    );
\CN[4]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[29]\,
      I2 => \data_reg_n_0_[30]\,
      I3 => \data_reg_n_0_[28]\,
      O => \CN[4]_i_7_n_0\
    );
\CN[4]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[17]\,
      I2 => \data_reg_n_0_[18]\,
      I3 => \data_reg_n_0_[16]\,
      O => \CN[4]_i_8_n_0\
    );
\CN[4]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F10"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[21]\,
      I2 => \data_reg_n_0_[22]\,
      I3 => \data_reg_n_0_[20]\,
      O => \CN[4]_i_9_n_0\
    );
\CN[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[5]_i_2_n_0\,
      I1 => \CN_reg[5]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[5]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[5]_i_5_n_0\,
      O => CN_1(5)
    );
\CN[5]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[10]\,
      I2 => \data_reg_n_0_[8]\,
      I3 => \data_reg_n_0_[9]\,
      O => \CN[5]_i_10_n_0\
    );
\CN[5]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[14]\,
      I2 => \data_reg_n_0_[12]\,
      I3 => \data_reg_n_0_[13]\,
      O => \CN[5]_i_11_n_0\
    );
\CN[5]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[2]\,
      I2 => \data_reg_n_0_[0]\,
      I3 => \data_reg_n_0_[1]\,
      O => \res__32\(5)
    );
\CN[5]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      O => \CN[5]_i_13_n_0\
    );
\CN[5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[26]\,
      I2 => \data_reg_n_0_[24]\,
      I3 => \data_reg_n_0_[25]\,
      O => \CN[5]_i_6_n_0\
    );
\CN[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[30]\,
      I2 => \data_reg_n_0_[28]\,
      I3 => \data_reg_n_0_[29]\,
      O => \CN[5]_i_7_n_0\
    );
\CN[5]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[18]\,
      I2 => \data_reg_n_0_[16]\,
      I3 => \data_reg_n_0_[17]\,
      O => \CN[5]_i_8_n_0\
    );
\CN[5]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7190"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[22]\,
      I2 => \data_reg_n_0_[20]\,
      I3 => \data_reg_n_0_[21]\,
      O => \CN[5]_i_9_n_0\
    );
\CN[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \CN_reg[6]_i_2_n_0\,
      I1 => \CN_reg[6]_i_3_n_0\,
      I2 => p_0_in(2),
      I3 => \CN_reg[6]_i_4_n_0\,
      I4 => p_0_in(1),
      I5 => \CN_reg[6]_i_5_n_0\,
      O => CN_1(6)
    );
\CN[6]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[11]\,
      I1 => \data_reg_n_0_[8]\,
      I2 => \data_reg_n_0_[10]\,
      I3 => \data_reg_n_0_[9]\,
      O => \CN[6]_i_10_n_0\
    );
\CN[6]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[15]\,
      I1 => \data_reg_n_0_[12]\,
      I2 => \data_reg_n_0_[14]\,
      I3 => \data_reg_n_0_[13]\,
      O => \CN[6]_i_11_n_0\
    );
\CN[6]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[3]\,
      I1 => \data_reg_n_0_[0]\,
      I2 => \data_reg_n_0_[2]\,
      I3 => \data_reg_n_0_[1]\,
      O => \res__32\(6)
    );
\CN[6]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      O => \CN[6]_i_13_n_0\
    );
\CN[6]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[27]\,
      I1 => \data_reg_n_0_[24]\,
      I2 => \data_reg_n_0_[26]\,
      I3 => \data_reg_n_0_[25]\,
      O => \CN[6]_i_6_n_0\
    );
\CN[6]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[31]\,
      I1 => \data_reg_n_0_[28]\,
      I2 => \data_reg_n_0_[30]\,
      I3 => \data_reg_n_0_[29]\,
      O => \CN[6]_i_7_n_0\
    );
\CN[6]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[19]\,
      I1 => \data_reg_n_0_[16]\,
      I2 => \data_reg_n_0_[18]\,
      I3 => \data_reg_n_0_[17]\,
      O => \CN[6]_i_8_n_0\
    );
\CN[6]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4825"
    )
        port map (
      I0 => \data_reg_n_0_[23]\,
      I1 => \data_reg_n_0_[20]\,
      I2 => \data_reg_n_0_[22]\,
      I3 => \data_reg_n_0_[21]\,
      O => \CN[6]_i_9_n_0\
    );
\CN_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(0),
      Q => CN(0),
      R => '0'
    );
\CN_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[0]_i_6_n_0\,
      I1 => \CN[0]_i_7_n_0\,
      O => \CN_reg[0]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[0]_i_8_n_0\,
      I1 => \CN[0]_i_9_n_0\,
      O => \CN_reg[0]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[0]_i_10_n_0\,
      I1 => \CN[0]_i_11_n_0\,
      O => \CN_reg[0]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[0]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(0),
      I1 => \CN[0]_i_13_n_0\,
      O => \CN_reg[0]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(1),
      Q => CN(1),
      R => '0'
    );
\CN_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[1]_i_6_n_0\,
      I1 => \CN[1]_i_7_n_0\,
      O => \CN_reg[1]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[1]_i_8_n_0\,
      I1 => \CN[1]_i_9_n_0\,
      O => \CN_reg[1]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[1]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[1]_i_10_n_0\,
      I1 => \CN[1]_i_11_n_0\,
      O => \CN_reg[1]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[1]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(1),
      I1 => \CN[1]_i_13_n_0\,
      O => \CN_reg[1]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(2),
      Q => CN(2),
      R => '0'
    );
\CN_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[2]_i_6_n_0\,
      I1 => \CN[2]_i_7_n_0\,
      O => \CN_reg[2]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[2]_i_8_n_0\,
      I1 => \CN[2]_i_9_n_0\,
      O => \CN_reg[2]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[2]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[2]_i_10_n_0\,
      I1 => \CN[2]_i_11_n_0\,
      O => \CN_reg[2]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[2]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(2),
      I1 => \CN[2]_i_13_n_0\,
      O => \CN_reg[2]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(3),
      Q => CN(3),
      R => '0'
    );
\CN_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[3]_i_6_n_0\,
      I1 => \CN[3]_i_7_n_0\,
      O => \CN_reg[3]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[3]_i_8_n_0\,
      I1 => \CN[3]_i_9_n_0\,
      O => \CN_reg[3]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[3]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[3]_i_10_n_0\,
      I1 => \CN[3]_i_11_n_0\,
      O => \CN_reg[3]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[3]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(3),
      I1 => \CN[3]_i_13_n_0\,
      O => \CN_reg[3]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(4),
      Q => CN(4),
      R => '0'
    );
\CN_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[4]_i_6_n_0\,
      I1 => \CN[4]_i_7_n_0\,
      O => \CN_reg[4]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[4]_i_8_n_0\,
      I1 => \CN[4]_i_9_n_0\,
      O => \CN_reg[4]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[4]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[4]_i_10_n_0\,
      I1 => \CN[4]_i_11_n_0\,
      O => \CN_reg[4]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[4]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(4),
      I1 => \CN[4]_i_13_n_0\,
      O => \CN_reg[4]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(5),
      Q => CN(5),
      R => '0'
    );
\CN_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[5]_i_6_n_0\,
      I1 => \CN[5]_i_7_n_0\,
      O => \CN_reg[5]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[5]_i_8_n_0\,
      I1 => \CN[5]_i_9_n_0\,
      O => \CN_reg[5]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[5]_i_10_n_0\,
      I1 => \CN[5]_i_11_n_0\,
      O => \CN_reg[5]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[5]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(5),
      I1 => \CN[5]_i_13_n_0\,
      O => \CN_reg[5]_i_5_n_0\,
      S => p_0_in(0)
    );
\CN_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => CN_1(6),
      Q => CN(6),
      R => '0'
    );
\CN_reg[6]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[6]_i_6_n_0\,
      I1 => \CN[6]_i_7_n_0\,
      O => \CN_reg[6]_i_2_n_0\,
      S => p_0_in(0)
    );
\CN_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[6]_i_8_n_0\,
      I1 => \CN[6]_i_9_n_0\,
      O => \CN_reg[6]_i_3_n_0\,
      S => p_0_in(0)
    );
\CN_reg[6]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \CN[6]_i_10_n_0\,
      I1 => \CN[6]_i_11_n_0\,
      O => \CN_reg[6]_i_4_n_0\,
      S => p_0_in(0)
    );
\CN_reg[6]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \res__32\(6),
      I1 => \CN[6]_i_13_n_0\,
      O => \CN_reg[6]_i_5_n_0\,
      S => p_0_in(0)
    );
\bounceregd[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => step_i_5_n_0,
      I1 => step_i_4_n_0,
      I2 => step_i_3_n_0,
      I3 => step_i_2_n_0,
      O => eqOp_0
    );
\bounceregd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => BTND,
      Q => bounceregd(0),
      R => '0'
    );
\bounceregd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregd(0),
      Q => bounceregd(1),
      R => '0'
    );
\bounceregd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregd(1),
      Q => bounceregd(2),
      R => '0'
    );
\bounceregd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregd(2),
      Q => bounceregd(3),
      R => '0'
    );
\bounceregr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => BTNR,
      Q => bounceregr(0),
      R => '0'
    );
\bounceregr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregr(0),
      Q => bounceregr(1),
      R => '0'
    );
\bounceregr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregr(1),
      Q => bounceregr(2),
      R => '0'
    );
\bounceregr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregr(2),
      Q => bounceregr(3),
      R => '0'
    );
\bounceregu_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => BTNU,
      Q => bounceregu(0),
      R => '0'
    );
\bounceregu_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregu(0),
      Q => bounceregu(1),
      R => '0'
    );
\bounceregu_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregu(1),
      Q => bounceregu(2),
      R => '0'
    );
\bounceregu_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => eqOp_0,
      D => bounceregu(2),
      Q => bounceregu(3),
      R => '0'
    );
\count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[0]_i_1_n_7\,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[0]_i_1_n_0\,
      CO(2) => \count_reg[0]_i_1_n_1\,
      CO(1) => \count_reg[0]_i_1_n_2\,
      CO(0) => \count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_reg[0]_i_1_n_4\,
      O(2) => \count_reg[0]_i_1_n_5\,
      O(1) => \count_reg[0]_i_1_n_6\,
      O(0) => \count_reg[0]_i_1_n_7\,
      S(3) => \count_reg_n_0_[3]\,
      S(2) => \count_reg_n_0_[2]\,
      S(1) => \count_reg_n_0_[1]\,
      S(0) => \count[0]_i_2_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[8]_i_1_n_5\,
      Q => p_0_in(1),
      R => '0'
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[8]_i_1_n_4\,
      Q => p_0_in(2),
      R => '0'
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[12]_i_1_n_7\,
      Q => \count_reg_n_0_[12]\,
      R => '0'
    );
\count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[8]_i_1_n_0\,
      CO(3) => \count_reg[12]_i_1_n_0\,
      CO(2) => \count_reg[12]_i_1_n_1\,
      CO(1) => \count_reg[12]_i_1_n_2\,
      CO(0) => \count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[12]_i_1_n_4\,
      O(2) => \count_reg[12]_i_1_n_5\,
      O(1) => \count_reg[12]_i_1_n_6\,
      O(0) => \count_reg[12]_i_1_n_7\,
      S(3) => \count_reg_n_0_[15]\,
      S(2) => \count_reg_n_0_[14]\,
      S(1) => \count_reg_n_0_[13]\,
      S(0) => \count_reg_n_0_[12]\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[12]_i_1_n_6\,
      Q => \count_reg_n_0_[13]\,
      R => '0'
    );
\count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[12]_i_1_n_5\,
      Q => \count_reg_n_0_[14]\,
      R => '0'
    );
\count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[12]_i_1_n_4\,
      Q => \count_reg_n_0_[15]\,
      R => '0'
    );
\count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[19]_i_1_n_7\,
      Q => \^led\(0),
      R => '0'
    );
\count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[19]_i_1_n_6\,
      Q => \^led\(1),
      R => '0'
    );
\count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[19]_i_1_n_5\,
      Q => \^led\(2),
      R => '0'
    );
\count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[19]_i_1_n_4\,
      Q => \^led\(3),
      R => '0'
    );
\count_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[12]_i_1_n_0\,
      CO(3) => \count_reg[19]_i_1_n_0\,
      CO(2) => \count_reg[19]_i_1_n_1\,
      CO(1) => \count_reg[19]_i_1_n_2\,
      CO(0) => \count_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[19]_i_1_n_4\,
      O(2) => \count_reg[19]_i_1_n_5\,
      O(1) => \count_reg[19]_i_1_n_6\,
      O(0) => \count_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^led\(3 downto 0)
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[0]_i_1_n_6\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[23]_i_1_n_7\,
      Q => \^led\(4),
      R => '0'
    );
\count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[23]_i_1_n_6\,
      Q => \^led\(5),
      R => '0'
    );
\count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[23]_i_1_n_5\,
      Q => \^led\(6),
      R => '0'
    );
\count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[23]_i_1_n_4\,
      Q => \^led\(7),
      R => '0'
    );
\count_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[19]_i_1_n_0\,
      CO(3) => \count_reg[23]_i_1_n_0\,
      CO(2) => \count_reg[23]_i_1_n_1\,
      CO(1) => \count_reg[23]_i_1_n_2\,
      CO(0) => \count_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[23]_i_1_n_4\,
      O(2) => \count_reg[23]_i_1_n_5\,
      O(1) => \count_reg[23]_i_1_n_6\,
      O(0) => \count_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^led\(7 downto 4)
    );
\count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[27]_i_1_n_7\,
      Q => \^led\(8),
      R => '0'
    );
\count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[27]_i_1_n_6\,
      Q => \^led\(9),
      R => '0'
    );
\count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[27]_i_1_n_5\,
      Q => \^led\(10),
      R => '0'
    );
\count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[27]_i_1_n_4\,
      Q => \^led\(11),
      R => '0'
    );
\count_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[23]_i_1_n_0\,
      CO(3) => \count_reg[27]_i_1_n_0\,
      CO(2) => \count_reg[27]_i_1_n_1\,
      CO(1) => \count_reg[27]_i_1_n_2\,
      CO(0) => \count_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[27]_i_1_n_4\,
      O(2) => \count_reg[27]_i_1_n_5\,
      O(1) => \count_reg[27]_i_1_n_6\,
      O(0) => \count_reg[27]_i_1_n_7\,
      S(3 downto 0) => \^led\(11 downto 8)
    );
\count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[31]_i_1_n_7\,
      Q => \^led\(12),
      R => '0'
    );
\count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[31]_i_1_n_6\,
      Q => \^led\(13),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[0]_i_1_n_5\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[31]_i_1_n_5\,
      Q => \^led\(14),
      R => '0'
    );
\count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[31]_i_1_n_4\,
      Q => \^led\(15),
      R => '0'
    );
\count_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[27]_i_1_n_0\,
      CO(3) => \NLW_count_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \count_reg[31]_i_1_n_1\,
      CO(1) => \count_reg[31]_i_1_n_2\,
      CO(0) => \count_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[31]_i_1_n_4\,
      O(2) => \count_reg[31]_i_1_n_5\,
      O(1) => \count_reg[31]_i_1_n_6\,
      O(0) => \count_reg[31]_i_1_n_7\,
      S(3 downto 0) => \^led\(15 downto 12)
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[0]_i_1_n_4\,
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[4]_i_1_n_7\,
      Q => \count_reg_n_0_[4]\,
      R => '0'
    );
\count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[0]_i_1_n_0\,
      CO(3) => \count_reg[4]_i_1_n_0\,
      CO(2) => \count_reg[4]_i_1_n_1\,
      CO(1) => \count_reg[4]_i_1_n_2\,
      CO(0) => \count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[4]_i_1_n_4\,
      O(2) => \count_reg[4]_i_1_n_5\,
      O(1) => \count_reg[4]_i_1_n_6\,
      O(0) => \count_reg[4]_i_1_n_7\,
      S(3) => \count_reg_n_0_[7]\,
      S(2) => \count_reg_n_0_[6]\,
      S(1) => \count_reg_n_0_[5]\,
      S(0) => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[4]_i_1_n_6\,
      Q => \count_reg_n_0_[5]\,
      R => '0'
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[4]_i_1_n_5\,
      Q => \count_reg_n_0_[6]\,
      R => '0'
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[4]_i_1_n_4\,
      Q => \count_reg_n_0_[7]\,
      R => '0'
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[8]_i_1_n_7\,
      Q => \count_reg_n_0_[8]\,
      R => '0'
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[4]_i_1_n_0\,
      CO(3) => \count_reg[8]_i_1_n_0\,
      CO(2) => \count_reg[8]_i_1_n_1\,
      CO(1) => \count_reg[8]_i_1_n_2\,
      CO(0) => \count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[8]_i_1_n_4\,
      O(2) => \count_reg[8]_i_1_n_5\,
      O(1) => \count_reg[8]_i_1_n_6\,
      O(0) => \count_reg[8]_i_1_n_7\,
      S(3 downto 1) => p_0_in(2 downto 0),
      S(0) => \count_reg_n_0_[8]\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count_reg[8]_i_1_n_6\,
      Q => p_0_in(0),
      R => '0'
    );
\cpt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000800000"
    )
        port map (
      I0 => step_i_2_n_0,
      I1 => step_i_3_n_0,
      I2 => step_i_4_n_0,
      I3 => step_i_5_n_0,
      I4 => \cpt[0]_i_3_n_0\,
      I5 => \cpt[0]_i_4_n_0\,
      O => cpt
    );
\cpt[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => bounceregu(2),
      I1 => bounceregu(3),
      I2 => bounceregu(1),
      I3 => bounceregu(0),
      O => \cpt[0]_i_3_n_0\
    );
\cpt[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => bounceregd(2),
      I1 => bounceregd(3),
      I2 => bounceregd(1),
      I3 => bounceregd(0),
      O => \cpt[0]_i_4_n_0\
    );
\cpt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      O => \cpt[0]_i_5_n_0\
    );
\cpt[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(3),
      O => \cpt[0]_i_6_n_0\
    );
\cpt[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(2),
      O => \cpt[0]_i_7_n_0\
    );
\cpt[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(1),
      O => \cpt[0]_i_8_n_0\
    );
\cpt[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(0),
      O => \cpt[0]_i_9_n_0\
    );
\cpt[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(15),
      O => \cpt[12]_i_2_n_0\
    );
\cpt[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(14),
      O => \cpt[12]_i_3_n_0\
    );
\cpt[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(13),
      O => \cpt[12]_i_4_n_0\
    );
\cpt[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(12),
      O => \cpt[12]_i_5_n_0\
    );
\cpt[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(19),
      O => \cpt[16]_i_2_n_0\
    );
\cpt[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(18),
      O => \cpt[16]_i_3_n_0\
    );
\cpt[16]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(17),
      O => \cpt[16]_i_4_n_0\
    );
\cpt[16]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(16),
      O => \cpt[16]_i_5_n_0\
    );
\cpt[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(23),
      O => \cpt[20]_i_2_n_0\
    );
\cpt[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(22),
      O => \cpt[20]_i_3_n_0\
    );
\cpt[20]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(21),
      O => \cpt[20]_i_4_n_0\
    );
\cpt[20]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(20),
      O => \cpt[20]_i_5_n_0\
    );
\cpt[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(27),
      O => \cpt[24]_i_2_n_0\
    );
\cpt[24]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(26),
      O => \cpt[24]_i_3_n_0\
    );
\cpt[24]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(25),
      O => \cpt[24]_i_4_n_0\
    );
\cpt[24]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(24),
      O => \cpt[24]_i_5_n_0\
    );
\cpt[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(31),
      O => \cpt[28]_i_2_n_0\
    );
\cpt[28]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(30),
      O => \cpt[28]_i_3_n_0\
    );
\cpt[28]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(29),
      O => \cpt[28]_i_4_n_0\
    );
\cpt[28]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(28),
      O => \cpt[28]_i_5_n_0\
    );
\cpt[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(7),
      O => \cpt[4]_i_2_n_0\
    );
\cpt[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(6),
      O => \cpt[4]_i_3_n_0\
    );
\cpt[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(5),
      O => \cpt[4]_i_4_n_0\
    );
\cpt[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(4),
      O => \cpt[4]_i_5_n_0\
    );
\cpt[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(11),
      O => \cpt[8]_i_2_n_0\
    );
\cpt[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(10),
      O => \cpt[8]_i_3_n_0\
    );
\cpt[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(9),
      O => \cpt[8]_i_4_n_0\
    );
\cpt[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => bounceregd(0),
      I1 => bounceregd(1),
      I2 => bounceregd(3),
      I3 => bounceregd(2),
      I4 => cpt_reg(8),
      O => \cpt[8]_i_5_n_0\
    );
\cpt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[0]_i_2_n_7\,
      Q => cpt_reg(0),
      R => '0'
    );
\cpt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cpt_reg[0]_i_2_n_0\,
      CO(2) => \cpt_reg[0]_i_2_n_1\,
      CO(1) => \cpt_reg[0]_i_2_n_2\,
      CO(0) => \cpt_reg[0]_i_2_n_3\,
      CYINIT => \cpt[0]_i_5_n_0\,
      DI(3 downto 0) => cpt_reg(3 downto 0),
      O(3) => \cpt_reg[0]_i_2_n_4\,
      O(2) => \cpt_reg[0]_i_2_n_5\,
      O(1) => \cpt_reg[0]_i_2_n_6\,
      O(0) => \cpt_reg[0]_i_2_n_7\,
      S(3) => \cpt[0]_i_6_n_0\,
      S(2) => \cpt[0]_i_7_n_0\,
      S(1) => \cpt[0]_i_8_n_0\,
      S(0) => \cpt[0]_i_9_n_0\
    );
\cpt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[8]_i_1_n_5\,
      Q => cpt_reg(10),
      R => '0'
    );
\cpt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[8]_i_1_n_4\,
      Q => cpt_reg(11),
      R => '0'
    );
\cpt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[12]_i_1_n_7\,
      Q => cpt_reg(12),
      R => '0'
    );
\cpt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[8]_i_1_n_0\,
      CO(3) => \cpt_reg[12]_i_1_n_0\,
      CO(2) => \cpt_reg[12]_i_1_n_1\,
      CO(1) => \cpt_reg[12]_i_1_n_2\,
      CO(0) => \cpt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(15 downto 12),
      O(3) => \cpt_reg[12]_i_1_n_4\,
      O(2) => \cpt_reg[12]_i_1_n_5\,
      O(1) => \cpt_reg[12]_i_1_n_6\,
      O(0) => \cpt_reg[12]_i_1_n_7\,
      S(3) => \cpt[12]_i_2_n_0\,
      S(2) => \cpt[12]_i_3_n_0\,
      S(1) => \cpt[12]_i_4_n_0\,
      S(0) => \cpt[12]_i_5_n_0\
    );
\cpt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[12]_i_1_n_6\,
      Q => cpt_reg(13),
      R => '0'
    );
\cpt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[12]_i_1_n_5\,
      Q => cpt_reg(14),
      R => '0'
    );
\cpt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[12]_i_1_n_4\,
      Q => cpt_reg(15),
      R => '0'
    );
\cpt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[16]_i_1_n_7\,
      Q => cpt_reg(16),
      R => '0'
    );
\cpt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[12]_i_1_n_0\,
      CO(3) => \cpt_reg[16]_i_1_n_0\,
      CO(2) => \cpt_reg[16]_i_1_n_1\,
      CO(1) => \cpt_reg[16]_i_1_n_2\,
      CO(0) => \cpt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(19 downto 16),
      O(3) => \cpt_reg[16]_i_1_n_4\,
      O(2) => \cpt_reg[16]_i_1_n_5\,
      O(1) => \cpt_reg[16]_i_1_n_6\,
      O(0) => \cpt_reg[16]_i_1_n_7\,
      S(3) => \cpt[16]_i_2_n_0\,
      S(2) => \cpt[16]_i_3_n_0\,
      S(1) => \cpt[16]_i_4_n_0\,
      S(0) => \cpt[16]_i_5_n_0\
    );
\cpt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[16]_i_1_n_6\,
      Q => cpt_reg(17),
      R => '0'
    );
\cpt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[16]_i_1_n_5\,
      Q => cpt_reg(18),
      R => '0'
    );
\cpt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[16]_i_1_n_4\,
      Q => cpt_reg(19),
      R => '0'
    );
\cpt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[0]_i_2_n_6\,
      Q => cpt_reg(1),
      R => '0'
    );
\cpt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[20]_i_1_n_7\,
      Q => cpt_reg(20),
      R => '0'
    );
\cpt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[16]_i_1_n_0\,
      CO(3) => \cpt_reg[20]_i_1_n_0\,
      CO(2) => \cpt_reg[20]_i_1_n_1\,
      CO(1) => \cpt_reg[20]_i_1_n_2\,
      CO(0) => \cpt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(23 downto 20),
      O(3) => \cpt_reg[20]_i_1_n_4\,
      O(2) => \cpt_reg[20]_i_1_n_5\,
      O(1) => \cpt_reg[20]_i_1_n_6\,
      O(0) => \cpt_reg[20]_i_1_n_7\,
      S(3) => \cpt[20]_i_2_n_0\,
      S(2) => \cpt[20]_i_3_n_0\,
      S(1) => \cpt[20]_i_4_n_0\,
      S(0) => \cpt[20]_i_5_n_0\
    );
\cpt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[20]_i_1_n_6\,
      Q => cpt_reg(21),
      R => '0'
    );
\cpt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[20]_i_1_n_5\,
      Q => cpt_reg(22),
      R => '0'
    );
\cpt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[20]_i_1_n_4\,
      Q => cpt_reg(23),
      R => '0'
    );
\cpt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[24]_i_1_n_7\,
      Q => cpt_reg(24),
      R => '0'
    );
\cpt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[20]_i_1_n_0\,
      CO(3) => \cpt_reg[24]_i_1_n_0\,
      CO(2) => \cpt_reg[24]_i_1_n_1\,
      CO(1) => \cpt_reg[24]_i_1_n_2\,
      CO(0) => \cpt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(27 downto 24),
      O(3) => \cpt_reg[24]_i_1_n_4\,
      O(2) => \cpt_reg[24]_i_1_n_5\,
      O(1) => \cpt_reg[24]_i_1_n_6\,
      O(0) => \cpt_reg[24]_i_1_n_7\,
      S(3) => \cpt[24]_i_2_n_0\,
      S(2) => \cpt[24]_i_3_n_0\,
      S(1) => \cpt[24]_i_4_n_0\,
      S(0) => \cpt[24]_i_5_n_0\
    );
\cpt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[24]_i_1_n_6\,
      Q => cpt_reg(25),
      R => '0'
    );
\cpt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[24]_i_1_n_5\,
      Q => cpt_reg(26),
      R => '0'
    );
\cpt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[24]_i_1_n_4\,
      Q => cpt_reg(27),
      R => '0'
    );
\cpt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[28]_i_1_n_7\,
      Q => cpt_reg(28),
      R => '0'
    );
\cpt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[24]_i_1_n_0\,
      CO(3) => \NLW_cpt_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \cpt_reg[28]_i_1_n_1\,
      CO(1) => \cpt_reg[28]_i_1_n_2\,
      CO(0) => \cpt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => cpt_reg(30 downto 28),
      O(3) => \cpt_reg[28]_i_1_n_4\,
      O(2) => \cpt_reg[28]_i_1_n_5\,
      O(1) => \cpt_reg[28]_i_1_n_6\,
      O(0) => \cpt_reg[28]_i_1_n_7\,
      S(3) => \cpt[28]_i_2_n_0\,
      S(2) => \cpt[28]_i_3_n_0\,
      S(1) => \cpt[28]_i_4_n_0\,
      S(0) => \cpt[28]_i_5_n_0\
    );
\cpt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[28]_i_1_n_6\,
      Q => cpt_reg(29),
      R => '0'
    );
\cpt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[0]_i_2_n_5\,
      Q => cpt_reg(2),
      R => '0'
    );
\cpt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[28]_i_1_n_5\,
      Q => cpt_reg(30),
      R => '0'
    );
\cpt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[28]_i_1_n_4\,
      Q => cpt_reg(31),
      R => '0'
    );
\cpt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[0]_i_2_n_4\,
      Q => cpt_reg(3),
      R => '0'
    );
\cpt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[4]_i_1_n_7\,
      Q => cpt_reg(4),
      R => '0'
    );
\cpt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[0]_i_2_n_0\,
      CO(3) => \cpt_reg[4]_i_1_n_0\,
      CO(2) => \cpt_reg[4]_i_1_n_1\,
      CO(1) => \cpt_reg[4]_i_1_n_2\,
      CO(0) => \cpt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(7 downto 4),
      O(3) => \cpt_reg[4]_i_1_n_4\,
      O(2) => \cpt_reg[4]_i_1_n_5\,
      O(1) => \cpt_reg[4]_i_1_n_6\,
      O(0) => \cpt_reg[4]_i_1_n_7\,
      S(3) => \cpt[4]_i_2_n_0\,
      S(2) => \cpt[4]_i_3_n_0\,
      S(1) => \cpt[4]_i_4_n_0\,
      S(0) => \cpt[4]_i_5_n_0\
    );
\cpt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[4]_i_1_n_6\,
      Q => cpt_reg(5),
      R => '0'
    );
\cpt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[4]_i_1_n_5\,
      Q => cpt_reg(6),
      R => '0'
    );
\cpt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[4]_i_1_n_4\,
      Q => cpt_reg(7),
      R => '0'
    );
\cpt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[8]_i_1_n_7\,
      Q => cpt_reg(8),
      R => '0'
    );
\cpt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cpt_reg[4]_i_1_n_0\,
      CO(3) => \cpt_reg[8]_i_1_n_0\,
      CO(2) => \cpt_reg[8]_i_1_n_1\,
      CO(1) => \cpt_reg[8]_i_1_n_2\,
      CO(0) => \cpt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cpt_reg(11 downto 8),
      O(3) => \cpt_reg[8]_i_1_n_4\,
      O(2) => \cpt_reg[8]_i_1_n_5\,
      O(1) => \cpt_reg[8]_i_1_n_6\,
      O(0) => \cpt_reg[8]_i_1_n_7\,
      S(3) => \cpt[8]_i_2_n_0\,
      S(2) => \cpt[8]_i_3_n_0\,
      S(1) => \cpt[8]_i_4_n_0\,
      S(0) => \cpt[8]_i_5_n_0\
    );
\cpt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => cpt,
      D => \cpt_reg[8]_i_1_n_6\,
      Q => cpt_reg(9),
      R => '0'
    );
\data[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[0]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(0),
      I4 => SW(0),
      I5 => r(0),
      O => data(0)
    );
\data[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(0),
      I1 => a(0),
      I2 => SW(1),
      I3 => ir(0),
      I4 => SW(0),
      I5 => pc(0),
      O => \data[0]_i_2_n_0\
    );
\data[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[10]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(10),
      I4 => SW(0),
      I5 => r(10),
      O => data(10)
    );
\data[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(10),
      I1 => a(10),
      I2 => SW(1),
      I3 => ir(10),
      I4 => SW(0),
      I5 => pc(10),
      O => \data[10]_i_2_n_0\
    );
\data[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[11]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(11),
      I4 => SW(0),
      I5 => r(11),
      O => data(11)
    );
\data[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(11),
      I1 => a(11),
      I2 => SW(1),
      I3 => ir(11),
      I4 => SW(0),
      I5 => pc(11),
      O => \data[11]_i_2_n_0\
    );
\data[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[12]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(12),
      I4 => SW(0),
      I5 => r(12),
      O => data(12)
    );
\data[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(12),
      I1 => a(12),
      I2 => SW(1),
      I3 => ir(12),
      I4 => SW(0),
      I5 => pc(12),
      O => \data[12]_i_2_n_0\
    );
\data[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[13]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(13),
      I4 => SW(0),
      I5 => r(13),
      O => data(13)
    );
\data[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(13),
      I1 => a(13),
      I2 => SW(1),
      I3 => ir(13),
      I4 => SW(0),
      I5 => pc(13),
      O => \data[13]_i_2_n_0\
    );
\data[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[14]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(14),
      I4 => SW(0),
      I5 => r(14),
      O => data(14)
    );
\data[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(14),
      I1 => a(14),
      I2 => SW(1),
      I3 => ir(14),
      I4 => SW(0),
      I5 => pc(14),
      O => \data[14]_i_2_n_0\
    );
\data[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[15]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(15),
      I4 => SW(0),
      I5 => r(15),
      O => data(15)
    );
\data[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(15),
      I1 => a(15),
      I2 => SW(1),
      I3 => ir(15),
      I4 => SW(0),
      I5 => pc(15),
      O => \data[15]_i_2_n_0\
    );
\data[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[16]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(16),
      I4 => SW(0),
      I5 => r(16),
      O => data(16)
    );
\data[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(16),
      I1 => a(16),
      I2 => SW(1),
      I3 => ir(16),
      I4 => SW(0),
      I5 => pc(16),
      O => \data[16]_i_2_n_0\
    );
\data[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[17]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(17),
      I4 => SW(0),
      I5 => r(17),
      O => data(17)
    );
\data[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(17),
      I1 => a(17),
      I2 => SW(1),
      I3 => ir(17),
      I4 => SW(0),
      I5 => pc(17),
      O => \data[17]_i_2_n_0\
    );
\data[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[18]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(18),
      I4 => SW(0),
      I5 => r(18),
      O => data(18)
    );
\data[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(18),
      I1 => a(18),
      I2 => SW(1),
      I3 => ir(18),
      I4 => SW(0),
      I5 => pc(18),
      O => \data[18]_i_2_n_0\
    );
\data[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[19]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(19),
      I4 => SW(0),
      I5 => r(19),
      O => data(19)
    );
\data[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(19),
      I1 => a(19),
      I2 => SW(1),
      I3 => ir(19),
      I4 => SW(0),
      I5 => pc(19),
      O => \data[19]_i_2_n_0\
    );
\data[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[1]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(1),
      I4 => SW(0),
      I5 => r(1),
      O => data(1)
    );
\data[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(1),
      I1 => a(1),
      I2 => SW(1),
      I3 => ir(1),
      I4 => SW(0),
      I5 => pc(1),
      O => \data[1]_i_2_n_0\
    );
\data[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[20]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(20),
      I4 => SW(0),
      I5 => r(20),
      O => data(20)
    );
\data[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(20),
      I1 => a(20),
      I2 => SW(1),
      I3 => ir(20),
      I4 => SW(0),
      I5 => pc(20),
      O => \data[20]_i_2_n_0\
    );
\data[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[21]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(21),
      I4 => SW(0),
      I5 => r(21),
      O => data(21)
    );
\data[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(21),
      I1 => a(21),
      I2 => SW(1),
      I3 => ir(21),
      I4 => SW(0),
      I5 => pc(21),
      O => \data[21]_i_2_n_0\
    );
\data[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[22]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(22),
      I4 => SW(0),
      I5 => r(22),
      O => data(22)
    );
\data[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(22),
      I1 => a(22),
      I2 => SW(1),
      I3 => ir(22),
      I4 => SW(0),
      I5 => pc(22),
      O => \data[22]_i_2_n_0\
    );
\data[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[23]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(23),
      I4 => SW(0),
      I5 => r(23),
      O => data(23)
    );
\data[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(23),
      I1 => a(23),
      I2 => SW(1),
      I3 => ir(23),
      I4 => SW(0),
      I5 => pc(23),
      O => \data[23]_i_2_n_0\
    );
\data[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[24]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(24),
      I4 => SW(0),
      I5 => r(24),
      O => data(24)
    );
\data[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(24),
      I1 => a(24),
      I2 => SW(1),
      I3 => ir(24),
      I4 => SW(0),
      I5 => pc(24),
      O => \data[24]_i_2_n_0\
    );
\data[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[25]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(25),
      I4 => SW(0),
      I5 => r(25),
      O => data(25)
    );
\data[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(25),
      I1 => a(25),
      I2 => SW(1),
      I3 => ir(25),
      I4 => SW(0),
      I5 => pc(25),
      O => \data[25]_i_2_n_0\
    );
\data[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[26]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(26),
      I4 => SW(0),
      I5 => r(26),
      O => data(26)
    );
\data[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(26),
      I1 => a(26),
      I2 => SW(1),
      I3 => ir(26),
      I4 => SW(0),
      I5 => pc(26),
      O => \data[26]_i_2_n_0\
    );
\data[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[27]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(27),
      I4 => SW(0),
      I5 => r(27),
      O => data(27)
    );
\data[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(27),
      I1 => a(27),
      I2 => SW(1),
      I3 => ir(27),
      I4 => SW(0),
      I5 => pc(27),
      O => \data[27]_i_2_n_0\
    );
\data[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[28]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(28),
      I4 => SW(0),
      I5 => r(28),
      O => data(28)
    );
\data[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(28),
      I1 => a(28),
      I2 => SW(1),
      I3 => ir(28),
      I4 => SW(0),
      I5 => pc(28),
      O => \data[28]_i_2_n_0\
    );
\data[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[29]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(29),
      I4 => SW(0),
      I5 => r(29),
      O => data(29)
    );
\data[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(29),
      I1 => a(29),
      I2 => SW(1),
      I3 => ir(29),
      I4 => SW(0),
      I5 => pc(29),
      O => \data[29]_i_2_n_0\
    );
\data[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[2]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(2),
      I4 => SW(0),
      I5 => r(2),
      O => data(2)
    );
\data[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(2),
      I1 => a(2),
      I2 => SW(1),
      I3 => ir(2),
      I4 => SW(0),
      I5 => pc(2),
      O => \data[2]_i_2_n_0\
    );
\data[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[30]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(30),
      I4 => SW(0),
      I5 => r(30),
      O => data(30)
    );
\data[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(30),
      I1 => a(30),
      I2 => SW(1),
      I3 => ir(30),
      I4 => SW(0),
      I5 => pc(30),
      O => \data[30]_i_2_n_0\
    );
\data[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[31]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(31),
      I4 => SW(0),
      I5 => r(31),
      O => data(31)
    );
\data[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(31),
      I1 => a(31),
      I2 => SW(1),
      I3 => ir(31),
      I4 => SW(0),
      I5 => pc(31),
      O => \data[31]_i_2_n_0\
    );
\data[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[3]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(3),
      I4 => SW(0),
      I5 => r(3),
      O => data(3)
    );
\data[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(3),
      I1 => a(3),
      I2 => SW(1),
      I3 => ir(3),
      I4 => SW(0),
      I5 => pc(3),
      O => \data[3]_i_2_n_0\
    );
\data[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[4]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(4),
      I4 => SW(0),
      I5 => r(4),
      O => data(4)
    );
\data[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(4),
      I1 => a(4),
      I2 => SW(1),
      I3 => ir(4),
      I4 => SW(0),
      I5 => pc(4),
      O => \data[4]_i_2_n_0\
    );
\data[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[5]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(5),
      I4 => SW(0),
      I5 => r(5),
      O => data(5)
    );
\data[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(5),
      I1 => a(5),
      I2 => SW(1),
      I3 => ir(5),
      I4 => SW(0),
      I5 => pc(5),
      O => \data[5]_i_2_n_0\
    );
\data[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[6]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(6),
      I4 => SW(0),
      I5 => r(6),
      O => data(6)
    );
\data[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(6),
      I1 => a(6),
      I2 => SW(1),
      I3 => ir(6),
      I4 => SW(0),
      I5 => pc(6),
      O => \data[6]_i_2_n_0\
    );
\data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[7]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(7),
      I4 => SW(0),
      I5 => r(7),
      O => data(7)
    );
\data[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(7),
      I1 => a(7),
      I2 => SW(1),
      I3 => ir(7),
      I4 => SW(0),
      I5 => pc(7),
      O => \data[7]_i_2_n_0\
    );
\data[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[8]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(8),
      I4 => SW(0),
      I5 => r(8),
      O => data(8)
    );
\data[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(8),
      I1 => a(8),
      I2 => SW(1),
      I3 => ir(8),
      I4 => SW(0),
      I5 => pc(8),
      O => \data[8]_i_2_n_0\
    );
\data[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FA0AFA3AFA0ACA0A"
    )
        port map (
      I0 => \data[9]_i_2_n_0\,
      I1 => SW(1),
      I2 => SW(2),
      I3 => cpt_reg(9),
      I4 => SW(0),
      I5 => r(9),
      O => data(9)
    );
\data[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => b(9),
      I1 => a(9),
      I2 => SW(1),
      I3 => ir(9),
      I4 => SW(0),
      I5 => pc(9),
      O => \data[9]_i_2_n_0\
    );
\data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(0),
      Q => \data_reg_n_0_[0]\,
      R => '0'
    );
\data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(10),
      Q => \data_reg_n_0_[10]\,
      R => '0'
    );
\data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(11),
      Q => \data_reg_n_0_[11]\,
      R => '0'
    );
\data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(12),
      Q => \data_reg_n_0_[12]\,
      R => '0'
    );
\data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(13),
      Q => \data_reg_n_0_[13]\,
      R => '0'
    );
\data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(14),
      Q => \data_reg_n_0_[14]\,
      R => '0'
    );
\data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(15),
      Q => \data_reg_n_0_[15]\,
      R => '0'
    );
\data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(16),
      Q => \data_reg_n_0_[16]\,
      R => '0'
    );
\data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(17),
      Q => \data_reg_n_0_[17]\,
      R => '0'
    );
\data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(18),
      Q => \data_reg_n_0_[18]\,
      R => '0'
    );
\data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(19),
      Q => \data_reg_n_0_[19]\,
      R => '0'
    );
\data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(1),
      Q => \data_reg_n_0_[1]\,
      R => '0'
    );
\data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(20),
      Q => \data_reg_n_0_[20]\,
      R => '0'
    );
\data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(21),
      Q => \data_reg_n_0_[21]\,
      R => '0'
    );
\data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(22),
      Q => \data_reg_n_0_[22]\,
      R => '0'
    );
\data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(23),
      Q => \data_reg_n_0_[23]\,
      R => '0'
    );
\data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(24),
      Q => \data_reg_n_0_[24]\,
      R => '0'
    );
\data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(25),
      Q => \data_reg_n_0_[25]\,
      R => '0'
    );
\data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(26),
      Q => \data_reg_n_0_[26]\,
      R => '0'
    );
\data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(27),
      Q => \data_reg_n_0_[27]\,
      R => '0'
    );
\data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(28),
      Q => \data_reg_n_0_[28]\,
      R => '0'
    );
\data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(29),
      Q => \data_reg_n_0_[29]\,
      R => '0'
    );
\data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(2),
      Q => \data_reg_n_0_[2]\,
      R => '0'
    );
\data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(30),
      Q => \data_reg_n_0_[30]\,
      R => '0'
    );
\data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(31),
      Q => \data_reg_n_0_[31]\,
      R => '0'
    );
\data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(3),
      Q => \data_reg_n_0_[3]\,
      R => '0'
    );
\data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(4),
      Q => sel0(0),
      R => '0'
    );
\data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(5),
      Q => sel0(1),
      R => '0'
    );
\data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(6),
      Q => sel0(2),
      R => '0'
    );
\data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(7),
      Q => sel0(3),
      R => '0'
    );
\data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(8),
      Q => \data_reg_n_0_[8]\,
      R => '0'
    );
\data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data(9),
      Q => \data_reg_n_0_[9]\,
      R => '0'
    );
debug_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => SW(3),
      Q => debug,
      R => '0'
    );
step_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => step_i_2_n_0,
      I1 => step_i_3_n_0,
      I2 => step_i_4_n_0,
      I3 => step_i_5_n_0,
      I4 => eqOp,
      O => step_i_1_n_0
    );
step_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      O => step_i_2_n_0
    );
step_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[7]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count_reg_n_0_[5]\,
      I3 => \count_reg_n_0_[4]\,
      O => step_i_3_n_0
    );
step_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[14]\,
      I1 => \count_reg_n_0_[15]\,
      I2 => \count_reg_n_0_[13]\,
      I3 => \count_reg_n_0_[12]\,
      O => step_i_4_n_0
    );
step_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in(0),
      I1 => \count_reg_n_0_[8]\,
      I2 => p_0_in(2),
      I3 => p_0_in(1),
      O => step_i_5_n_0
    );
step_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => bounceregr(2),
      I1 => bounceregr(3),
      I2 => bounceregr(1),
      I3 => bounceregr(0),
      O => eqOp
    );
step_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => step_i_1_n_0,
      Q => step,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity toplevel_debug_if_0_2 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of toplevel_debug_if_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of toplevel_debug_if_0_2 : entity is "toplevel_debug_if_0_2,debug_if,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of toplevel_debug_if_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of toplevel_debug_if_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of toplevel_debug_if_0_2 : entity is "debug_if,Vivado 2020.1";
end toplevel_debug_if_0_2;

architecture STRUCTURE of toplevel_debug_if_0_2 is
  signal \<const1>\ : STD_LOGIC;
  signal \^cn\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN toplevel_clk, INSERT_VIP 0";
begin
  CN(7) <= \<const1>\;
  CN(6 downto 0) <= \^cn\(6 downto 0);
U0: entity work.toplevel_debug_if_0_2_debug_if
     port map (
      AN(7 downto 0) => AN(7 downto 0),
      BTND => BTND,
      BTNR => BTNR,
      BTNU => BTNU,
      CN(6 downto 0) => \^cn\(6 downto 0),
      LED(15 downto 0) => LED(15 downto 0),
      SW(3) => SW(15),
      SW(2 downto 0) => SW(2 downto 0),
      a(31 downto 0) => a(31 downto 0),
      b(31 downto 0) => b(31 downto 0),
      clk => clk,
      debug => debug,
      ir(31 downto 0) => ir(31 downto 0),
      pc(31 downto 0) => pc(31 downto 0),
      r(31 downto 0) => r(31 downto 0),
      step => step
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
