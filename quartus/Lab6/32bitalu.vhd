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
-- CREATED		"Fri Oct 04 11:29:13 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY \32bitalu\ IS 
	PORT
	(
		controla :  IN  STD_LOGIC;
		controlb :  IN  STD_LOGIC;
		cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		controlop :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		cout :  OUT  STD_LOGIC;
		overflow :  OUT  STD_LOGIC;
		zflag :  OUT  STD_LOGIC;
		NFlag :  OUT  STD_LOGIC;
		result :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END \32bitalu\;

ARCHITECTURE bdf_type OF \32bitalu\ IS 

COMPONENT onebitalu
	PORT(a : IN STD_LOGIC;
		 controla : IN STD_LOGIC;
		 less : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 controlb : IN STD_LOGIC;
		 controlop : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC;
		 set : OUT STD_LOGIC;
		 cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	cout_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	less :  STD_LOGIC;
SIGNAL	result_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	slt :  STD_LOGIC;
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
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;


BEGIN 



b2v_alu0 : onebitalu
PORT MAP(a => a(0),
		 controla => controla,
		 less => slt,
		 b => b(0),
		 cin => cin,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(0),
		 cout => SYNTHESIZED_WIRE_0);


b2v_alu1 : onebitalu
PORT MAP(a => a(1),
		 controla => controla,
		 less => less,
		 b => b(1),
		 cin => SYNTHESIZED_WIRE_0,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(1),
		 cout => SYNTHESIZED_WIRE_11);


b2v_alu10 : onebitalu
PORT MAP(a => a(10),
		 controla => controla,
		 less => less,
		 b => b(10),
		 cin => SYNTHESIZED_WIRE_1,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(10),
		 cout => SYNTHESIZED_WIRE_2);


b2v_alu11 : onebitalu
PORT MAP(a => a(11),
		 controla => controla,
		 less => less,
		 b => b(10),
		 cin => SYNTHESIZED_WIRE_2,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(11),
		 cout => SYNTHESIZED_WIRE_3);


b2v_alu12 : onebitalu
PORT MAP(a => a(12),
		 controla => controla,
		 less => less,
		 b => b(12),
		 cin => SYNTHESIZED_WIRE_3,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(12),
		 cout => SYNTHESIZED_WIRE_4);


b2v_alu13 : onebitalu
PORT MAP(a => a(13),
		 controla => controla,
		 less => less,
		 b => b(13),
		 cin => SYNTHESIZED_WIRE_4,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(13),
		 cout => SYNTHESIZED_WIRE_5);


b2v_alu14 : onebitalu
PORT MAP(a => a(14),
		 controla => controla,
		 less => less,
		 b => b(14),
		 cin => SYNTHESIZED_WIRE_5,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(14),
		 cout => SYNTHESIZED_WIRE_6);


b2v_alu15 : onebitalu
PORT MAP(a => a(15),
		 controla => controla,
		 less => less,
		 b => b(15),
		 cin => SYNTHESIZED_WIRE_6,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(15),
		 cout => SYNTHESIZED_WIRE_7);


b2v_alu16 : onebitalu
PORT MAP(a => a(16),
		 controla => controla,
		 less => less,
		 b => b(16),
		 cin => SYNTHESIZED_WIRE_7,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(16),
		 cout => SYNTHESIZED_WIRE_8);


b2v_alu17 : onebitalu
PORT MAP(a => a(17),
		 controla => controla,
		 less => less,
		 b => b(17),
		 cin => SYNTHESIZED_WIRE_8,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(17),
		 cout => SYNTHESIZED_WIRE_9);


b2v_alu18 : onebitalu
PORT MAP(a => a(18),
		 controla => controla,
		 less => less,
		 b => b(18),
		 cin => SYNTHESIZED_WIRE_9,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(18),
		 cout => SYNTHESIZED_WIRE_10);


b2v_alu19 : onebitalu
PORT MAP(a => a(19),
		 controla => controla,
		 less => less,
		 b => b(19),
		 cin => SYNTHESIZED_WIRE_10,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(19),
		 cout => SYNTHESIZED_WIRE_12);


b2v_alu2 : onebitalu
PORT MAP(a => a(2),
		 controla => controla,
		 less => less,
		 b => b(2),
		 cin => SYNTHESIZED_WIRE_11,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(2),
		 cout => SYNTHESIZED_WIRE_22);


b2v_alu20 : onebitalu
PORT MAP(a => a(20),
		 controla => controla,
		 less => less,
		 b => b(20),
		 cin => SYNTHESIZED_WIRE_12,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(20),
		 cout => SYNTHESIZED_WIRE_13);


b2v_alu21 : onebitalu
PORT MAP(a => a(21),
		 controla => controla,
		 less => less,
		 b => b(21),
		 cin => SYNTHESIZED_WIRE_13,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(21),
		 cout => SYNTHESIZED_WIRE_14);


b2v_alu22 : onebitalu
PORT MAP(a => a(22),
		 controla => controla,
		 less => less,
		 b => b(22),
		 cin => SYNTHESIZED_WIRE_14,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(22),
		 cout => SYNTHESIZED_WIRE_15);


b2v_alu23 : onebitalu
PORT MAP(a => a(23),
		 controla => controla,
		 less => less,
		 b => b(23),
		 cin => SYNTHESIZED_WIRE_15,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(23),
		 cout => SYNTHESIZED_WIRE_16);


b2v_alu24 : onebitalu
PORT MAP(a => a(24),
		 controla => controla,
		 less => less,
		 b => b(24),
		 cin => SYNTHESIZED_WIRE_16,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(24),
		 cout => SYNTHESIZED_WIRE_17);


b2v_alu25 : onebitalu
PORT MAP(a => a(25),
		 controla => controla,
		 less => less,
		 b => b(25),
		 cin => SYNTHESIZED_WIRE_17,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(25),
		 cout => SYNTHESIZED_WIRE_18);


b2v_alu26 : onebitalu
PORT MAP(a => a(26),
		 controla => controla,
		 less => less,
		 b => b(26),
		 cin => SYNTHESIZED_WIRE_18,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(26),
		 cout => SYNTHESIZED_WIRE_19);


b2v_alu27 : onebitalu
PORT MAP(a => a(27),
		 controla => controla,
		 less => less,
		 b => b(27),
		 cin => SYNTHESIZED_WIRE_19,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(27),
		 cout => SYNTHESIZED_WIRE_20);


b2v_alu28 : onebitalu
PORT MAP(a => a(28),
		 controla => controla,
		 less => less,
		 b => b(28),
		 cin => SYNTHESIZED_WIRE_20,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(28),
		 cout => SYNTHESIZED_WIRE_21);


b2v_alu29 : onebitalu
PORT MAP(a => a(29),
		 controla => controla,
		 less => less,
		 b => b(29),
		 cin => SYNTHESIZED_WIRE_21,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(29),
		 cout => SYNTHESIZED_WIRE_23);


b2v_alu3 : onebitalu
PORT MAP(a => a(3),
		 controla => controla,
		 less => less,
		 b => b(3),
		 cin => SYNTHESIZED_WIRE_22,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(3),
		 cout => SYNTHESIZED_WIRE_25);


b2v_alu30 : onebitalu
PORT MAP(a => a(30),
		 controla => controla,
		 less => less,
		 b => b(30),
		 cin => SYNTHESIZED_WIRE_23,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(30),
		 cout => SYNTHESIZED_WIRE_35);


b2v_alu31 : onebitalu
PORT MAP(a => a(31),
		 controla => controla,
		 less => less,
		 b => b(31),
		 cin => SYNTHESIZED_WIRE_35,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(31),
		 set => slt,
		 cout => cout_ALTERA_SYNTHESIZED);


b2v_alu4 : onebitalu
PORT MAP(a => a(4),
		 controla => controla,
		 less => less,
		 b => b(4),
		 cin => SYNTHESIZED_WIRE_25,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(4),
		 cout => SYNTHESIZED_WIRE_26);


b2v_alu5 : onebitalu
PORT MAP(a => a(5),
		 controla => controla,
		 less => less,
		 b => b(5),
		 cin => SYNTHESIZED_WIRE_26,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(5),
		 cout => SYNTHESIZED_WIRE_27);


b2v_alu6 : onebitalu
PORT MAP(a => a(6),
		 controla => controla,
		 less => less,
		 b => b(6),
		 cin => SYNTHESIZED_WIRE_27,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(6),
		 cout => SYNTHESIZED_WIRE_28);


b2v_alu7 : onebitalu
PORT MAP(a => a(7),
		 controla => controla,
		 less => less,
		 b => b(7),
		 cin => SYNTHESIZED_WIRE_28,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(7),
		 cout => SYNTHESIZED_WIRE_29);


b2v_alu8 : onebitalu
PORT MAP(a => a(8),
		 controla => controla,
		 less => less,
		 b => b(8),
		 cin => SYNTHESIZED_WIRE_29,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(8),
		 cout => SYNTHESIZED_WIRE_30);


b2v_alu9 : onebitalu
PORT MAP(a => a(9),
		 controla => controla,
		 less => less,
		 b => b(9),
		 cin => SYNTHESIZED_WIRE_30,
		 controlb => controlb,
		 controlop => controlop,
		 result => result_ALTERA_SYNTHESIZED(9),
		 cout => SYNTHESIZED_WIRE_1);



overflow <= SYNTHESIZED_WIRE_35 XOR cout_ALTERA_SYNTHESIZED;


SYNTHESIZED_WIRE_34 <= NOT(result_ALTERA_SYNTHESIZED(11) OR result_ALTERA_SYNTHESIZED(10) OR result_ALTERA_SYNTHESIZED(9) OR result_ALTERA_SYNTHESIZED(7) OR result_ALTERA_SYNTHESIZED(8) OR result_ALTERA_SYNTHESIZED(6) OR result_ALTERA_SYNTHESIZED(4) OR result_ALTERA_SYNTHESIZED(5) OR result_ALTERA_SYNTHESIZED(3) OR result_ALTERA_SYNTHESIZED(1) OR result_ALTERA_SYNTHESIZED(2) OR result_ALTERA_SYNTHESIZED(0));


SYNTHESIZED_WIRE_33 <= NOT(result_ALTERA_SYNTHESIZED(23) OR result_ALTERA_SYNTHESIZED(22) OR result_ALTERA_SYNTHESIZED(21) OR result_ALTERA_SYNTHESIZED(19) OR result_ALTERA_SYNTHESIZED(20) OR result_ALTERA_SYNTHESIZED(18) OR result_ALTERA_SYNTHESIZED(16) OR result_ALTERA_SYNTHESIZED(17) OR result_ALTERA_SYNTHESIZED(15) OR result_ALTERA_SYNTHESIZED(13) OR result_ALTERA_SYNTHESIZED(14) OR result_ALTERA_SYNTHESIZED(12));


SYNTHESIZED_WIRE_32 <= NOT(result_ALTERA_SYNTHESIZED(31) OR result_ALTERA_SYNTHESIZED(29) OR result_ALTERA_SYNTHESIZED(30) OR result_ALTERA_SYNTHESIZED(28) OR result_ALTERA_SYNTHESIZED(26) OR result_ALTERA_SYNTHESIZED(27) OR result_ALTERA_SYNTHESIZED(25) OR result_ALTERA_SYNTHESIZED(24));


zflag <= SYNTHESIZED_WIRE_32 AND SYNTHESIZED_WIRE_33 AND SYNTHESIZED_WIRE_34;

cout <= cout_ALTERA_SYNTHESIZED;
NFlag <= result_ALTERA_SYNTHESIZED(31);
result <= result_ALTERA_SYNTHESIZED;

less <= '0';
END bdf_type;