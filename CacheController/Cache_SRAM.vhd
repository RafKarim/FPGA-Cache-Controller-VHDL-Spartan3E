----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:27:20 10/03/2024 
-- Design Name: 
-- Module Name:    Cache_SRAM - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cache_SRAM is
    Port ( ADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           WEN : in  STD_LOGIC_VECTOR (0 downto 0);
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC);
end Cache_SRAM;

architecture Behavioral of Cache_SRAM is

begin


end Behavioral;

