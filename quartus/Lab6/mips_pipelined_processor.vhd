-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.1 Build 646 04/11/2019 SJ Lite Edition"
-- CREATED		"Tue Dec 10 14:04:56 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mips_pipelined_processor IS 
	PORT
	(
		MIPSclock :  IN  STD_LOGIC;
		reset_n :  IN  STD_LOGIC;
		Writedata :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DMemWren :  OUT  STD_LOGIC;
		RegDst :  OUT  STD_LOGIC;
		ALUSrc :  OUT  STD_LOGIC;
		MemToReg :  OUT  STD_LOGIC;
		RegWrite :  OUT  STD_LOGIC;
		MemRead :  OUT  STD_LOGIC;
		MemWrite :  OUT  STD_LOGIC;
		Branch :  OUT  STD_LOGIC;
		Jump :  OUT  STD_LOGIC;
		WriteEnable :  OUT  STD_LOGIC;
		ALUMUXbvalue :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALUOP :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUResult :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		datamemoryMuxout :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DataMemOut :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DMemAddress :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 2);
		DMemData :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		InstructionMemOut :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		PCValue :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ReadData1Out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ReadData2Out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		RegFileData :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		RegisterAddress :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END mips_pipelined_processor;

ARCHITECTURE bdf_type OF mips_pipelined_processor IS 

