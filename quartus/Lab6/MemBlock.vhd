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
-- CREATED		"Fri Sep 06 09:50:21 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY MemBlock IS 
	PORT
	(
		MemWrite :  IN  STD_LOGIC;
		MemRead :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		Address :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		WriteData :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ReadData :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END MemBlock;

ARCHITECTURE bdf_type OF MemBlock IS 

COMPONENT mem1p128w32b
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_testMem : mem1p128w32b
PORT MAP(wren => MemWrite,
		 rden => MemRead,
		 clock => clk,
		 address => Address,
		 data => WriteData,
		 q => ReadData);


END bdf_type;