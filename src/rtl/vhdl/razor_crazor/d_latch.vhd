-- d latch
-- examples : https://startingelectronics.org/software/VHDL-CPLD-course/tut10-gated-D-latch/

library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
	port (
		en		: in std_logic;
		reset	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
end d_latch;

 architecture behaviour1 of d_latch is
     signal data : std_logic;
 begin

     data <= d when (en = '1') else data;
     q <= data;

 end behaviour1;
 
 architecture behaviour2 of d_latch is
     --signal data : std_logic;
 begin

	process(en, reset, d)
	begin
		if (reset = '1') then
			q <= '0';
		elsif (en = '1') then
			q <= d;
		end if;
	end process;

 end behaviour2;

 --safdar said no reset here
--delta cycle problem in this architecture! (M.H) 
-- architecture behaviour2 of d_latch is
-- begin

	-- process (en, d)
	-- begin
		-- if reset = '1' then
			-- q <= '0';
		-- else	
			-- if ( en = '1') then
				-- q <= d;
			-- end if;
		-- end if;
	-- end process;

-- end behaviour2;	
	
	