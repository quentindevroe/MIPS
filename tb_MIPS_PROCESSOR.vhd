
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_MIPS_PROCESSOR IS
END tb_MIPS_PROCESSOR;
 
ARCHITECTURE behavior OF tb_MIPS_PROCESSOR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS_PROCESSOR
    PORT(
         Oprogram_counter : OUT  std_logic_vector(31 downto 0);
         Opctopc : OUT  std_logic_vector(31 downto 0);
         Oprogram_counter4 : OUT  std_logic_vector(31 downto 0);
         Oinstruction_routing : OUT  std_logic_vector(31 downto 0);
         Omux1_out : OUT  std_logic_vector(4 downto 0);
         Ojump_address1 : OUT  std_logic_vector(27 downto 0);
         Ojump_address2 : OUT  std_logic_vector(31 downto 0);
         Osign_extend_branch : OUT  std_logic_vector(31 downto 0);
         Obranch_add : OUT  std_logic_vector(31 downto 0);
         Oregdst_rout : OUT  std_logic;
         ORegWrite_rout : OUT  std_logic;
         Ojump_rout : OUT  std_logic;
         Omemtoreg_rout : OUT  std_logic;
         Omemtoread_rout : OUT  std_logic;
         Omemwrite_rout : OUT  std_logic;
         OALU_OP_rout : OUT  std_logic_vector(1 downto 0);
         OALU_control_rout : OUT  std_logic_vector(3 downto 0);
         Oalusrc_rout : OUT  std_logic;
         Oread_data2 : OUT  std_logic_vector(31 downto 0);
         Oread_data1 : OUT  std_logic_vector(31 downto 0);
         OALu1 : OUT  std_logic_vector(31 downto 0);
         OALU2 : OUT  std_logic_vector(31 downto 0);
         Owritedata_rout : OUT  std_logic_vector(31 downto 0);
         Oaluresult_rout : OUT  std_logic_vector(31 downto 0);
         Oread_data_Dmem_rout : OUT  std_logic_vector(31 downto 0);
         Oaluaddresult_rout : OUT  std_logic_vector(31 downto 0);
         Omx1tomx2 : OUT  std_logic_vector(31 downto 0);
         Obranch_rout : OUT  std_logic;
         Ozero_rout : OUT  std_logic;
         Omux1SEL_rout : OUT  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
--   signal Oprogram_counter : std_logic_vector(31 downto 0);
--   signal Opctopc : std_logic_vector(31 downto 0);
--   signal Oprogram_counter4 : std_logic_vector(31 downto 0);
--   signal Oinstruction_routing : std_logic_vector(31 downto 0);
--   signal Omux1_out : std_logic_vector(4 downto 0);
--   signal Ojump_address1 : std_logic_vector(27 downto 0);
--   signal Ojump_address2 : std_logic_vector(31 downto 0);
--   signal Osign_extend_branch : std_logic_vector(31 downto 0);
--   signal Obranch_add : std_logic_vector(31 downto 0);
--   signal Oregdst_rout : std_logic;
--   signal ORegWrite_rout : std_logic;
--   signal Ojump_rout : std_logic;
--   signal Omemtoreg_rout : std_logic;
--   signal Omemtoread_rout : std_logic;
--   signal Omemwrite_rout : std_logic;
--   signal OALU_OP_rout : std_logic_vector(1 downto 0);
--   signal OALU_control_rout : std_logic_vector(3 downto 0);
--   signal Oalusrc_rout : std_logic;
--   signal Oread_data2 : std_logic_vector(31 downto 0);
--   signal Oread_data1 : std_logic_vector(31 downto 0);
--   signal OALu1 : std_logic_vector(31 downto 0);
--   signal OALU2 : std_logic_vector(31 downto 0);
--   signal Owritedata_rout : std_logic_vector(31 downto 0);
--   signal Oaluresult_rout : std_logic_vector(31 downto 0);
--   signal Oread_data_Dmem_rout : std_logic_vector(31 downto 0);
--   signal Oaluaddresult_rout : std_logic_vector(31 downto 0);
--   signal Omx1tomx2 : std_logic_vector(31 downto 0);
--   signal Obranch_rout : std_logic;
--   signal Ozero_rout : std_logic;
--   signal Omux1SEL_rout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS_PROCESSOR PORT MAP (
          Oprogram_counter => Oprogram_counter,
          Opctopc => Opctopc,
          Oprogram_counter4 => Oprogram_counter4,
          Oinstruction_routing => Oinstruction_routing,
          Omux1_out => Omux1_out,
          Ojump_address1 => Ojump_address1,
          Ojump_address2 => Ojump_address2,
          Osign_extend_branch => Osign_extend_branch,
          Obranch_add => Obranch_add,
          Oregdst_rout => Oregdst_rout,
          ORegWrite_rout => ORegWrite_rout,
          Ojump_rout => Ojump_rout,
          Omemtoreg_rout => Omemtoreg_rout,
          Omemtoread_rout => Omemtoread_rout,
          Omemwrite_rout => Omemwrite_rout,
          OALU_OP_rout => OALU_OP_rout,
          OALU_control_rout => OALU_control_rout,
          Oalusrc_rout => Oalusrc_rout,
          Oread_data2 => Oread_data2,
          Oread_data1 => Oread_data1,
          OALu1 => OALu1,
          OALU2 => OALU2,
          Owritedata_rout => Owritedata_rout,
          Oaluresult_rout => Oaluresult_rout,
          Oread_data_Dmem_rout => Oread_data_Dmem_rout,
          Oaluaddresult_rout => Oaluaddresult_rout,
          Omx1tomx2 => Omx1tomx2,
          Obranch_rout => Obranch_rout,
          Ozero_rout => Ozero_rout,
          Omux1SEL_rout => Omux1SEL_rout,
          clk => clk,
          reset => reset
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

      --reset <= '1';
		
		--wait for clk_period;
		--reset <= '0';

      wait;
   end process;

END;
