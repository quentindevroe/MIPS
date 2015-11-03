----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:16 10/26/2015 
-- Design Name: 
-- Module Name:    DMem - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DMem is
    Port (  Clk			: in STD_LOGIC;
				memwrite 	: in  STD_LOGIC;
				memread 	: in  STD_LOGIC;
				address 	: in  STD_LOGIC_VECTOR (31 downto 0);
				writedata : in  STD_LOGIC_VECTOR (31 downto 0);
				readdata 	: out STD_LOGIC_VECTOR (31 downto 0));
end DMem;

architecture Behavioral of DMem is

begin

-------------------------------------------------------------------------------
	MemoryPC:process(Clk)
		subtype 		word 		is STD_LOGIC_VECTOR(31 downto 0) ;
		type 			memory 	is array(0 to 63) of word; 					-- memory van 64x32bit(word)  256 bytes
		variable 	myMem:	memory	:= ((others=> (others=>'0')));
	begin		
		
		if (rising_edge(Clk)) then
		
				if(memread = '1') then
				readdata<=myMem(conv_integer(address(31 downto 2)));
				
				elsif(memwrite ='1') then
				myMem(conv_integer(address(31 downto 2))):=writedata;
				
				
				end if;
				
		end if;
		
	end process MemoryPC;
	-------------------------------------------------------------------------------	


end Behavioral;

