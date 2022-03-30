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
-- CREATED		"Fri Oct 25 14:20:57 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY regfile32 IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset0 :  IN  STD_LOGIC;
		writeEn :  IN  STD_LOGIC;
		Read1Register :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Read2Register :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		WriteData :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		WriteReg :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Read1Data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Read2Data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END regfile32;

ARCHITECTURE bdf_type OF regfile32 IS 

COMPONENT readdecoder
	PORT(data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC;
		 eq4 : OUT STD_LOGIC;
		 eq5 : OUT STD_LOGIC;
		 eq6 : OUT STD_LOGIC;
		 eq7 : OUT STD_LOGIC;
		 eq8 : OUT STD_LOGIC;
		 eq9 : OUT STD_LOGIC;
		 eq10 : OUT STD_LOGIC;
		 eq11 : OUT STD_LOGIC;
		 eq12 : OUT STD_LOGIC;
		 eq13 : OUT STD_LOGIC;
		 eq14 : OUT STD_LOGIC;
		 eq15 : OUT STD_LOGIC;
		 eq16 : OUT STD_LOGIC;
		 eq17 : OUT STD_LOGIC;
		 eq18 : OUT STD_LOGIC;
		 eq19 : OUT STD_LOGIC;
		 eq20 : OUT STD_LOGIC;
		 eq21 : OUT STD_LOGIC;
		 eq22 : OUT STD_LOGIC;
		 eq23 : OUT STD_LOGIC;
		 eq24 : OUT STD_LOGIC;
		 eq25 : OUT STD_LOGIC;
		 eq26 : OUT STD_LOGIC;
		 eq27 : OUT STD_LOGIC;
		 eq28 : OUT STD_LOGIC;
		 eq29 : OUT STD_LOGIC;
		 eq30 : OUT STD_LOGIC;
		 eq31 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT readmux
	PORT(data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data10x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data11x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data12x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data13x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data14x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data15x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data16x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data17x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data18x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data19x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data20x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data21x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data22x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data23x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data24x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data25x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data26x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data27x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data28x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data29x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data2x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data30x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data31x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data3x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data4x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data5x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data6x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data7x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data8x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data9x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
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

SIGNAL	clock :  STD_LOGIC;
SIGNAL	data :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O0x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O10x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O11x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O12x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O13x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O14x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O15x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O16x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O17x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O18x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O19x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O1x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O20x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O21x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O22x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O23x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O24x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O25x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O26x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O27x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O28x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O29x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O2x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O30x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O31x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O3x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O4x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O5x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O6x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O7x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O8x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	O9x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	out1x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	out2x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	r1x :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	r2x :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	rst :  STD_LOGIC;
SIGNAL	wen :  STD_LOGIC;
SIGNAL	x0e :  STD_LOGIC;
SIGNAL	x10e :  STD_LOGIC;
SIGNAL	x11e :  STD_LOGIC;
SIGNAL	x12e :  STD_LOGIC;
SIGNAL	x13e :  STD_LOGIC;
SIGNAL	x14e :  STD_LOGIC;
SIGNAL	x15e :  STD_LOGIC;
SIGNAL	x16e :  STD_LOGIC;
SIGNAL	x17e :  STD_LOGIC;
SIGNAL	x18e :  STD_LOGIC;
SIGNAL	x19e :  STD_LOGIC;
SIGNAL	x1e :  STD_LOGIC;
SIGNAL	x20e :  STD_LOGIC;
SIGNAL	x21e :  STD_LOGIC;
SIGNAL	x22e :  STD_LOGIC;
SIGNAL	x23e :  STD_LOGIC;
SIGNAL	x24e :  STD_LOGIC;
SIGNAL	x25e :  STD_LOGIC;
SIGNAL	x26e :  STD_LOGIC;
SIGNAL	x27e :  STD_LOGIC;
SIGNAL	x28e :  STD_LOGIC;
SIGNAL	x29e :  STD_LOGIC;
SIGNAL	x2e :  STD_LOGIC;
SIGNAL	x30e :  STD_LOGIC;
SIGNAL	x31e :  STD_LOGIC;
SIGNAL	x3e :  STD_LOGIC;
SIGNAL	x4e :  STD_LOGIC;
SIGNAL	x5e :  STD_LOGIC;
SIGNAL	x6e :  STD_LOGIC;
SIGNAL	x7e :  STD_LOGIC;
SIGNAL	x8e :  STD_LOGIC;
SIGNAL	x9e :  STD_LOGIC;
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
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_1 <= '0';



SYNTHESIZED_WIRE_0 <= wen AND x0e;


SYNTHESIZED_WIRE_2 <= wen AND x1e;


SYNTHESIZED_WIRE_3 <= wen AND x10e;


SYNTHESIZED_WIRE_4 <= wen AND x11e;


SYNTHESIZED_WIRE_5 <= wen AND x12e;


SYNTHESIZED_WIRE_6 <= wen AND x13e;


SYNTHESIZED_WIRE_7 <= wen AND x14e;


SYNTHESIZED_WIRE_8 <= wen AND x15e;


SYNTHESIZED_WIRE_9 <= wen AND x16e;


SYNTHESIZED_WIRE_10 <= wen AND x17e;


SYNTHESIZED_WIRE_11 <= wen AND x18e;


SYNTHESIZED_WIRE_12 <= wen AND x19e;


SYNTHESIZED_WIRE_13 <= wen AND x2e;


SYNTHESIZED_WIRE_14 <= wen AND x20e;


SYNTHESIZED_WIRE_15 <= wen AND x21e;


SYNTHESIZED_WIRE_16 <= wen AND x22e;


SYNTHESIZED_WIRE_17 <= wen AND x23e;


SYNTHESIZED_WIRE_18 <= wen AND x24e;


SYNTHESIZED_WIRE_19 <= wen AND x25e;


SYNTHESIZED_WIRE_20 <= wen AND x26e;


SYNTHESIZED_WIRE_21 <= wen AND x27e;


SYNTHESIZED_WIRE_22 <= wen AND x28e;


SYNTHESIZED_WIRE_23 <= wen AND x29e;


SYNTHESIZED_WIRE_24 <= wen AND x3e;


SYNTHESIZED_WIRE_25 <= wen AND x30e;


SYNTHESIZED_WIRE_26 <= wen AND x31e;


SYNTHESIZED_WIRE_27 <= wen AND x4e;


SYNTHESIZED_WIRE_28 <= wen AND x5e;


SYNTHESIZED_WIRE_29 <= wen AND x6e;


SYNTHESIZED_WIRE_30 <= wen AND x7e;


SYNTHESIZED_WIRE_31 <= wen AND x8e;


SYNTHESIZED_WIRE_32 <= wen AND x9e;


b2v_decode1 : readdecoder
PORT MAP(data => WriteReg,
		 eq0 => x0e,
		 eq1 => x1e,
		 eq2 => x2e,
		 eq3 => x3e,
		 eq4 => x4e,
		 eq5 => x5e,
		 eq6 => x6e,
		 eq7 => x7e,
		 eq8 => x8e,
		 eq9 => x9e,
		 eq10 => x10e,
		 eq11 => x11e,
		 eq12 => x12e,
		 eq13 => x13e,
		 eq14 => x14e,
		 eq15 => x15e,
		 eq16 => x16e,
		 eq17 => x17e,
		 eq18 => x18e,
		 eq19 => x19e,
		 eq20 => x20e,
		 eq21 => x21e,
		 eq22 => x22e,
		 eq23 => x23e,
		 eq24 => x24e,
		 eq25 => x25e,
		 eq26 => x26e,
		 eq27 => x27e,
		 eq28 => x28e,
		 eq29 => x29e,
		 eq30 => x30e,
		 eq31 => x31e);



b2v_read1 : readmux
PORT MAP(data0x => O0x,
		 data10x => O10x,
		 data11x => O11x,
		 data12x => O12x,
		 data13x => O13x,
		 data14x => O14x,
		 data15x => O15x,
		 data16x => O16x,
		 data17x => O17x,
		 data18x => O18x,
		 data19x => O19x,
		 data1x => O1x,
		 data20x => O20x,
		 data21x => O21x,
		 data22x => O22x,
		 data23x => O23x,
		 data24x => O24x,
		 data25x => O25x,
		 data26x => O26x,
		 data27x => O27x,
		 data28x => O28x,
		 data29x => O29x,
		 data2x => O2x,
		 data30x => O30x,
		 data31x => O31x,
		 data3x => O3x,
		 data4x => O4x,
		 data5x => O5x,
		 data6x => O6x,
		 data7x => O7x,
		 data8x => O8x,
		 data9x => O9x,
		 sel => r1x,
		 result => out1x);


b2v_read2 : readmux
PORT MAP(data0x => O0x,
		 data10x => O10x,
		 data11x => O11x,
		 data12x => O12x,
		 data13x => O13x,
		 data14x => O14x,
		 data15x => O15x,
		 data16x => O16x,
		 data17x => O17x,
		 data18x => O18x,
		 data19x => O19x,
		 data1x => O1x,
		 data20x => O20x,
		 data21x => O21x,
		 data22x => O22x,
		 data23x => O23x,
		 data24x => O24x,
		 data25x => O25x,
		 data26x => O26x,
		 data27x => O27x,
		 data28x => O28x,
		 data29x => O29x,
		 data2x => O2x,
		 data30x => O30x,
		 data31x => O31x,
		 data3x => O3x,
		 data4x => O4x,
		 data5x => O5x,
		 data6x => O6x,
		 data7x => O7x,
		 data8x => O8x,
		 data9x => O9x,
		 sel => r2x,
		 result => out2x);


b2v_reg0 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_0,
		 CLRN => SYNTHESIZED_WIRE_1,
		 D => data,
		 Q => O0x);


b2v_reg1 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_2,
		 CLRN => rst,
		 D => data,
		 Q => O1x);


