
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


entity aluControl is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (1 downto 0);
           functField : in  STD_LOGIC_VECTOR (5 downto 0);
			  OPCode : in STD_LOGIC_VECTOR ( 5 downto 0 );
           ALUControl : out  STD_LOGIC_VECTOR (3 downto 0));
end aluControl;

architecture Behavioral of aluControl is

begin
	process( ALUOP, functField, OPCode )
	begin
		case ALUOP is
			when "00" =>
				ALUControl <= "0010";
			when "01" =>
				ALUControl <= "0110";
			when "10" =>
				case  functField( 3 downto 0) is
					when "0000" =>
						ALUControl <= "0010";
					when "0010" =>
						ALUControl <= "0110";
					when "0100" =>
						ALUControl <= "0000";
					when "0101" =>
						ALUControl <= "0001";
					when "0111" =>
						ALUControl <= "1100";
					when "1010" =>
						ALUControl <= "0111";
					when others =>
						ALUControl <= "1111";
				end case;
			when "11" =>
				case OPCode is
					when "001000" =>
						ALUControl <= "0100";
					when "001100" =>
						ALUControl <= "0000";
					when "001101" =>
						ALUControl <= "0001";
					when others =>
						ALUControl <= "0000";
				end case;
			when others =>
				ALUControl <= "0000";
			end case;
	end process;
end Behavioral;

