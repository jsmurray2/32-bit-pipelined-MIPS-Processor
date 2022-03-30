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
-- CREATED		"Sat Dec 07 23:19:13 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Fourbitreg IS 
	PORT
	(
		Clock :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		Data :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Outpt :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Fourbitreg;

ARCHITECTURE bdf_type OF Fourbitreg IS 

SIGNAL	clk :  STD_LOGIC;
SIGNAL	CLR :  STD_LOGIC;
SIGNAL	d :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	EN :  STD_LOGIC;
SIGNAL	PRN :  STD_LOGIC;
SIGNAL	q :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(3) <= '0';
ELSIF (PRN = '0') THEN
	q(3) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(3) <= d(3);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(1) <= '0';
ELSIF (PRN = '0') THEN
	q(1) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(1) <= d(1);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(2) <= '0';
ELSIF (PRN = '0') THEN
	q(2) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(2) <= d(2);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(0) <= '0';
ELSIF (PRN = '0') THEN
	q(0) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(0) <= d(0);
	END IF;
END IF;
END PROCESS;


Outpt <= q;
CLR <= CLRN;
d <= Data;
clk <= Clock;
EN <= enable;

PRN <= '1';
END bdf_type;