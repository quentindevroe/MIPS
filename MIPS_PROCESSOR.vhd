----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 			
-- 
-- Create Date:    10:03:37 10/13/2015 
-- Design Name: 
-- Module Name:    MIPS_PROCESSOR - Behavioral 
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

entity MIPS_PROCESSOR is
 port (
 
 
--	 Oprogram_counter 		:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Opctopc 					:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oprogram_counter4 	:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oinstruction_routing :out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Omux1_out 				:out STD_LOGIC_VECTOR(4 downto 0 ) ;
--	 Ojump_address1 		:out STD_LOGIC_VECTOR( 27 downto 0 );
--	 Ojump_address2			:out STD_LOGIC_VECTOR( 31 downto 0 );
--	 Osign_extend_branch 	:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Obranch_add 			:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oregdst_rout			:out STD_LOGIC;
--	 ORegWrite_rout			:out STD_LOGIC;
--	 Ojump_rout				:out STD_LOGIC;
--	 Omemtoreg_rout      	:out STD_LOGIC;
--	 Omemtoread_rout      :out STD_LOGIC;
--	 Omemwrite_rout      	:out STD_LOGIC;
--	 OALU_OP_rout 			:out STD_LOGIC_VECTOR(1 downto 0 ) ;
--	 OALU_control_rout 	:out STD_LOGIC_VECTOR(3 downto 0 ) ;
--	 Oalusrc_rout			:out STD_LOGIC;
--	 Oread_data2				:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oread_data1				:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 OALu1						:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 OALU2						:out STD_LOGIC_VECTOR(31 downto 0 ) ;
	 Owritedata_rout		:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oaluresult_rout		:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oread_data_Dmem_rout	:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Oaluaddresult_rout	:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Omx1tomx2				:out STD_LOGIC_VECTOR(31 downto 0 ) ;
--	 Obranch_rout   	   :out STD_LOGIC;
--	 Ozero_rout      		:out STD_LOGIC;
--	 Omux1SEL_rout      	:out STD_LOGIC;
 
 
 
 
 
	 clk : IN STD_LOGIC;
	 reset : IN STD_LOGIC
	  );
end MIPS_PROCESSOR;
----------------------------------------------------------------------------------

architecture Behavioral of MIPS_PROCESSOR is

---------------------------------------------------------------------------------- 
	 component PC
	 port (
			 Clk : IN STD_LOGIC;
			 Reset : IN STD_LOGIC;
			 PC_IN: IN STD_LOGIC_VECTOR(31 downto 0 ) ;
			 PC_OUT: OUT STD_LOGIC_VECTOR(31 downto 0)
			);
	 end component;
----------------------------------------------------------------------------------	 	 
	 component IMem
	 port (
			 Clk: IN STD_LOGIC;
			 PC: IN STD_LOGIC_VECTOR(31 downto 0 ) ;
			 Instruction : OUT STD_LOGIC_VECTOR(31 downto 0)
			 );
	 end component;
----------------------------------------------------------------------------------	 
	 component PCA
	 port (
			 PC_IN: IN STD_LOGIC_VECTOR(31 downto 0 ) ;
			 PC_OUT: OUT STD_LOGIC_VECTOR(31 downto 0)
			 );
	 end component;
