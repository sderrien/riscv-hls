----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2022 12:30:03 PM
-- Design Name: 
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debug_if is
    Port ( 
    
    clk : in STD_LOGIC;
    BTNC : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR (15 downto 0);
    CN : out STD_LOGIC_VECTOR (7 downto 0);
    AN : out STD_LOGIC_VECTOR (7 downto 0);
    LED : out STD_LOGIC_VECTOR (15 downto 0);
    
    debug : out STD_LOGIC;
    step : out STD_LOGIC;
    pc : in STD_LOGIC_VECTOR (31 downto 0);
    ir : in STD_LOGIC_VECTOR (31 downto 0);
    a : in STD_LOGIC_VECTOR (31 downto 0);
    b : in STD_LOGIC_VECTOR (31 downto 0);
    r : in STD_LOGIC_VECTOR (31 downto 0)
    
  
    
    );
end debug_if;

architecture RTL of debug_if is

signal count : std_logic_vector(31 downto 0);

signal data,cpt : std_logic_vector(31 downto 0);

signal bounceregu : std_logic_vector(3 downto 0);
signal bounceregr : std_logic_vector(3 downto 0);
signal bounceregd : std_logic_vector(3 downto 0);
signal zero,one : std_logic;

subtype t_hex is STD_LOGIC_VECTOR(3 downto 0);
subtype t_sseg is STD_LOGIC_VECTOR(7 downto 0);

function hexto7seg(hex : t_hex) return t_sseg is
 variable res : std_logic_vector(7 downto 0);
begin
    case hex is
    when "0000" => res := "11000000"; -- "0"     
    when "0001" => res := "11111001" ; --"01001111"; -- "1" 
    when "0010" => res := "10100100" ;-- "00010010"; -- "2" 
    when "0011" => res := "10110000"; -- "3" 
    when "0100" => res := "10011001" ;--"01001100"; -- "4" 
    when "0101" => res := "10010010";--"00100100"; -- "5" 
    when "0110" => res := "10000010";--"00100000"; -- "6" 
    when "0111" => res := "11111000";--"00001111"; -- "7" 
    when "1000" => res := "10000000";--"00000000"; -- "8"     
    when "1001" => res := "10010000";--"00000100"; -- "9" 
    when "1010" => res := "10001000";-- "00000010"; -- a
    when "1011" => res := "11111100";--"01100000"; -- b
    when "1100" => res := "11000110";-- "00110001"; -- C

    when "1101" => res := "10100001" ;--"01000010"; -- d
    when "1110" => res := "10000110" ;--"0110000"; -- E
    when "1111" => res := "10001110" ;--"0111000"; -- F
    end case;
    return res;
end function;

begin

    
         
    process(clk)
    begin
        if rising_edge(clk) then
            debug <= sw(15);
            data <= pc;
            
            case sw(2 downto 0) is
                when "001" => data <= ir;
                when "010" => data <= a;
                when "011" => data <= b;
                when "100" => data <= r;
                when "101" => data <= cpt;
                when others => data <= pc;
            end case;     
            
            step<='0';
            
            if (count(15 downto 0)=x"0000") then
                bounceregr <= bounceregr(2 downto 0) & BTNR;
                if (bounceregr="0011") then
                    step<='1';
                end if; 
                bounceregu <= bounceregu(2 downto 0) & BTNU;
                if (bounceregu="0011") then
                    cpt<=cpt+1;
                end if; 
                bounceregd <= bounceregd(2 downto 0) & BTND;
                if (bounceregd="0011") then
                    cpt<=cpt-1;
                end if; 
            end if;
                 
           case count(11 downto 9) is
              when "000" => 
                cn <= hexto7seg(data(3 downto 0));
                an  <= "11111110";
               when "001" => 
                cn <= hexto7seg(data(7 downto 4));
                an  <= "11111101";
              when "010" => 
                cn <= hexto7seg(data(11 downto 8));
                an  <= "11111011";
              when "011" => 
                cn <= hexto7seg(data(15 downto 12));
                an  <= "11110111";
              when "100" => 
                cn <= hexto7seg(data(19 downto 16));
                an  <= "11101111";
              when "101" => 
                cn <= hexto7seg(data(23 downto 20));
                an  <= "11011111";
              when "110" => 
                cn <= hexto7seg(data(27 downto 24));
                an  <= "10111111";
              when "111" => 
                cn <= hexto7seg(data(31 downto 28));
                an  <= "01111111";
            end case;
            count <= count + 1 ;
    if BTNC='1' then
       led <= pc(15 downto 0);
    else
       led <= count(31 downto 16);
    end if;
        end if;
    end process;
    
   
 
end RTL;
