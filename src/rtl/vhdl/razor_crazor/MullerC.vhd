-- mullerC
library ieee;
use ieee.std_logic_1164.all;

entity MullerC is
	port ( 
		in_1	: in std_logic;
		in_2	: in std_logic;
		out_1	: out std_logic
		);
end MullerC;

architecture behaviour_1 of MullerC is
begin

	process (in_1, in_2)
	begin
		if (in_1 = in_2)  then -- no else, deliberately trying to create a latch
			out_1 <= in_1;
		end if;
	end process;
end architecture behaviour_1;


architecture behaviour_2 of MullerC is
begin
	
	process
	begin
		wait until in_1 = '1' and in_2 = '1';
			out_1 <= '1';
		wait until in_1 = '0' and in_2 = '0';
			out_1 <= '0';
	end process;
end architecture behaviour_2;
			
			
