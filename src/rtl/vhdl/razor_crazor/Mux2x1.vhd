-- 2 to 1 mux (Single bit)
-- based on VHDL implementation @ https://www.nandland.com/vhdl/modules/mux-multiplexor-in-fpga-vhdl-verilog.html

library ieee;
use ieee.std_logic_1164.all;

entity MUX2x1 is
  port (
    Input1      : in std_logic;
    Input2      : in std_logic;
    SelectLine  : in std_logic;
    Output      : out std_logic
    );
end entity MUX2x1;

architecture rtl_MUX2x1 of MUX2x1 is
begin
	--Output <= Input1 when SelectLine = '0' else Input2;
	
	--rewritten for the shadow latch feature of razor. Safdar suggests that it is better
	--that the default condition is Input0, as data is connected here.
	Output <= Input2 when SelectLine = '1' else Input1;
end rtl_MUX2x1;

architecture behaviour_process_MUX2x1 of MUX2x1 is
begin
	process (Input1, Input2, SelectLine)
	begin
		if(SelectLine = '1' ) then
			Output	<=	Input2;
		else
			Output	<=	Input1;
		end if;	
	end process;
	
end behaviour_process_MUX2x1;	