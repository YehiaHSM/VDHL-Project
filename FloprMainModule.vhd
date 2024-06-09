----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:38 05/18/2021 
-- Design Name: 
-- Module Name:    FloprMainModule - Behavioral 
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
use work.Mypackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FloprMainModule is
generic (n : natural :=32);
    Port ( clk : in  STD_LOGIC;
           C : in  STD_LOGIC;
           L : in  STD_LOGIC;
           R1 : out  STD_LOGIC_VECTOR (n-1 downto 0);
           R2 : out  STD_LOGIC_VECTOR (n-1 downto 0));
end FloprMainModule;

architecture Behavioral of FloprMainModule is
SIGNAL Tmp1:STD_LOGIC_VECTOR (n-1 downto 0);
SIGNAL Tmp2:STD_LOGIC_VECTOR (n-1 downto 0);
begin
Tmp1 <= (others => '1');
R1Map: flopr Generic Map (n) Port Map (clk,C,Tmp1,Tmp2);
R2Map: flopr Generic Map (n) Port Map (clk,not(L),Tmp2,R2);
R1<=Tmp2;
end Behavioral;

