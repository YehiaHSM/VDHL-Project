----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:34 05/17/2021 
-- Design Name: 
-- Module Name:    ALU32 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU32;

architecture Behavioral of ALU32 is

signal S,Bout:STD_LOGIC_VECTOR(31 downto 0);
begin
Bout <= (not B) when (F(2)='1') else B;
S <= A + Bout + F(2);
Y <= A and Bout when F(1 downto 0) = "00" ELSE
	A or Bout when F(1 downto 0) = "01" ELSE
	S when F(1 downto 0) = "10" ELSE
	("0000000000000000000000000000000"&S(31)) when F(1 downto 0)= "11" ELSE
	X"00000000";
end Behavioral;

