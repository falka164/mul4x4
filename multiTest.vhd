-------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   23:32:36 04/28/2019
-- Design Name:  
-- Module Name:   /home/yrsa/Pulpit/mnozenie4bitowe/mul4bits/multiTest.vhd
-- Project Name:  mul4bits
-- Target Device: 
-- Tool versions: 
-- Description:  
--
-- VHDL Test Bench Created by ISE for module: multiplication
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
 
ENTITY multiTest IS
END multiTest;
 
ARCHITECTURE behavior OF multiTest IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplication
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         product : OUT  std_logic_vector(7 downto 0);
         u0o : OUT  std_logic_vector(7 downto 0);
         u1o : OUT  std_logic_vector(7 downto 0);
         u2o : OUT  std_logic_vector(7 downto 0);
         u3o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
   

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

     --Outputs
   signal product : std_logic_vector(7 downto 0);
   signal u0o : std_logic_vector(7 downto 0);
   signal u1o : std_logic_vector(7 downto 0);
   signal u2o : std_logic_vector(7 downto 0);
   signal u3o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name
 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: multiplication PORT MAP (
          a => a,
          b => b,
          product => product,
          u0o => u0o,
          u1o => u1o,
          u2o => u2o,
          u3o => u3o
        );

   -- Stimulus process
   stim_proc: process
   begin       
      -- hold reset state for 100 ns.
   wait for 100 ns;   
            a <= "0010";
            b <= "0010";
           
        wait for 100 ns;   
            a <= "0001";
            b <= "0000";
           
        wait for 100 ns;   
            a <= "0001";
            b <= "0001";
           
        wait for 100 ns;   
            a <= "0001";
            b <= "0011";
           
        wait for 100 ns;   
            a <= "0011";
            b <= "0011";
           
        wait for 100 ns;   
            a <= "0101";
            b <= "0111";   
       
        wait for 100 ns;   
            a <= "0101";
            b <= "1010";
   
      wait;
   end process;

END;
