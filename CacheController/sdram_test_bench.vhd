--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:00:28 10/14/2024
-- Design Name:   
-- Module Name:   /home/student2/ckelsey/coe758/project1/sdram_test_bench.vhd
-- Project Name:  project1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sdram_controller
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
 
ENTITY sdram_test_bench IS
END sdram_test_bench;
 
ARCHITECTURE behavior OF sdram_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sdram_controller
    PORT(
         clk : IN  std_logic;
         memstrb : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         address : IN  std_logic_vector(11 downto 0);
         d_in : IN  std_logic_vector(7 downto 0);
         d_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal memstrb : std_logic := '1';
   signal wea : std_logic_vector(0 downto 0) := (others => '1');
   signal address : std_logic_vector(11 downto 0) := "000000000001";
   signal d_in : std_logic_vector(7 downto 0) := (others => '1');

 	--Outputs
   signal d_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sdram_controller PORT MAP (
          clk => clk,
          memstrb => memstrb,
          wea => wea,
          address => address,
          d_in => d_in,
          d_out => d_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		

      wait;
   end process;

END;
