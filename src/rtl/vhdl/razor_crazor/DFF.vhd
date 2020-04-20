library ieee;
use ieee.std_logic_1164.all;

entity Dff is
--	generic (
--		setup	:	time := 3 ns;
--		hold	:	time := 2 ns;
--		delay	:	time := 4 ns
--	);
	port (
		clk		:	in std_logic;
		reset	:	in std_logic;
		d 		:	in std_logic;
		q		:	out std_logic
	);
end Dff;

-- architecture behaviour of Dff is
-- begin

	-- process (clk, reset)
		-- variable result	: std_logic;				-- result is variable ':='
		-- variable delay	: time := 0 ns; 
	-- begin
		-- if(reset = '1') then
			-- result := '0';			
		-- elsif rising_edge(clk) then
			-- result := d;
		-- end if;		
	-- q <= result after delay;
	
	
	-- end process;

-- end architecture;

architecture behaviour_time_assert of Dff is
--based on architectural description prescribed Designer's Guide to VHDL (2nd edition), 
--Peter J Ashden, pg: 312
begin

	assignment: process (clk, reset)
	begin
		if(reset = '1') then 
			q <= '0';
		elsif rising_edge(clk) then
			--q <= d after delay;  , bad for synthesis
			q <= d;
		end if;
	end process assignment;		
		
	-- setup_time_check: process is
	-- begin
		-- wait until clk='1';
		-- assert d'last_event >= setup
			-- report "Setup Time Violation!";
	-- end process setup_time_check;
	
	-- hold_time_check: process is
	-- begin
		-- wait until clk'delayed(hold) = '1';
		-- assert d'last_event >= hold
			-- report "Hold Time Violation";
	-- end process hold_time_check;


end architecture behaviour_time_assert;		


