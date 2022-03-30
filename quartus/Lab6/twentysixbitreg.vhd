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
-- CREATED		"Sat Dec 07 20:48:40 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY twentysixbitreg IS 
	PORT
	(
		Clock :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		Data :  IN  STD_LOGIC_VECTOR(26 DOWNTO 0);
		Outpt :  OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	);
END twentysixbitreg;

ARCHITECTURE bdf_type OF twentysixbitreg IS 

SIGNAL	clk :  STD_LOGIC;
SIGNAL	CLR :  STD_LOGIC;
SIGNAL	d :  STD_LOGIC_VECTOR(26 DOWNTO 0);
SIGNAL	EN :  STD_LOGIC;
SIGNAL	PRN :  STD_LOGIC;
SIGNAL	q :  STD_LOGIC_VECTOR(26 DOWNTO 0);


BEGIN 



PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(26) <= '0';
ELSIF (PRN = '0') THEN
	q(26) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(26) <= d(26);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(19) <= '0';
ELSIF (PRN = '0') THEN
	q(19) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(19) <= d(19);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(10) <= '0';
ELSIF (PRN = '0') THEN
	q(10) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(10) <= d(10);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(4) <= '0';
ELSIF (PRN = '0') THEN
	q(4) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(4) <= d(4);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(23) <= '0';
ELSIF (PRN = '0') THEN
	q(23) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(23) <= d(23);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(16) <= '0';
ELSIF (PRN = '0') THEN
	q(16) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(16) <= d(16);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(9) <= '0';
ELSIF (PRN = '0') THEN
	q(9) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(9) <= d(9);
	END IF;
END IF;
END PROCESS;


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
	q(22) <= '0';
ELSIF (PRN = '0') THEN
	q(22) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(22) <= d(22);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(15) <= '0';
ELSIF (PRN = '0') THEN
	q(15) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(15) <= d(15);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(8) <= '0';
ELSIF (PRN = '0') THEN
	q(8) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(8) <= d(8);
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
	q(12) <= '0';
ELSIF (PRN = '0') THEN
	q(12) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(12) <= d(12);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(21) <= '0';
ELSIF (PRN = '0') THEN
	q(21) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(21) <= d(21);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(14) <= '0';
ELSIF (PRN = '0') THEN
	q(14) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(14) <= d(14);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(7) <= '0';
ELSIF (PRN = '0') THEN
	q(7) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(7) <= d(7);
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
	q(20) <= '0';
ELSIF (PRN = '0') THEN
	q(20) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(20) <= d(20);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(13) <= '0';
ELSIF (PRN = '0') THEN
	q(13) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(13) <= d(13);
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


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(6) <= '0';
ELSIF (PRN = '0') THEN
	q(6) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(6) <= d(6);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(25) <= '0';
ELSIF (PRN = '0') THEN
	q(25) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(25) <= d(25);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(18) <= '0';
ELSIF (PRN = '0') THEN
	q(18) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(18) <= d(18);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(11) <= '0';
ELSIF (PRN = '0') THEN
	q(11) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(11) <= d(11);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(5) <= '0';
ELSIF (PRN = '0') THEN
	q(5) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(5) <= d(5);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(24) <= '0';
ELSIF (PRN = '0') THEN
	q(24) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(24) <= d(24);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,CLR,PRN)
BEGIN
IF (CLR = '0') THEN
	q(17) <= '0';
ELSIF (PRN = '0') THEN
	q(17) <= '1';
ELSIF (RISING_EDGE(clk)) THEN
	IF (EN = '1') THEN
	q(17) <= d(17);
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