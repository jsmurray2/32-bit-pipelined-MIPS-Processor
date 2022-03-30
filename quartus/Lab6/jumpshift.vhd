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
-- CREATED		"Fri Dec 06 14:00:46 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY jumpshift IS 
	PORT
	(
		Instruct :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		OutSign :  OUT  STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END jumpshift;

ARCHITECTURE bdf_type OF jumpshift IS 

SIGNAL	sign :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	signout :  STD_LOGIC_VECTOR(27 DOWNTO 0);


BEGIN 





signout(27 DOWNTO 2) <= sign AND sign;

OutSign <= signout;
sign <= Instruct;

signout(1) <= '0';
signout(0) <= '0';
END bdf_type;