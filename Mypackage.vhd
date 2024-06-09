--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Mypackage is
component flopr is
generic (n: NATURAL:=32);

    Port ( clk,reset:in STD_LOGIC;
	 d : in  STD_LOGIC_VECTOR (n-1 downto 0);
    q : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component Mux2 is
Generic(n:integer:=8);

    Port ( I0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           I1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           y : out  STD_LOGIC_VECTOR (n-1 downto 0);
           s : in  STD_LOGIC);
end component;

component ALU32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SL2 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Carry : out  STD_LOGIC);
end component;

component Signext is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component regfile
port(clk: in STD_LOGIC;
we: in STD_LOGIC;
ra1, ra2, wa: in STD_LOGIC_VECTOR(4 downto 0);
wd: in STD_LOGIC_VECTOR(31 downto 0);
rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component mips_processor is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inst : in  STD_LOGIC_VECTOR(31 downto 0);
           readdata : in  STD_LOGIC_VECTOR(31 downto 0);
           pc : out  STD_LOGIC_VECTOR(31 downto 0);
           writedata : out  STD_LOGIC_VECTOR(31 downto 0);
           aluout : out  STD_LOGIC_VECTOR(31 downto 0);
           memwrite : out  STD_LOGIC);
end component;

component controller is
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
end component;



end Mypackage;

