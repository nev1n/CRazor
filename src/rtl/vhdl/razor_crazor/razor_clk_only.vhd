--https://ieeexplore.ieee.org/document/1253179
library ieee;
use ieee.std_logic_1164.all;

entity razor_clk_only is
--	generic (
--		setup	:	time := 3 ns;
--		hold	:	time := 2 ns;
--		delay	:	time := 4 ns
--	);
	port (
		clk		:	in std_logic;
		--clk delay has been removed in this design
		--clk_del	:	in std_logic;
		reset	:	in std_logic;
		LogIn	:	in std_logic;
		LogOut	:	out std_logic;
		error	:	out std_logic	
	);
end razor_clk_only;

architecture behaviour of razor_clk_only is

	signal muxOut_sig, 						-- mux output signal
			ffOut_sig, 						-- Main Flip Flop output sla 					-
			errorOut_sig	:	std_logic;	-- Error signal
	signal shLatOut_sig		:	std_logic;  -- Shadow Latch Output signal
			
begin

	-- High Reset	
	-- process (reset)
	-- begin
		-- if (reset = '1') then
			-- muxOut_sig		<= '0';
			-- ffOut_sig		<= '0';	
			-- shLatOut_sig	<= '0';
			-- errorOut_sig	<= '0';
		-- end if;	
	-- end process;  	
	
	RazorMux:
		entity work.Mux2x1 port map (LogIn, shLatOut_sig, errorOut_sig, muxOut_sig);
	
	-- generic map ( setup, hold, delay ) was removed from Dff for synthesis
	Dff1:
		entity work.Dff port map (clk, reset, muxOut_sig, ffOut_sig);
	
	DLat1:
		entity work.d_latch(behaviour2) port map (clk, reset, muxOut_sig, shLatOut_sig);
	
	ErrorOut:
		errorOut_sig	<=	ffOut_sig xor shLatOut_sig;
		LogOut			<=	ffOut_sig;
		
		error			<= errorOut_sig;
	
end behaviour;
	