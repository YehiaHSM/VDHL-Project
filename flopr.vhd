----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:13:44 05/17/2021 
-- Design Name: 
-- Module Name:    flopr - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flopr is
generic (n: NATURAL:=32);

    Port ( clk,reset:in STD_LOGIC;
	 d : in  STD_LOGIC_VECTOR (n-1 downto 0);
    q : out  STD_LOGIC_VECTOR (n-1 downto 0));
end flopr;

architecture Behavioral of flopr is

begin
process (clk,reset)
	begin
	if reset ='1' then q<=(others=>'0');
	elsif rising_edge(clk) then
	q<=d;
	end if;
end process;	

end Behavioral;

