
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( clk : in  STD_LOGIC;
           ALUControl : in  STD_LOGIC_VECTOR (3 downto 0);
           data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC;
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process( ALUControl, data1, data2, clk )
		variable aluResultVar : std_logic_vector( 31 downto 0 );
		begin
		if( rising_edge( clk ) ) then
			case ALUControl is
				when "0000" => 
					aluResultVar := data1 and data2;
				when "0001" =>
					aluResultVar := data1 or data2;
				when "0010" =>
					aluResultVar := data1 + data2;
				when "0110" =>
					aluResultVar := data1 - data2;
				when "0111" =>
					if( data1 < data2 ) then 
						aluResultVar := (others => '1');
					else
						aluResultVar := (others => '0');
					end if;
				when "1100" =>
					aluResultVar := not( data1 or data2 );
				when others =>
					aluResultVar := (others => '0');
			end case;
			
			if( aluResultVar = std_logic_vector( to_unsigned( 0 , 32 ) ) ) then
				zero <= '1';
			else
				zero <= '0';
			end if;
			
			aluResult <= aluResultVar;
			
		end if;	
	end process;

end Behavioral;