COMPONENT \32bitalu\
	PORT(controla : IN STD_LOGIC;
		 controlb : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 controlop : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 cout : OUT STD_LOGIC;
		 zflag : OUT STD_LOGIC;
		 NFlag : OUT STD_LOGIC;
		 overflow : OUT STD_LOGIC;
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alucontrol
	PORT(ALUOP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Func : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 Ainvert : OUT STD_LOGIC;
		 Binvert : OUT STD_LOGIC;
		 Operation : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT thirtytwobitmux
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg32bit
	PORT(Clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT thirtytwobaddbranch
	PORT(dataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT branchshift
	PORT(data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 distance : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT constant4
	PORT(		 result : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT globalcontrol
	PORT(OP : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 RegDst : OUT STD_LOGIC;
		 ALUSrc : OUT STD_LOGIC;
		 MemToReg : OUT STD_LOGIC;
		 RegWrite : OUT STD_LOGIC;
		 MemRead : OUT STD_LOGIC;
		 MemWrite : OUT STD_LOGIC;
		 Branch : OUT STD_LOGIC;
		 Jump : OUT STD_LOGIC;
		 ALUOP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT datamemory
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fivebitreg
	PORT(Clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 Data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Outpt : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT imemresetmux
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem1p128w32b
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT jumpshift
	PORT(Instruct : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		 OutSign : OUT STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END COMPONENT;

COMPONENT threebitreg
	PORT(Clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 Data : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Outpt : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT thirtytwobpcadd
	PORT(dataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT regfile32
	PORT(clk : IN STD_LOGIC;
		 reset0 : IN STD_LOGIC;
		 writeEn : IN STD_LOGIC;
		 Read1Register : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Read2Register : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 WriteData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 WriteReg : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Read1Data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Read2Data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT regfilemux
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT signextend
	PORT(Instruction : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Extend : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT twobitreg
	PORT(Clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 Data : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Outpt : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ALUa :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	alurslt :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	dmemin :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	dmemout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	EX :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	EXout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	extend :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	filewrite :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Instruction :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ju :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	jumpout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	MemoryControl :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	MIPS :  STD_LOGIC;
SIGNAL	mout :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	Mreg :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	PCAdd :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCAddress :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCfour :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	pcmuxout :  STD_LOGIC_VECTOR(8 DOWNTO 2);
SIGNAL	pcplus :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCreturn :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rdtwo :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	regmuxfinal :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	regmuxout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	reset :  STD_LOGIC;
SIGNAL	result :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	wbin :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	wbout :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	wdata :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	Zero :  STD_LOGIC;
SIGNAL	zerobranch :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(0 TO 6);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 
ALUMUXbvalue <= SYNTHESIZED_WIRE_3;
DataMemOut <= SYNTHESIZED_WIRE_16;
InstructionMemOut <= SYNTHESIZED_WIRE_19;
ReadData1Out <= SYNTHESIZED_WIRE_25;
ReadData2Out <= SYNTHESIZED_WIRE_27;
SYNTHESIZED_WIRE_6 <= '1';
SYNTHESIZED_WIRE_7 <= '1';
SYNTHESIZED_WIRE_11 <= '1';
SYNTHESIZED_WIRE_14 <= '1';
SYNTHESIZED_WIRE_17 <= '1';
SYNTHESIZED_WIRE_18 <= '1';
SYNTHESIZED_WIRE_20 <= '1';
SYNTHESIZED_WIRE_21 <= '1';
SYNTHESIZED_WIRE_22 <= '1';
SYNTHESIZED_WIRE_24 <= '1';
SYNTHESIZED_WIRE_26 <= '1';
SYNTHESIZED_WIRE_28 <= '1';
SYNTHESIZED_WIRE_30 <= '1';
SYNTHESIZED_WIRE_31 <= "0000000";
SYNTHESIZED_WIRE_32 <= '0';
SYNTHESIZED_WIRE_33 <= '1';
SYNTHESIZED_WIRE_34 <= '1';
SYNTHESIZED_WIRE_35 <= '1';
SYNTHESIZED_WIRE_36 <= '1';
SYNTHESIZED_WIRE_37 <= '1';
SYNTHESIZED_WIRE_38 <= '1';
SYNTHESIZED_WIRE_39 <= '1';
SYNTHESIZED_WIRE_40 <= '1';
SYNTHESIZED_WIRE_41 <= '1';
SYNTHESIZED_WIRE_44 <= '1';
SYNTHESIZED_WIRE_45 <= '1';
SYNTHESIZED_WIRE_47 <= '1';



b2v_alu : \32bitalu\
PORT MAP(controla => SYNTHESIZED_WIRE_0,
		 controlb => SYNTHESIZED_WIRE_49,
		 cin => SYNTHESIZED_WIRE_49,
		 a => ALUa,
		 b => SYNTHESIZED_WIRE_3,
		 controlop => SYNTHESIZED_WIRE_4,
		 zflag => SYNTHESIZED_WIRE_5,
		 result => alurslt);


b2v_alucontrol : alucontrol
PORT MAP(ALUOP => EXout(1 DOWNTO 0),
		 Func => extend(5 DOWNTO 0),
		 Ainvert => SYNTHESIZED_WIRE_0,
		 Binvert => SYNTHESIZED_WIRE_49,
		 Operation => SYNTHESIZED_WIRE_4);


PROCESS(MIPS,reset,SYNTHESIZED_WIRE_6)
BEGIN
IF (reset = '0') THEN
	Zero <= '0';
ELSIF (SYNTHESIZED_WIRE_6 = '0') THEN
	Zero <= '1';
ELSIF (RISING_EDGE(MIPS)) THEN
	Zero <= SYNTHESIZED_WIRE_5;
END IF;
END PROCESS;


b2v_ALUMux : thirtytwobitmux
PORT MAP(sel => EXout(2),
		 data0x => rdtwo,
		 data1x => extend,
		 result => SYNTHESIZED_WIRE_3);


b2v_ALUreslt : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_7,
		 CLRN => reset,
		 D => alurslt,
		 Q => result);


ju(31 DOWNTO 28) <= PCfour(31 DOWNTO 28) AND PCfour(31 DOWNTO 28);


zerobranch <= mout(0) AND Zero;


b2v_Branchadd : thirtytwobaddbranch
PORT MAP(dataa => PCAdd,
		 datab => SYNTHESIZED_WIRE_8,
		 result => SYNTHESIZED_WIRE_12);


b2v_BranchMux1 : thirtytwobitmux
PORT MAP(sel => zerobranch,
		 data0x => pcplus,
		 data1x => SYNTHESIZED_WIRE_9,
		 result => SYNTHESIZED_WIRE_10);


b2v_BranchMux2 : thirtytwobitmux
PORT MAP(sel => EXout(4),
		 data0x => SYNTHESIZED_WIRE_10,
		 data1x => jumpout,
		 result => PCreturn);


b2v_branchreg : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_11,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_12,
		 Q => SYNTHESIZED_WIRE_9);


b2v_branchshifter : branchshift
PORT MAP(data => extend,
		 distance => SYNTHESIZED_WIRE_13,
		 result => SYNTHESIZED_WIRE_8);


b2v_const2 : constant4
PORT MAP(		 result => SYNTHESIZED_WIRE_13);


b2v_control : globalcontrol
PORT MAP(OP => Instruction(31 DOWNTO 26),
		 RegDst => EX(3),
		 ALUSrc => EX(2),
		 MemToReg => wbin(1),
		 RegWrite => wbin(0),
		 MemRead => Mreg(2),
		 MemWrite => Mreg(1),
		 Branch => Mreg(0),
		 Jump => EX(4),
		 ALUOP => EX(1 DOWNTO 0));


b2v_Dmemory : datamemory
PORT MAP(wren => MemoryControl(1),
		 rden => MemoryControl(2),
		 clock => MIPS,
		 data => rdtwo,
		 rdaddress => alurslt(8 DOWNTO 2),
		 wraddress => alurslt(8 DOWNTO 2),
		 q => SYNTHESIZED_WIRE_29);


b2v_dmemorydatareg : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_14,
		 CLRN => reset,
		 D => dmemin);


b2v_dtatoutmux : thirtytwobitmux
PORT MAP(sel => wbout(1),
		 data0x => SYNTHESIZED_WIRE_15,
		 data1x => SYNTHESIZED_WIRE_16,
		 result => filewrite);


b2v_Exreg : fivebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_17,
		 CLRN => reset,
		 Data => EX,
		 Outpt => EXout);


b2v_IFIDIMem : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_18,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_19,
		 Q => Instruction);


b2v_IFIDIMem10 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_20,
		 CLRN => reset,
		 D => PCfour,
		 Q => PCAdd);


b2v_IFIDIMem2 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_21,
		 CLRN => reset,
		 D => pcplus,
		 Q => PCfour);


b2v_IFIDIMem3 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_22,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_23,
		 Q => extend);


b2v_IFIDIMem4 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_24,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_25,
		 Q => ALUa);


b2v_IFIDIMem5 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_26,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_27,
		 Q => rdtwo);


b2v_IFIDIMem6 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_28,
		 CLRN => reset,
		 D => SYNTHESIZED_WIRE_29,
		 Q => SYNTHESIZED_WIRE_16);


b2v_IFIDIMem7 : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_30,
		 CLRN => reset,
		 D => result,
		 Q => SYNTHESIZED_WIRE_15);



b2v_Imemreset : imemresetmux
PORT MAP(sel => reset,
		 data0x => SYNTHESIZED_WIRE_31,
		 data1x => PCAddress(8 DOWNTO 2),
		 result => pcmuxout);
























b2v_instructionmem : mem1p128w32b
PORT MAP(wren => SYNTHESIZED_WIRE_32,
		 rden => SYNTHESIZED_WIRE_33,
		 clock => MIPS,
		 address => pcmuxout,
		 data => Writedata,
		 q => SYNTHESIZED_WIRE_19);


b2v_jmpshifter : jumpshift
PORT MAP(Instruct => Instruction(25 DOWNTO 0),
		 OutSign => ju(27 DOWNTO 0));


b2v_jumpreg : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_34,
		 CLRN => reset,
		 D => ju,
		 Q => jumpout);


b2v_Mreg1 : threebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_35,
		 CLRN => reset,
		 Data => Mreg,
		 Outpt => MemoryControl);


