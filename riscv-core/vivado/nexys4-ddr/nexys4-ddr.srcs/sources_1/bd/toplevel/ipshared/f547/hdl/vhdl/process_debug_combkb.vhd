-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity process_debug_combkb_ram is 
    generic(
            MEM_TYPE    : string := "block"; 
            DWIDTH     : integer := 8; 
            AWIDTH     : integer := 14; 
            MEM_SIZE    : integer := 16384
    ); 
    port (
          addr0     : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          d0        : in std_logic_vector(DWIDTH-1 downto 0); 
          we0       : in std_logic; 
          q0        : out std_logic_vector(DWIDTH-1 downto 0);
          clk        : in std_logic 
    ); 
end entity; 


architecture rtl of process_debug_combkb_ram is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
shared variable ram : mem_array := (
    0 => "00010011", 1 => "10010111", 2 => "10010011", 3 => "01110011", 
    4 => "11101111", 5 => "01110011", 6 => "00010011", 7 => "00110011", 
    8 => "01101111", 9 => "01110011", 10 => "01101111", 11 => "00010011", 
    12 => "00100011", 13 => "00010011", 14 => "00100011", 15 => "01101111", 
    16 => "00010011", 17 => "10000011", 18 => "10110011", 19 => "00000011", 
    20 => "10000011", 21 => "00100011", 22 => "10000011", 23 => "10010011", 
    24 => "00100011", 25 => "00000011", 26 => "10010011", 27 => "11100011", 
    28 => "01101111", 29 to 60=> "00000000", 61 => "01001000", 62 => "01101111", 
    63 => "01110010", 64 => "01100110", 65 => "00100000", 66 => "01000011", 
    67 => "01001000", 68 => "00001010", 69 to 16383=> "00000000" );

attribute syn_ramstyle : string; 
attribute syn_ramstyle of ram : variable is "block_ram";
attribute ram_style : string;
attribute ram_style of ram : variable is MEM_TYPE;

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_memory_access_0: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= ram(CONV_INTEGER(addr0_tmp));
            if (we0 = '1') then 
                ram(CONV_INTEGER(addr0_tmp)) := d0; 
            end if;
        end if;
    end if;
end process;


end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity process_debug_combkb is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 16384;
        AddressWidth : INTEGER := 14);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of process_debug_combkb is
    component process_debug_combkb_ram is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            we0 : IN STD_LOGIC;
            d0 : IN STD_LOGIC_VECTOR;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_debug_combkb_ram_U :  component process_debug_combkb_ram
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        we0 => we0,
        d0 => d0,
        q0 => q0);

end architecture;


