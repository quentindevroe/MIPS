
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU_core IS
END tb_ALU_core;
 
ARCHITECTURE behavior OF tb_ALU_core IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         clk : IN  std_logic;
         ALUControl : IN  std_logic_vector(3 downto 0);
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         aluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ALUControl : std_logic_vector(3 downto 0) := "0010";
   signal data1 : std_logic_vector(31 downto 0) := "00000000000011110100001001000000";
   signal data2 : std_logic_vector(31 downto 0) := "00000000000011110100001001000000";

 	--Outputs
   signal zero : std_logic;
   signal aluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          clk => clk,
          ALUControl => ALUControl,
          data1 => data1,
          data2 => data2,
          zero => zero,
          aluResult => aluResult
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      --data1 <= "00000000000011110100001001000000";
		--data2 <= "00000000000011110100001001000000";
		--ALUControl <= "0010";

      wait;
   end process;

END;
