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
-- CREATED		"Fri Oct 25 10:19:04 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reg32bit IS 
	PORT
	(
		Clock :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Q :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END reg32bit;

ARCHITECTURE bdf_type OF reg32bit IS 

SIGNAL	c :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	clk :  STD_LOGIC;
SIGNAL	CLR :  STD_LOGIC;
SIGNAL	EN :  STD_LOGIC;
SIGNAL	PRN :  STD_LOGIC;
SIGNAL	q_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(31) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(31) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(31) <= D(31);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(30) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(30) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(30) <= D(30);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(21) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(21) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(21) <= D(21);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(20) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(20) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(20) <= D(20);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(19) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(19) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(19) <= D(19);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(18) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(18) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(18) <= D(18);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(17) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(17) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(17) <= D(17);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(16) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(16) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(16) <= D(16);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(15) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(15) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(15) <= D(15);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(14) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(14) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(14) <= D(14);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(13) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(13) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(13) <= D(13);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(12) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(12) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(12) <= D(12);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(29) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(29) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(29) <= D(29);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(11) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(11) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(11) <= D(11);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(10) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(10) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(10) <= D(10);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(9) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(9) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(9) <= D(9);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(8) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(8) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(8) <= D(8);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(7) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(7) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(7) <= D(7);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(6) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(6) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(6) <= D(6);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(5) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(5) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(5) <= D(5);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(4) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(4) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(4) <= D(4);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(3) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(3) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(3) <= D(3);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(2) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(2) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(2) <= D(2);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(28) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(28) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(28) <= D(28);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(1) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(1) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(1) <= D(1);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(0) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(0) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(0) <= D(0);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(27) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(27) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(27) <= D(27);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(26) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(26) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(26) <= D(26);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(25) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(25) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(25) <= D(25);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(24) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(24) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(24) <= D(24);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(23) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(23) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(23) <= D(23);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q_ALTERA_SYNTHESIZED(22) <= '0';
ELSIF (PRN = '0') THEN
	q_ALTERA_SYNTHESIZED(22) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q_ALTERA_SYNTHESIZED(22) <= D(22);
	END IF;
END IF;
END PROCESS;


Q <= q_ALTERA_SYNTHESIZED;
CLR <= CLRN;
clk <= Clock;
EN <= enable;

PRN <= '1';
END bdf_type;