----------------------------------------------------------------------------------
	component RegisterFile
	port (	
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
	end component;
----------------------------------------------------------------------------------
	component MUX
	generic(
		width: INTEGER	:=5
		);
	port(
		INPUT_0: 	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		INPUT_1:		IN		STD_LOGIC_VECTOR(width-1 downto 0);
		OUTPUT:		OUT	STD_LOGIC_VECTOR(width-1 downto 0);
		SELECTOR:	IN		STD_LOGIC
		);		
	end component;
----------------------------------------------------------------------------------
	component ControlUnit
	Port ( 
		inst : 	in  STD_LOGIC_VECTOR (5 downto 0);
      Regdst : 	out  STD_LOGIC;
      Branch : 	out  STD_LOGIC;
      MemRead : out  STD_LOGIC;
      MemToReg : out  STD_LOGIC;
      AluOp : out  STD_LOGIC_VECTOR (1 downto 0);
      MemWrite : out  STD_LOGIC;
      AluSrc : out  STD_LOGIC;
		Jump : out  STD_LOGIC;
      RegWrite : out  STD_LOGIC
		);
	end component;
----------------------------------------------------------------------------------
	component DMem
	Port (  
		Clk			: in STD_LOGIC;
		memwrite 	: in  STD_LOGIC;
		memread 		: in  STD_LOGIC;
		address 		: in  STD_LOGIC_VECTOR (31 downto 0);
		writedata 	: in  STD_LOGIC_VECTOR (31 downto 0);
		readdata 	: out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
----------------------------------------------------------------------------------
	component SignExtend
	Port (
			INPUT : in  STD_LOGIC_VECTOR (15 downto 0);
         OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
----------------------------------------------------------------------------------	
	component ShiftLeft
	generic(
		N: INTEGER	:=1;
		width: INTEGER :=8
			); 
	port(
		Input:	IN		STD_LOGIC_VECTOR(width-1 downto 0);
		Output:	OUT	STD_LOGIC_VECTOR(width-1 downto 0)
		);
	end component;
----------------------------------------------------------------------------------	
	component ALU
	Port ( clk : in  STD_LOGIC;
           ALUControl : in  STD_LOGIC_VECTOR (3 downto 0);
           data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC;
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
----------------------------------------------------------------------------------	
	component aluControl
	Port ( ALUOP : in  STD_LOGIC_VECTOR (1 downto 0);
           functField : in  STD_LOGIC_VECTOR (5 downto 0);
			  OPCode : in STD_LOGIC_VECTOR ( 5 downto 0 );
           ALUControl : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
----------------------------------------------------------------------------------
component add
 Port ( current_address : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_add : in  STD_LOGIC_VECTOR (31 downto 0);
           jump_address : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
----------------------------------------------------------------------------------
	component jumpaddressmerge
	Port ( current_address : in  STD_LOGIC_VECTOR (27 downto 0);
           vier : in  STD_LOGIC_VECTOR (3 downto 0);
           new_address : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	
	
	
	
	
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
	
	signal program_counter 		:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal pctopc 					:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal program_counter4 	:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal instruction_routing :STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal mux1_out 				:STD_LOGIC_VECTOR(4 downto 0 ) ;
	signal jump_address1 		:STD_LOGIC_VECTOR( 27 downto 0 );
	signal jump_address2			:STD_LOGIC_VECTOR( 31 downto 0 );
	signal sign_extend_branch 	:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal branch_add 			:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal regdst_rout			:STD_LOGIC;
	signal RegWrite_rout			:STD_LOGIC;
	signal jump_rout				:STD_LOGIC;
	signal memtoreg_rout      	:STD_LOGIC;
	signal memtoread_rout      :STD_LOGIC;
	signal memwrite_rout      	:STD_LOGIC;
	signal ALU_OP_rout 			:STD_LOGIC_VECTOR(1 downto 0 ) ;
	signal ALU_control_rout 	:STD_LOGIC_VECTOR(3 downto 0 ) ;
	signal alusrc_rout			:STD_LOGIC;
	signal read_data2				:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal read_data1				:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal ALu1						:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal ALU2						:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal writedata_rout		:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal aluresult_rout		:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal read_data_Dmem_rout	:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal aluaddresult_rout	:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal mx1tomx2				:STD_LOGIC_VECTOR(31 downto 0 ) ;
	signal branch_rout   	   :STD_LOGIC;
	signal zero_rout      		:STD_LOGIC;
	signal mux1SEL_rout      	:STD_LOGIC;
----------------------------------------------------------------------------------	
	begin
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------	
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------



--	 Oprogram_counter 		<=	program_counter;
--	 Opctopc 					<=	pctopc;
--	 Oprogram_counter4 	<=	program_counter4;
--	 Oinstruction_routing <=	instruction_routing;
--	 Omux1_out 				<=	mux1_out;
--	 Ojump_address1 		<=	jump_address1;
--	 Ojump_address2			<=	jump_address2;
--	 Osign_extend_branch 	<=	sign_extend_branch;
--	 Obranch_add 			<=	branch_add;
--	 Oregdst_rout			<=	regdst_rout;
--	 ORegWrite_rout			<=	RegWrite_rout;
--	 Ojump_rout				<=	jump_rout;
--	 Omemtoreg_rout    	<= memtoreg_rout	;
--	 Omemtoread_rout    	<= memtoread_rout;
--	 Omemwrite_rout      	<= memwrite_rout	;
--	 OALU_OP_rout 			<= ALU_OP_rout;
--	 OALU_control_rout 	<=	ALU_control_rout;
--	 Oalusrc_rout			<=	alusrc_rout;
--	 Oread_data2				<=	read_data2;
--	 OALu1						<=	ALu1;
--	 OALU2						<=	ALU2;
	 Owritedata_rout		<=	writedata_rout;
--	 Oaluresult_rout		<=	aluresult_rout;
--	 Oread_data_Dmem_rout	<=	read_data_Dmem_rout;
--	 Oaluaddresult_rout	<=	aluaddresult_rout;
--	 Omx1tomx2				<=	mx1tomx2;
--	 Obranch_rout   	  	<=	branch_rout;
--	 Ozero_rout      		<=	zero_rout;
--	 Omux1SEL_rout      	<=	mux1SEL_rout;
 


	
----------------------------------------------------------------------------------




----------------------------------------------------------------------------------
	PCounter :PC port map(
		 Clk=>clk,
		 Reset=>reset,
		 PC_OUT=>program_counter,
		 PC_IN=>pctopc
	 );
----------------------------------------------------------------------------------
	InstructionMem : IMem port map(
		 Clk=>clk,
		 PC=>program_counter,
		 Instruction=>instruction_routing
	 );
----------------------------------------------------------------------------------
dataMem : DMem port map(
				Clk		=>clk,
				memwrite =>memwrite_rout,	
				memread 	=>memtoread_rout,
				address 	=>aluresult_rout,
				writedata=>read_data2, 
				readdata =>read_data_Dmem_rout	
);
----------------------------------------------------------------------------------
	PCAdder :PCA port map(
		 PC_IN=>program_counter ,
		 PC_OUT=>program_counter4
	 );
----------------------------------------------------------------------------------	 
	 
----------------------------------------------------------------------------------
	RegFile :RegisterFile port map(
	Clk=>clk,
	Read_Register_1=>instruction_routing(25 downto 21),
	Read_Register_2=>instruction_routing(20 downto 16),
	Write_Register=>mux1_out,
	RegWrite=>RegWrite_rout,
	write_data=>	writedata_rout,	
	read_data_1=>alu1,
	read_data_2=>READ_DATA2	
	);
----------------------------------------------------------------------------------
	Mux3 :MUX 	generic map ( width => 5)
					port map(
	INPUT_0=>instruction_routing(20 downto 16), 	
	INPUT_1=>instruction_routing(15 downto 11),		
	OUTPUT=>mux1_out,	
	SELECTOR=>	regdst_rout
	);
----------------------------------------------------------------------------------
	ShiftJump : ShiftLeft 
	generic map(
		N=>2,
		width=>28
		)
	port map(
		Input=>instruction_routing(27 downto 0),
		Output=>jump_address1
		);
----------------------------------------------------------------------------------
	ShiftBranch : ShiftLeft 
	generic map(
		N=>2,
		width=>32
		) 
	port map(
		Input=>sign_extend_branch,
		Output=>branch_add
		);
----------------------------------------------------------------------------------
	SignExtend_i :SignExtend
	port map(
			INPUT => instruction_routing(15 downto 0),
         OUTPUT => sign_extend_branch
			);
----------------------------------------------------------------------------------
	Control_Unit: ControlUnit 
	Port map( 
		inst => instruction_routing(31 downto 26),
      Regdst => regdst_rout,
      Branch =>branch_rout,
      MemRead =>memtoread_rout,
      MemToReg=> memtoreg_rout,
      AluOp => alu_op_rout,
      MemWrite =>memwrite_rout,
      AluSrc => alusrc_rout,
		Jump =>jump_rout,
      RegWrite =>RegWrite_rout
		);
		
----------------------------------------------------------------------------------
	ALU_control : alucontrol
	Port map(  
				ALUOP => alu_op_rout,
				functField=> instruction_routing(5 downto 0),
				OPCode =>instruction_routing(31 downto 26),
				ALUControl=>ALU_control_rout
			);

----------------------------------------------------------------------------------
ALU_core : ALU
Port map( clk => clk,
           ALUControl =>ALU_control_rout,
           data1 =>alu1,
           data2 =>alu2,
           zero 	=> zero_rout,
           aluResult => aluresult_rout
			);

----------------------------------------------------------------------------------
	Mux4 :MUX 	generic map ( width => 32)
					port map(
	INPUT_0=> read_data2,	
	INPUT_1=>sign_extend_branch,		
	OUTPUT=>alu2,	
	SELECTOR=>	alusrc_rout
	);
----------------------------------------------------------------------------------
Mux5 :MUX 	generic map ( width => 32)
					port map(
	INPUT_0=> aluresult_rout,
	INPUT_1=> read_data_Dmem_rout,
	OUTPUT=>writedata_rout,
	SELECTOR=>	memtoreg_rout
	);
----------------------------------------------------------------------------------
Mux1 :MUX 	generic map ( width => 32)
					port map(
	INPUT_0=> program_counter4,
	INPUT_1=> aluaddresult_rout,
	OUTPUT=>mx1tomx2,
	SELECTOR=>mux1SEL_rout	
	);
----------------------------------------------------------------------------------
Mux2 :MUX 	generic map ( width => 32)
					port map(
	INPUT_0=> mx1tomx2,
	INPUT_1=> jump_address2,
	OUTPUT=>pctopc,
	SELECTOR=> jump_rout	
	);	
----------------------------------------------------------------------------------
merch : jumpaddressmerge
port map (
				current_address =>jump_address1,
				vier =>program_counter4(31 downto 28),
				new_address =>jump_address2
			  );
----------------------------------------------------------------------------------
add_branch : add
port map (
				current_address =>program_counter4,
				jump_add =>branch_add,
				jump_address =>aluaddresult_rout
);


----------------------------------------------------------------------------------
			mux1SEL_rout<=branch_rout and zero_rout;
----------------------------------------------------------------------------------			
end Behavioral;
