-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:debug_if:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY toplevel_debug_if_0_2 IS
  PORT (
    clk : IN STD_LOGIC;
    BTNC : IN STD_LOGIC;
    BTNU : IN STD_LOGIC;
    BTND : IN STD_LOGIC;
    BTNR : IN STD_LOGIC;
    SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    LED : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    debug : OUT STD_LOGIC;
    step : OUT STD_LOGIC;
    pc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ir : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    r : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END toplevel_debug_if_0_2;

ARCHITECTURE toplevel_debug_if_0_2_arch OF toplevel_debug_if_0_2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF toplevel_debug_if_0_2_arch: ARCHITECTURE IS "yes";
  COMPONENT debug_if IS
    PORT (
      clk : IN STD_LOGIC;
      BTNC : IN STD_LOGIC;
      BTNU : IN STD_LOGIC;
      BTND : IN STD_LOGIC;
      BTNR : IN STD_LOGIC;
      SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      AN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      LED : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      debug : OUT STD_LOGIC;
      step : OUT STD_LOGIC;
      pc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ir : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      r : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT debug_if;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF toplevel_debug_if_0_2_arch: ARCHITECTURE IS "debug_if,Vivado 2020.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF toplevel_debug_if_0_2_arch : ARCHITECTURE IS "toplevel_debug_if_0_2,debug_if,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF toplevel_debug_if_0_2_arch: ARCHITECTURE IS "toplevel_debug_if_0_2,debug_if,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=debug_if,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF toplevel_debug_if_0_2_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN toplevel_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : debug_if
    PORT MAP (
      clk => clk,
      BTNC => BTNC,
      BTNU => BTNU,
      BTND => BTND,
      BTNR => BTNR,
      SW => SW,
      CN => CN,
      AN => AN,
      LED => LED,
      debug => debug,
      step => step,
      pc => pc,
      ir => ir,
      a => a,
      b => b,
      r => r
    );
END toplevel_debug_if_0_2_arch;
