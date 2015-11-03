----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Segers Laurent
-- 
-- Create Date:    21:04:01 01/18/2013 
-- Design Name: 
-- Module Name:    IMem - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity IMem is
port(
	Clk:				IN		STD_LOGIC;	
	PC: 				IN		STD_LOGIC_VECTOR(31 downto 0);
	Instruction:	OUT	STD_LOGIC_VECTOR(31 downto 0)	
);
end IMem;
----------------------------------------------------------------------------------
architecture Behavioral of IMem is	
begin
	-------------------------------------------------------------------------------
	MemoryPC:process(PC,Clk)
		subtype 		word 		is STD_LOGIC_VECTOR(31 downto 0);
		type 			memory 	is array(0 to 7) of word;
		variable 	myMem:	memory	:=	
		(X"20090001", X"200afffb", X"012a5820", X"ac0b0000",
		 X"8c0c0000", X"01890018", X"00004810", X"00005012");		
	begin		
		
		if (rising_edge(Clk)) then
		Instruction<=myMem(conv_integer(PC(31 downto 2)));
		end if;
		
	end process MemoryPC;
	-------------------------------------------------------------------------------	
end Behavioral;
