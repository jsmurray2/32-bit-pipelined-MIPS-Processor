-- megafunction wizard: %LPM_MUX%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_MUX 

-- ============================================================
-- File Name: mux_2_1_1b.vhd
-- Megafunction Name(s):
-- 			LPM_MUX
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 18.1.1 Build 646 04/11/2019 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2019  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY mux_2_1_1b IS
	PORT
	(
		data0		: IN STD_LOGIC ;
		data1		: IN STD_LOGIC ;
		sel		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC 
	);
END mux_2_1_1b;


ARCHITECTURE SYN OF mux_2_1_1b IS

--	type STD_LOGIC_2D is array (NATURAL RANGE <>, NATURAL RANGE <>) of STD_LOGIC;

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC_2D (1 DOWNTO 0, 0 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire6	: STD_LOGIC ;

BEGIN
	sub_wire2    <= data0;
	sub_wire0    <= data1;
	sub_wire1(1, 0)    <= sub_wire0;
	sub_wire1(0, 0)    <= sub_wire2;
	sub_wire3    <= sel;
	sub_wire4(0)    <= sub_wire3;
	sub_wire6    <= sub_wire5(0);
	result    <= sub_wire6;

	LPM_MUX_component : LPM_MUX
	GENERIC MAP (
		lpm_size => 2,
		lpm_type => "LPM_MUX",
		lpm_width => 1,
		lpm_widths => 1
	)
	PORT MAP (
		data => sub_wire1,
		sel => sub_wire4,
		result => sub_wire5
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_SIZE NUMERIC "2"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "1"
-- Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "1"
-- Retrieval info: USED_PORT: data0 0 0 0 0 INPUT NODEFVAL "data0"
-- Retrieval info: USED_PORT: data1 0 0 0 0 INPUT NODEFVAL "data1"
-- Retrieval info: USED_PORT: result 0 0 0 0 OUTPUT NODEFVAL "result"
-- Retrieval info: USED_PORT: sel 0 0 0 0 INPUT NODEFVAL "sel"
-- Retrieval info: CONNECT: @data 1 0 1 0 data0 0 0 0 0
-- Retrieval info: CONNECT: @data 1 1 1 0 data1 0 0 0 0
-- Retrieval info: CONNECT: @sel 0 0 1 0 sel 0 0 0 0
-- Retrieval info: CONNECT: result 0 0 0 0 @result 0 0 1 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL mux_2_1_1b.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mux_2_1_1b.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mux_2_1_1b.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mux_2_1_1b.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mux_2_1_1b_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
