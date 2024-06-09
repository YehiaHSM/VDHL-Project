----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:59 05/22/2021 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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



entity controller is
    Port ( op : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           funct : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           zero : in  STD_LOGIC;
           memtoreg : out  STD_LOGIC;
           memwrite : out  STD_LOGIC;
           pcsrc : out  STD_LOGIC;
           alusrc : out  STD_LOGIC;
           regdst : out  STD_LOGIC;
           regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           alucontrol : out  STD_LOGIC_VECTOR(2 downto 0));
end controller;

architecture Behavioral of controller is
signal aluop :STD_LOGIC_VECTOR(2 DOWNTO 0);
signal branch :STD_LOGIC;
begin
pcsrc<= zero AND branch;
obj: MainDecoder port map(op,memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,aluop);
obj1: AluDecoder port map(funct,aluop,alucontrol);

end Behavioral;

