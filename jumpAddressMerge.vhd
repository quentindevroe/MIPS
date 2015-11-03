----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:13 10/27/2015 
-- Design Name: 
-- Module Name:    jumpAddressMerge - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jumpAddressMerge is
    Port ( current_address : in  STD_LOGIC_VECTOR (27 downto 0);
           vier : in  STD_LOGIC_VECTOR (3 downto 0);
           new_address : out  STD_LOGIC_VECTOR (31 downto 0));
end jumpAddressMerge;

architecture Behavioral of jumpAddressMerge is

begin

new_address <= vier & current_address;


end Behavioral;

