----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:22:24 05/21/2021 
-- Design Name: 
-- Module Name:    AluDecoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AluDecoder is
    Port ( funct : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           alucontrol : out  STD_LOGIC_VECTOR (2 downto 0));
end AluDecoder;

architecture Behavioral of AluDecoder is

begin
process (funct,aluop) 

begin
if(aluop="00") then
alucontrol<="010";
elsif(aluop="01") then
alucontrol<="110";
else
case funct is
when "100000"=> alucontrol <="010";
when "100010"=> alucontrol <="110";
when "100100"=> alucontrol <="000";
when "100101"=> alucontrol <="001";
when "101010"=> alucontrol <="111";
when others => alucontrol <="XXX";
end case;
end if;
end process;
end Behavioral;

