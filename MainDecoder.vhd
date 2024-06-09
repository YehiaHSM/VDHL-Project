----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:43 05/19/2021 
-- Design Name: 
-- Module Name:    MainDecoder - Behavioral 
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

entity MainDecoder is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           memtoreg : out  STD_LOGIC;
           memwrite : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           alusrc : out  STD_LOGIC;
           regdst : out  STD_LOGIC;
           regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           aluop : out  STD_LOGIC_VECTOR (1 downto 0));
end MainDecoder;

architecture Behavioral of MainDecoder is
SIGNAL MDA : STD_LOGIC_VECTOR(8 downto 0);
begin
process(op)
begin
( regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop(1), aluop(0)) <= MDA ;
if (op = "000000") then
MDA <= "110000010";
elsif (op = "100011") then
MDA <= "101001000";
elsif (op = "101011") then
MDA <= "001010000";
elsif (op = "000100") then
MDA <= "000100001";
elsif (op = "001000") then
MDA <= "101000000";
elsif (op = "000010") then
MDA <= "000000100";
end if;
end process;

end Behavioral;

