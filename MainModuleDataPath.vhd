----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:58 05/18/2021 
-- Design Name: 
-- Module Name:    MainModuleDataPath - Behavioral 
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

entity datapath is -- MIPS datapath
port(clk, reset: in STD_LOGIC;
readdata: in STD_LOGIC_VECTOR(31 downto 0);
instr: in STD_LOGIC_VECTOR(31 downto 0);
memtoreg, pcsrc,alusrc,regwrite, regdst: in STD_LOGIC;
aluoperation: in STD_LOGIC_VECTOR(2 downto 0);
zero: out STD_LOGIC;
pc: buffer STD_LOGIC_VECTOR(31 downto 0);
aluout, writedata: buffer STD_LOGIC_VECTOR(31 downto 0));
end datapath;


architecture Behavioral of datapath is
signal pcnext, pcplus4, pcbranch: STD_LOGIC_VECTOR(31 downto 0);
signal signimm, signimmsh: STD_LOGIC_VECTOR(31 downto 0);
signal srca, srcb, result: STD_LOGIC_VECTOR(31 downto 0);
signal wdata: STD_LOGIC_VECTOR(31 downto 0);
signal writereg: STD_LOGIC_VECTOR(4 downto 0);

begin
pcreg: flopr generic map(32) port map (clk, reset, pcnext, pc);
pcaddl: Adder port map (pc, X"00000004", pcplus4);
immsh: SL2 port map(signimm,signimmsh);
pcadd2: Adder port map(pcplus4,signimmsh, pcbranch);
pcbrmux: Mux2 generic map(32) port map (pcplus4, pcbranch, pcsrc, pcnext);

obj1: regfile port map(clk,regwrite,instr(25 downto 21),instr(20 downto 16),writereg,wdata,srca,writedata);
obj2:Mux2 generic map(5) port map (instr(20 downto 16),instr(15 downto 11),regdst,writedata);
obj3:Mux2 generic map(32) port map (aluout,readdata,memtoreg,wdata);
obj4:Signext port map(instra(15 downto 0),signimm);

obj5:Mux2 generic map(32) port map (writedata,signimm,alusrc,srcb);
obj6:ALU32 port map(srca,srcb,aluoperation,aluout,zero);

end Behavioral;