b2v_mreg2 : threebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_36,
		 CLRN => reset,
		 Data => MemoryControl,
		 Outpt => mout);


b2v_PC : reg32bit
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_37,
		 CLRN => reset,
		 D => PCreturn,
		 Q => PCAddress);


b2v_pcplus4 : thirtytwobpcadd
PORT MAP(dataa => PCAddress,
		 result => pcplus);



b2v_regdstmux1 : fivebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_38,
		 CLRN => reset,
		 Data => Instruction(15 DOWNTO 11),
		 Outpt => SYNTHESIZED_WIRE_43);


b2v_regdstmux2 : fivebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_39,
		 CLRN => reset,
		 Data => Instruction(20 DOWNTO 16),
		 Outpt => SYNTHESIZED_WIRE_42);


b2v_regfile : regfile32
PORT MAP(clk => MIPS,
		 reset0 => reset,
		 writeEn => wbout(0),
		 Read1Register => Instruction(25 DOWNTO 21),
		 Read2Register => Instruction(20 DOWNTO 16),
		 WriteData => filewrite,
		 WriteReg => wdata,
		 Read1Data => SYNTHESIZED_WIRE_25,
		 Read2Data => SYNTHESIZED_WIRE_27);



b2v_regfilemux : fivebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_40,
		 CLRN => reset,
		 Data => regmuxfinal,
		 Outpt => wdata);


b2v_regfilemuxreg3 : fivebitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_41,
		 CLRN => reset,
		 Data => regmuxout,
		 Outpt => regmuxfinal);



b2v_regmux : regfilemux
PORT MAP(sel => EXout(3),
		 data0x => SYNTHESIZED_WIRE_42,
		 data1x => SYNTHESIZED_WIRE_43,
		 result => regmuxout);


b2v_signextend : signextend
PORT MAP(Instruction => Instruction(15 DOWNTO 0),
		 Extend => SYNTHESIZED_WIRE_23);



b2v_WB : twobitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_44,
		 CLRN => reset,
		 Data => wbin,
		 Outpt => SYNTHESIZED_WIRE_48);


b2v_WB2 : twobitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_45,
		 CLRN => reset,
		 Data => SYNTHESIZED_WIRE_46,
		 Outpt => wbout);


b2v_WBreg2 : twobitreg
PORT MAP(Clock => MIPS,
		 enable => SYNTHESIZED_WIRE_47,
		 CLRN => reset,
		 Data => SYNTHESIZED_WIRE_48,
		 Outpt => SYNTHESIZED_WIRE_46);

DMemWren <= MemoryControl(1);
MIPS <= MIPSclock;
reset <= reset_n;
RegDst <= EX(3);
ALUSrc <= EX(2);
MemToReg <= wbin(1);
RegWrite <= wbin(0);
MemRead <= Mreg(2);
MemWrite <= Mreg(1);
Branch <= Mreg(0);
Jump <= EX(4);
WriteEnable <= wbout(0);
ALUOP(1 DOWNTO 0) <= EX(1 DOWNTO 0);
ALUResult <= result;
datamemoryMuxout <= filewrite;
DMemAddress(8 DOWNTO 2) <= alurslt(8 DOWNTO 2);
DMemData <= rdtwo;
PCValue <= PCAddress;
RegFileData <= filewrite;
RegisterAddress <= wdata;

END bdf_type;