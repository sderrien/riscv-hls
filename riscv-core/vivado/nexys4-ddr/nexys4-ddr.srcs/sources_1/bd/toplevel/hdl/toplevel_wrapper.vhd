--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
--Date        : Sat Dec 17 03:01:13 2022
--Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
--Command     : generate_target toplevel_wrapper.bd
--Design      : toplevel_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity toplevel_wrapper is
  port (
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    BTNC : in STD_LOGIC;
    BTND : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    CN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end toplevel_wrapper;

architecture STRUCTURE of toplevel_wrapper is
  component toplevel is
  port (
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BTNC : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    clk : in STD_LOGIC;
    CN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reset : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
  end component toplevel;
begin
toplevel_i: component toplevel
     port map (
      AN(7 downto 0) => AN(7 downto 0),
      BTNC => BTNC,
      BTND => BTND,
      BTNR => BTNR,
      BTNU => BTNU,
      CN(7 downto 0) => CN(7 downto 0),
      LED(15 downto 0) => LED(15 downto 0),
      SW(15 downto 0) => SW(15 downto 0),
      clk => clk,
      reset => reset,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
end STRUCTURE;
