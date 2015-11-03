----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Quentin Devroe
-- 
-- Create Date:    10:39:59 10/20/2015 
-- Design Name: 	
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is

    Port ( inst : 	in  STD_LOGIC_VECTOR (5 downto 0);
           Regdst : 	out  STD_LOGIC;
           Branch : 	out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           AluOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
			  Jump : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
			  
end ControlUnit;

architecture Behavioral of ControlUnit is



begin

control:process(inst)
begin

case inst is
  when "000000"	=> Regdst 	<= '1'; -- R-inst check  X"00"
						AluSrc	<= '0';
						MemToReg	<= '0';
						RegWrite	<= '1';
						MemRead	<= '0';
						MemWrite	<= '0';
						Branch 	<= '0';
						AluOp		<= "10";
						Jump     <= '0';
						
						
  when "100011" => Regdst 	<= '0'; -- LW check   X"23"	
						AluSrc	<= '1';
						MemToReg	<= '1';
						RegWrite	<= '1';
						MemRead	<= '1';
						MemWrite	<= '0';
						Branch 	<= '0';
						AluOp		<= "00";
						Jump     <= '0';
						
  
  when "101011"	=> Regdst 	<= 'X'; -- SW check X"2B"
						AluSrc	<= '1';
						MemToReg	<= 'X';
						RegWrite	<= '0';
						MemRead	<= '0';
						MemWrite	<= '1';
						Branch 	<= '0';
						AluOp		<= "00";
						Jump     <= '0';
						
						
 when "000100"		=> Regdst 	<= 'X'; -- BEQ check X"04"
						AluSrc	<= '0';
						MemToReg	<= 'X';
						RegWrite	<= '0';
						MemRead	<= '0';
						MemWrite	<= '0';
						Branch 	<= '1';
						AluOp		<= "01";
						Jump     <= '0';
						
						
 when "001000"		=> Regdst 	<= '0'; -- ADDI checkX "08"
						AluSrc	<= '1';
						MemToReg	<= '0';
						RegWrite	<= '1';
						MemRead	<= '0';
						MemWrite	<= '0';
						Branch 	<= '0';
						AluOp		<= "11";		--convention Loïc			
						Jump     <= '0';
						
						
 when "000010"		=> Regdst 	<= 'X'; -- J X"02"
						AluSrc	<= 'X';
						MemToReg	<= '0';
						RegWrite	<= '0';
						MemRead	<= '0';
						MemWrite	<= '0';
						Branch 	<= 'X';
						AluOp		<= "XX";	
						Jump     <= '1';
						
   
  when others	=> Regdst 	<= '0'; --NOP
						Branch 	<= '0';
						MemRead	<= '0';
						MemToReg	<= '0';
						AluOp		<= "00";
						MemWrite	<= '0';
						AluSrc	<= '0';
						RegWrite	<= '0';
						Jump     <= '0';
						
						
end case;

end process;

end Behavioral;

