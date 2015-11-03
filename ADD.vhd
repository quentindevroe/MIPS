----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:19 10/27/2015 
-- Design Name: 
-- Module Name:    ADD - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is
    Port ( current_address : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_add : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_address : out  STD_LOGIC_VECTOR (31 downto 0));
end ADD;

architecture Behavioral of ADD is

begin

jump_address <= current_address + jump_add;

end Behavioral;

