----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Segers Laurent
-- 
-- Create Date:    11:59:56 03/01/2012 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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
--------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------------------------------------------------------------------
entity RegisterFile is
	port(		
		Read_Register_1:	IN		STD_LOGIC_VECTOR(4 downto 0);
		Read_Register_2:	IN		STD_LOGIC_VECTOR(4 downto 0);
		Write_Register:	IN		STD_LOGIC_VECTOR(4 downto 0);		
		RegWrite:			IN		STD_LOGIC;		
		write_data:			IN		STD_LOGIC_VECTOR(31 downto 0);		
		---- read data
		read_data_1: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
		read_data_2: 		OUT 	STD_LOGIC_VECTOR(31 downto 0);
		clk:					IN 	STD_LOGIC
	);	
end RegisterFile;
--------------------------------------------------------------------------------------------
architecture Behavioral of RegisterFile is
	constant N_rows:integer:=31; 																				-- number of cells of 32 bits										
	type memory_t is array (N_rows downto 0) of STD_LOGIC_VECTOR(31 downto 0);					-- memory declaration
	
	shared variable reg_read_2:STD_LOGIC_VECTOR(4 downto 0);
	
	signal registerfile:memory_t;	
begin
--------------------------------------------------------------------------------------------
	reg_Write:process(RegWrite,write_data,Write_Register,clk)	
	begin	
		if (rising_edge(clk)) then
			registerfile(0)<=(others=>'0');					
			if (RegWrite='1') then
				registerfile(conv_integer(Write_Register))<=write_data;	
			end if;	
		end if;		
	end process reg_write;
--------------------------------------------------------------------------------------------
	reg_Read:process(Read_Register_1,Read_Register_2)	
	begin			
		read_data_1<=registerfile(conv_integer(Read_Register_1));
		read_data_2<=registerfile(conv_integer(Read_Register_2));		
	end process reg_Read;
end Behavioral;
