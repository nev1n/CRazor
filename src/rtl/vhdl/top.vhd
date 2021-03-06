--------------------------------------------------------------------------------
--!@file: RISC_top.vhd
--!@brief: this is the top level of the ALU Razor Test
--! - Registers before and after ALU. Kinda 2 Stage-Pipeline
--! - 21 bit instruction width
--! - generic arch
--! - 32 bit data
--! - 32 GP register
--
--!@author: n30
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all; -- import std_logic types
use IEEE.std_logic_arith.all; -- import add/sub of std_logic_vector
use IEEE.std_logic_unsigned.all;
use work.RISC_lib.all;

entity top is
	port (
		clk			: in std_logic;
		reset		: in std_logic; -- active high!
		
		alu_op1		: in data_word;
		alu_op2		: in data_word;

		alu_result	: out data_word
	
	);
end entity top;

architecture behave of top is
	

	signal aluOp1_reg_in	: data_word;
	signal aluOp1_reg_out	: data_word;
	
	signal aluOp2_reg_in	: data_word;
	signal aluOp2_reg_out	: data_word;
	
	signal aluResult_reg_in	: data_word;	
	signal aluResult_reg_out: data_word;

	signal alu_Control_hang	: alu_operations;
	signal alu_ex_jmpfl_hang: std_logic;		

	
begin
	
	--input signals
	aluOp1_reg_in <= alu_op1;
	aluOp2_reg_in <= alu_op2;
	
	--no need to split, just for visibility
	ALU_OP1_REG:	
		process(clk, reset) is
		begin
			if reset = '1' then
				aluOp1_reg_out <= (others => '0');
			elsif rising_edge(clk) then
				aluOp1_reg_out <= aluOp1_reg_in;
			end if;
		end process;
	
	ALU_OP2_REG:	
		process(clk, reset) is
		begin
			if reset = '1' then
				aluOp2_reg_out <= (others => '0');
			elsif rising_edge(clk) then
				aluOp2_reg_out <= aluOp2_reg_in;
			end if;
		end process;
	
	ALU:
	entity work.alu port map ( 
						alu_opc => alu_Control_hang, alu_op1 => aluOp1_reg_out,
						alu_op2 => aluOp2_reg_out, execute_jmpflag => alu_ex_jmpfl_hang,
						result => aluOp2_reg_out 
	);
								
	ALU_RESULT_REG:
		process(clk, reset) is
		begin
			if reset = '1' then
				aluResult_reg_out <= (others => '0');
			elsif rising_edge(clk) then
				aluResult_reg_out <= aluResult_reg_in;	
			end if;
		end process;
	
	--output signals
	alu_result <= aluResult_reg_out;	
	
	end architecture behave;
