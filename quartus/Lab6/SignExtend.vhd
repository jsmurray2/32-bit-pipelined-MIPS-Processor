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
-- CREATED		"Fri Nov 15 09:29:13 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SignExtend IS 
	PORT
	(
		Instruction :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Extend :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SignExtend;

ARCHITECTURE bdf_type OF SignExtend IS 

SIGNAL	Extend_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



Extend_ALTERA_SYNTHESIZED(31) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(30) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(21) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(20) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(19) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(18) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(17) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(16) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(29) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(28) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(27) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(26) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(25) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(24) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(23) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(22) <= Instruction(15) AND Instruction(15);


Extend_ALTERA_SYNTHESIZED(15 DOWNTO 0) <= Instruction AND Instruction;

Extend <= Extend_ALTERA_SYNTHESIZED;

END bdf_type;