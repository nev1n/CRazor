library ieee;
use ieee.std_logic_1164.all;

entity crazor is
--	generic (
--		setup	:	time := 3 ns;
--		hold	:	time := 2 ns;
--		delay	:	time := 4 ns
--	);
	port (
		clk		:	in std_logic;
		clk_del	:	in std_logic;
		reset	:	in std_logic;
		LogIn	:	in std_logic;
		LogOut	:	out std_logic;
		error	:	out std_logic	
	);
end crazor;

architecture behaviour of crazor is

	signal muxOut_sig, 						-- mux output signal
			ffOut_sig, 						-- Main Flip Flop output sla 					-
			errorOut_sig	:	std_logic;	-- Error signal
	signal shLatOut_sig		:	std_logic;  -- Shadow Latch Output signal
			
begin

	cRazorMux:
		entity work.Mux2x1(behaviour_process_MUX2x1) port map (LogIn, shLatOut_sig, errorOut_sig, muxOut_sig);
	
	Dff1:
		--generic map ( setup, hold, delay )
		entity work.Dff  port map (clk, reset, muxOut_sig, ffOut_sig);
	
	DLat1:
		entity work.d_latch(behaviour2) port map (clk_del, reset, muxOut_sig, shLatOut_sig);
	
	MC:
		entity work.MullerC(behaviour_1) port map (ffOut_sig, shLatOut_sig, LogOut);
	
	ErrorOut:
		errorOut_sig	<=	ffOut_sig xor shLatOut_sig;
				
		error			<= errorOut_sig;
	
end behaviour;
	
	