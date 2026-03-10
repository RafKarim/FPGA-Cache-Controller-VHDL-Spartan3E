----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:41:37 10/03/2024 
-- Design Name: 
-- Module Name:    ctrl_fsm - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ctrl_fsm is
    Port ( tag : in  STD_LOGIC_VECTOR (7 downto 0);
           old_tag : in  STD_LOGIC_VECTOR (7 downto 0);
           index : in  STD_LOGIC_VECTOR (2 downto 0);
           offset : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           MSTRB : out  STD_LOGIC;
           dirty : in  STD_LOGIC;
           hit : in  STD_LOGIC;
           cs : in  STD_LOGIC;
           WR_RDi : in  STD_LOGIC;
           RDY : out  STD_LOGIC;
           Addr_out : out  STD_LOGIC_VECTOR (15 downto 0);
           WEN : out  STD_LOGIC_VECTOR (0 downto 0);
           Dout_sel : out  STD_LOGIC;
           Din_sel : out  STD_LOGIC;
           WR_RDo : out  STD_LOGIC;
           table_WEN : out  STD_LOGIC;
           data_to_table : out  STD_LOGIC_VECTOR (9 downto 0);
           debug_state : out  STD_LOGIC_VECTOR (2 downto 0));
end ctrl_fsm;

architecture Behavioral of ctrl_fsm is

TYPE STATETYPE IS (state_0, state_1, state_2, state_3, state_4, state_5);
SIGNAL present_state: STATETYPE := state_0;

SIGNAL counter : integer := 0;

begin
-- outputs depending on state
process(clk, present_state)
begin
	if present_state = state_0 then
		RDY <= '1';
		Addr_out <= "0000000000000000";
		WEN <= "0";
		Dout_sel <= '0';
		Din_sel <= '0';
		WR_RDo <= '0';
		MSTRB <= '0';
		table_WEN <= '0';
		data_to_table <= "0000000000";
	elsif present_state = state_1 then
		RDY <= '0';
		Addr_out <= "0000000000000000";
		WEN <= "0";
		Dout_sel <= '0';
		Din_sel <= '0';
		WR_RDo <= '0';
		MSTRB <= '0';
		table_WEN <= '0';
		data_to_table <= "0000000000";
	elsif present_state = state_2 then
		RDY <= '0';
		Addr_out <= "0000000000000000";
		WEN <= "0";
		Dout_sel <= '1';
		Din_sel <= '0';
		WR_RDo <= '0';
		MSTRB <= '0';
		table_WEN <= '0';
		data_to_table <= "0000000000";
	elsif present_state = state_3 then
		RDY <= '0';
		Addr_out <= "0000000000000000";
		WEN <= "1";
		Dout_sel <= '0';
		Din_sel <= '0';
		WR_RDo <= '0';
		MSTRB <= '0';
		table_WEN <= '1';
		data_to_table <= tag & "11";
	elsif present_state = state_4 then
		RDY <= '0';
		Addr_out <= old_tag & index & std_logic_vector(to_unsigned(counter/2, 5));
		WEN <= "1";
		Dout_sel <= '0';
		Din_sel <= '0';
		WR_RDo <= '1';
		if counter mod 2 = 0 then
			MSTRB <= '0';
		else
			MSTRB <= '1';
		end if;
		table_WEN <= '0';
		data_to_table <= "0000000000";
	elsif present_state = state_5 then
		RDY <= '0';
		Addr_out <= old_tag & index & std_logic_vector(to_unsigned(counter/2, 5));
		WEN <= "1";
		Dout_sel <= '0';
		Din_sel <= '1';
		WR_RDo <= '0';
		if counter mod 2 = 0 then
			MSTRB <= '0';
		else
			MSTRB <= '1';
		end if;
		table_WEN <= '1';
		data_to_table <= tag & "01";
	end if;
	
	if rising_edge(clk) then
	
	if present_state = state_0 then
		if cs = '1' then
			counter <= 0;
			present_state <= state_1;
		end if;
	elsif present_state = state_1 then
		if (hit = '1' and WR_RDi = '0') then
			counter <= 0;
			present_state <= state_2;
		elsif (hit = '1' and WR_RDi = '1') then
			counter <= 0;
			present_state <= state_3;
		elsif (hit = '0' and dirty = '1') then
			counter <= 0;
			present_state <= state_4;
		elsif (hit = '0' and dirty = '0') then
			counter <= 0;
			present_state <= state_5;
		else
			counter <= 0;
			present_state <= state_0;
		end if;
	elsif present_state = state_2 then
		if counter = 8 then
			counter <= 0;
			present_state <= state_0;
		end if;
	elsif present_state = state_3 then
		if counter = 8 then
			counter <= 0;
			present_state <= state_0;
		end if;
	elsif present_state = state_4 then
		if counter = 64 then
			counter <= 0;
			present_state <= state_5;
		end if;
	elsif present_state = state_5 then
		if (WR_RDi = '1') then
			if counter = 64 then
				counter <= 0
				present_state <= state_3;
			end if;
		else
			if counter = 32 then
				counter <= 0
				present_state <= state_2;
			end if;
		end if;
	end if;
	
	else
		counter <= counter + 1;
	end if;
end process;

process(present_state)
begin
	if (present_state = state_0) then
		debug_state <= "000";
	elsif (present_state = state_1) then
		debug_state <= "001";
	elsif (present_state = state_2) then
		debug_state <= "010";
	elsif (present_state = state_3) then
		debug_state <= "011";
	elsif (present_state = state_4) then
		debug_state <= "100";
	elsif (present_state = state_5) then
		debug_state <= "101";
	end if;
end process;

end Behavioral;

