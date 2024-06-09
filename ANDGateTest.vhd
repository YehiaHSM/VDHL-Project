--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:01:15 05/17/2021
-- Design Name:   
-- Module Name:   G:/Year 3/semi 2/Archi/Labs/Labs/lab1/ANDGATETest.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ANDGATE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ANDGATETest IS
END ANDGATETest;
 
ARCHITECTURE behavior OF ANDGATETest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ANDGATE
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         x : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal x : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ANDGATE PORT MAP (
          a => a,
          b => b,
          x => x
        );

   -- Stimulus process
   stim_proc: process
   begin		
	-- insert stimulus here
      -- hold reset state for 100 ns.
      wait for 0ns;
		a<='1';
		b<='0';
      wait for 100ns;
		a<='1';
		b<='1';		
      wait for 100ns;
      wait;
   end process;

END;
