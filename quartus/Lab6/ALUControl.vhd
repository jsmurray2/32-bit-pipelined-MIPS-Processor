-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Mon Dec 09 00:14:31 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ALUControl IS 
	PORT
	(
		ALUOP :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Func :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		Ainvert :  OUT  STD_LOGIC;
		Binvert :  OUT  STD_LOGIC;
		Operation :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END ALUControl;

ARCHITECTURE bdf_type OF ALUControl IS 

SIGNAL	ALU :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Fnc :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	oper :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



oper(0) <= ALU(1) AND SYNTHESIZED_WIRE_0;


oper(1) <= NOT(Fnc(2) AND ALU(1));


SYNTHESIZED_WIRE_2 <= ALU(1) AND Fnc(1);


Ainvert <= ALU(0) AND SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_1 <= NOT(ALU(0));



Binvert <= SYNTHESIZED_WIRE_2 OR ALU(0);


SYNTHESIZED_WIRE_0 <= Fnc(0) OR Fnc(3);

ALU <= ALUOP;
Fnc <= Func;
Operation <= oper;

END bdf_type;