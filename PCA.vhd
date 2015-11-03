----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 			Segers Laurent
-- 
-- Create Date:    10:20:26 10/13/2015 
-- Design Name: 
-- Module Name:    PCA - Behavioral 
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

entity PCA is

	port(
		PC_IN: IN STD_LOGIC_VECTOR(31 downto 0 ) ;
		PC_OUT: OUT STD_LOGIC_VECTOR(31 downto 0 ) 
		);
end PCA;

architecture Behavioral of PCA is

begin

PC_OUT <= PC_IN+4;

end Behavioral;

