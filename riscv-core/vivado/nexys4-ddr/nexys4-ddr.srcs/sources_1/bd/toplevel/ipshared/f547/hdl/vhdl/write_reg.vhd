-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity write_reg is
port (
    ap_start : IN STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    x_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    x_ce0 : OUT STD_LOGIC;
    x_we0 : OUT STD_LOGIC;
    x_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    rd : IN STD_LOGIC_VECTOR (4 downto 0);
    value_r : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of write_reg is 
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

    signal zext_ln152_fu_46_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln151_fu_40_p2 : STD_LOGIC_VECTOR (0 downto 0);


begin



    ap_ready <= ap_start;
    icmp_ln151_fu_40_p2 <= "1" when (rd = ap_const_lv5_0) else "0";
    x_address0 <= zext_ln152_fu_46_p1(5 - 1 downto 0);

    x_ce0_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_1)) then 
            x_ce0 <= ap_const_logic_1;
        else 
            x_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    x_d0 <= value_r;

    x_we0_assign_proc : process(ap_start, icmp_ln151_fu_40_p2)
    begin
        if (((ap_start = ap_const_logic_1) and (icmp_ln151_fu_40_p2 = ap_const_lv1_0))) then 
            x_we0 <= ap_const_logic_1;
        else 
            x_we0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln152_fu_46_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rd),64));
end behav;
