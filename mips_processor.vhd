----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:33:18 05/22/2021 
-- Design Name: 
-- Module Name:    mips_processor - Behavioral 
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
use work.mypack.all;

entity mips_processor is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inst : in  STD_LOGIC_VECTOR(31 downto 0);
           readdata : in  STD_LOGIC_VECTOR(31 downto 0);
           pc : out  STD_LOGIC_VECTOR(31 downto 0);
           writedata : out  STD_LOGIC_VECTOR(31 downto 0);
           aluout : out  STD_LOGIC_VECTOR(31 downto 0);
           memwrite : out  STD_LOGIC);
end mips_processor;

architecture Behavioral of mips_processor is
SIGNAL zero:STD_LOGIC;
SIGNAL memtoreg:STD_LOGIC;
SIGNAL pcsrc:STD_LOGIC;
SIGNAL alusrc:STD_LOGIC;
SIGNAL regdst:STD_LOGIC;
SIGNAL regwrite:STD_LOGIC;
SIGNAL alucontroller:STD_LOGIC_VECTOR(2 downto 0);
SIGNAL jump:STD_LOGIC;
begin

obj: controller port map(inst(31 downto 26),inst(5 downto 0),zero,memtoreg,memwrite,pcsrc,alusrc,regdst,regwrite,jump,alucontroller);
obj1: datapath port map(clk,reset,readdata,inst,memtoreg,pcsrc,alusrc,regwrite,regdst,aluocontroller,zero,pc,aluout,writedata);

end Behavioral;

