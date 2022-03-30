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
-- CREATED		"Tue Dec 10 12:54:43 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY GlobalControl IS 
	PORT
	(
		OP :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegDst :  OUT  STD_LOGIC;
		ALUSrc :  OUT  STD_LOGIC;
		MemToReg :  OUT  STD_LOGIC;
		RegWrite :  OUT  STD_LOGIC;
		MemRead :  OUT  STD_LOGIC;
		MemWrite :  OUT  STD_LOGIC;
		Branch :  OUT  STD_LOGIC;
		Jump :  OUT  STD_LOGIC;
		ALUOP :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END GlobalControl;

ARCHITECTURE bdf_type OF GlobalControl IS 

SIGNAL	ALU :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;


BEGIN 
MemToReg <= SYNTHESIZED_WIRE_27;
MemRead <= SYNTHESIZED_WIRE_27;
MemWrite <= SYNTHESIZED_WIRE_10;



SYNTHESIZED_WIRE_26 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2 AND OP(3) AND SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_4 <= NOT(OP(5));



SYNTHESIZED_WIRE_3 <= NOT(OP(4));



SYNTHESIZED_WIRE_0 <= NOT(OP(2));



SYNTHESIZED_WIRE_2 <= NOT(OP(1));



SYNTHESIZED_WIRE_1 <= NOT(OP(0));



SYNTHESIZED_WIRE_9 <= NOT(OP(5));



SYNTHESIZED_WIRE_7 <= NOT(OP(3));



SYNTHESIZED_WIRE_6 <= NOT(OP(1));



SYNTHESIZED_WIRE_5 <= NOT(OP(0));



ALU(0) <= OP(2) AND SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_7 AND SYNTHESIZED_WIRE_8 AND SYNTHESIZED_WIRE_9;


SYNTHESIZED_WIRE_8 <= NOT(OP(4));



ALUSrc <= SYNTHESIZED_WIRE_10 OR SYNTHESIZED_WIRE_26 OR SYNTHESIZED_WIRE_27;


RegWrite <= SYNTHESIZED_WIRE_26 OR SYNTHESIZED_WIRE_27 OR ALU(1);


SYNTHESIZED_WIRE_19 <= NOT(OP(5));



SYNTHESIZED_WIRE_18 <= NOT(OP(4));



SYNTHESIZED_WIRE_17 <= NOT(OP(3));



SYNTHESIZED_WIRE_15 <= NOT(OP(2));



SYNTHESIZED_WIRE_16 <= NOT(OP(0));



Jump <= SYNTHESIZED_WIRE_15 AND SYNTHESIZED_WIRE_16 AND OP(1) AND SYNTHESIZED_WIRE_17 AND SYNTHESIZED_WIRE_18 AND SYNTHESIZED_WIRE_19;


SYNTHESIZED_WIRE_27 <= SYNTHESIZED_WIRE_20 AND OP(0) AND OP(1) AND SYNTHESIZED_WIRE_21 AND SYNTHESIZED_WIRE_22 AND OP(5);


SYNTHESIZED_WIRE_22 <= NOT(OP(4));



SYNTHESIZED_WIRE_21 <= NOT(OP(3));



SYNTHESIZED_WIRE_20 <= NOT(OP(2));



ALU(1) <= NOT(OP(0) OR OP(2) OR OP(1) OR OP(3) OR OP(5) OR OP(4));


SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_23 AND OP(0) AND OP(1) AND OP(3) AND SYNTHESIZED_WIRE_24 AND OP(5);


SYNTHESIZED_WIRE_24 <= NOT(OP(4));



SYNTHESIZED_WIRE_23 <= NOT(OP(2));


RegDst <= ALU(1);
Branch <= ALU(0);
ALUOP <= ALU;

END bdf_type;