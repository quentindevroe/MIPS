----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Segers Laurent
-- 
-- Create Date:    10:56:36 01/26/2013 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
entity PC is 	
port(
	Clk:	IN	STD_LOGIC;
	Reset:	IN	STD_LOGIC; 		
	PC_IN:	IN	STD_LOGIC_VECTOR(31 downto 0); 	
	PC_OUT:	OUT	STD_LOGIC_VECTOR(31 downto 0)	
); 
end PC;
----------------------------------------------------------------------------------
architecture Behavioral of PC is 
	signal RESET_TRIGGER:STD_LOGIC;--<='0';
begin 	
	-- the setPC process
	setPC:process(Clk,PC_IN,RESET_TRIGGER)		
	begin
		if (rising_edge(Clk)) then
			if (RESET_TRIGGER='1') then
				PC_OUT <= (others=>'0');
			else
				PC_OUT <= PC_IN;
			end if;
		end if;		
	end process setPC;
	-------------------------------------------------------------------------------
	resetPC:process(Reset,Clk)
	begin
		if (Reset='1') then
				RESET_TRIGGER<='1';
		elsif ((rising_edge(clk)) and (Reset='0')) then
				RESET_TRIGGER<='0';
		end if;
	end process resetPC;
end Behavioral;
----------------------------------------------------------------------------------