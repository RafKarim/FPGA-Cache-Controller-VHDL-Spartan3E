----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:32:07 10/03/2024 
-- Design Name: 
-- Module Name:    cacheController - Behavioral 
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

entity cacheController is
    Port ( ADDR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           WR_RD_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           CS : in  STD_LOGIC;
           ADDR_out : out  STD_LOGIC_VECTOR (15 downto 0);
           RDY : out  STD_LOGIC;
           WR_RD_out : out  STD_LOGIC;
           MSTRB : out  STD_LOGIC;
           Dout_sel : out  STD_LOGIC;
           Din_sel : out  STD_LOGIC;
           WEN : out  STD_LOGIC_VECTOR (0 downto 0);
           C_addr : out  STD_LOGIC_VECTOR (7 downto 0);
           debug_state : out  STD_LOGIC_VECTOR (2 downto 0);
           debug_hit : out  STD_LOGIC;
           debug_table_match : out  STD_LOGIC);
end cacheController;

architecture Behavioral of cacheController is

begin


end Behavioral;