b2v_reg10 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_3,
		 CLRN => rst,
		 D => data,
		 Q => O10x);


b2v_reg11 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_4,
		 CLRN => rst,
		 D => data,
		 Q => O11x);


b2v_reg12 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_5,
		 CLRN => rst,
		 D => data,
		 Q => O12x);


b2v_reg13 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_6,
		 CLRN => rst,
		 D => data,
		 Q => O13x);


b2v_reg14 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_7,
		 CLRN => rst,
		 D => data,
		 Q => O14x);


b2v_reg15 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_8,
		 CLRN => rst,
		 D => data,
		 Q => O15x);


b2v_reg16 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_9,
		 CLRN => rst,
		 D => data,
		 Q => O16x);


b2v_reg17 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_10,
		 CLRN => rst,
		 D => data,
		 Q => O17x);


b2v_reg18 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_11,
		 CLRN => rst,
		 D => data,
		 Q => O18x);


b2v_reg19 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_12,
		 CLRN => rst,
		 D => data,
		 Q => O19x);


b2v_reg2 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_13,
		 CLRN => rst,
		 D => data,
		 Q => O2x);


b2v_reg20 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_14,
		 CLRN => rst,
		 D => data,
		 Q => O20x);


b2v_reg21 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_15,
		 CLRN => rst,
		 D => data,
		 Q => O21x);


