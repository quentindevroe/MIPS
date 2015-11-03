----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Segers Laurent
-- 
-- Create Date:    11:16:13 03/22/2012 
-- Design Name: 
-- Module Name:    ShiftLeft2 - Behavioral 
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
entity ShiftLeft is
	generic(
		N: INTEGER	:=1;
		width: INTEGER :=8
	); 
	port(
		Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		Output:	OUT	STD_LOGIC_VECTOR(width-1 downto 0)
		);
end ShiftLeft;
----------------------------------------------------------------------------------
architecture Behavioral of ShiftLeft is
begin
----------------------------------------------------------------------------------
	Output(width-1)<=Input(width-1);
	Output(width-2 downto N)<=Input(width-2-N downto 0);
	Output(N-1 downto 0)<=(others=>'0');
----------------------------------------------------------------------------------
end Behavioral;

