----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:24:13 10/03/2024 
-- Design Name: 
-- Module Name:    cache - Behavioral 
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

entity cache is
    Port ( ADDR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           WR_RD_in : in  STD_LOGIC;
           CS : in  STD_LOGIC;
           ADDR_out : out  STD_LOGIC_VECTOR (15 downto 0);
           MSTRB : out  STD_LOGIC;
           Dout_0 : out  STD_LOGIC;
           Dout_1 : out  STD_LOGIC;
           Din_0 : in  STD_LOGIC;
           Din_1 : in  STD_LOGIC;
           RDY : out  STD_LOGIC;
           clk : out  STD_LOGIC;
           debug_state : out  STD_LOGIC;
           debug_table_match : out  STD_LOGIC;
           debug_hit : out  STD_LOGIC);
end cache;

architecture Behavioral of cache is

begin


end Behavioral;