b2v_reg22 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_16,
		 CLRN => rst,
		 D => data,
		 Q => O22x);


b2v_reg23 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_17,
		 CLRN => rst,
		 D => data,
		 Q => O23x);


b2v_reg24 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_18,
		 CLRN => rst,
		 D => data,
		 Q => O24x);


b2v_reg25 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_19,
		 CLRN => rst,
		 D => data,
		 Q => O25x);


b2v_reg26 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_20,
		 CLRN => rst,
		 D => data,
		 Q => O26x);


b2v_reg27 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_21,
		 CLRN => rst,
		 D => data,
		 Q => O27x);


b2v_reg28 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_22,
		 CLRN => rst,
		 D => data,
		 Q => O28x);


b2v_reg29 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_23,
		 CLRN => rst,
		 D => data,
		 Q => O29x);


b2v_reg3 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_24,
		 CLRN => rst,
		 D => data,
		 Q => O3x);


b2v_reg30 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_25,
		 CLRN => rst,
		 D => data,
		 Q => O30x);


b2v_reg31 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_26,
		 CLRN => rst,
		 D => data,
		 Q => O31x);


b2v_reg4 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_27,
		 CLRN => rst,
		 D => data,
		 Q => O4x);


b2v_reg5 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_28,
		 CLRN => rst,
		 D => data,
		 Q => O5x);


b2v_reg6 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_29,
		 CLRN => rst,
		 D => data,
		 Q => O6x);


b2v_reg7 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_30,
		 CLRN => rst,
		 D => data,
		 Q => O7x);


b2v_reg8 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_31,
		 CLRN => rst,
		 D => data,
		 Q => O8x);


b2v_reg9 : reg32bit
PORT MAP(Clock => clock,
		 enable => SYNTHESIZED_WIRE_32,
		 CLRN => rst,
		 D => data,
		 Q => O9x);

Read1Data <= out1x;
clock <= clk;
wen <= writeEn;
data <= WriteData;
rst <= reset0;
r1x <= Read1Register;
Read2Data <= out2x;
r2x <= Read2Register;

END bdf_type;