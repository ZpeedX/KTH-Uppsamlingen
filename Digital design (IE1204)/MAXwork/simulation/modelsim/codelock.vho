-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "12/09/2015 14:13:21"

-- 
-- Device: Altera EPM3032ALC44-10 Package PLCC44
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAX;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAX.MAX_COMPONENTS.ALL;

ENTITY 	codelock IS
    PORT (
	clk : IN std_logic;
	K : IN std_logic_vector(1 TO 3);
	R : IN std_logic_vector(1 TO 4);
	q : OUT std_logic_vector(4 DOWNTO 0);
	UNLOCK : OUT std_logic
	);
END codelock;

-- Design Ports Information
-- clk	=>  Location: PIN_43
-- K[3]	=>  Location: PIN_24
-- K[2]	=>  Location: PIN_21
-- K[1]	=>  Location: PIN_20
-- R[4]	=>  Location: PIN_25
-- R[3]	=>  Location: PIN_12
-- R[2]	=>  Location: PIN_11
-- R[1]	=>  Location: PIN_34
-- q[1]	=>  Location: PIN_14
-- q[2]	=>  Location: PIN_16
-- q[3]	=>  Location: PIN_18
-- q[4]	=>  Location: PIN_31
-- UNLOCK	=>  Location: PIN_19
-- q[0]	=>  Location: PIN_29


ARCHITECTURE structure OF codelock IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_clk : std_logic;
SIGNAL ww_K : std_logic_vector(1 TO 3);
SIGNAL ww_R : std_logic_vector(1 TO 4);
SIGNAL ww_q : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_UNLOCK : std_logic;
SIGNAL \Selector5~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~10_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[1]~22_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[1]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~8_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[2]~28_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[2]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[3]~34_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[3]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector7~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[4]~40_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[4]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Equal10~6_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~9_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \nextstate[0]~46_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \state[0]_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector5~8_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector4~17_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector2~17_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector6~16_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector0~3sexp1_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector0~3sexp2_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector0~3sexp3_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector0~3sexp4_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \Selector0~3sexp5_datain_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \clk~dataout\ : std_logic;
SIGNAL \Selector2~17_pexpout\ : std_logic;
SIGNAL \Selector2~8_dataout\ : std_logic;
SIGNAL \nextstate[2]~28_dataout\ : std_logic;
SIGNAL \Selector5~8_pexpout\ : std_logic;
SIGNAL \Selector5~1_dataout\ : std_logic;
SIGNAL \Selector0~3sexp1_dataout\ : std_logic;
SIGNAL \Selector0~3sexp2_dataout\ : std_logic;
SIGNAL \Selector0~3sexp3_dataout\ : std_logic;
SIGNAL \Selector0~3sexp4_dataout\ : std_logic;
SIGNAL \Selector0~3sexp5_dataout\ : std_logic;
SIGNAL \nextstate[3]~34_dataout\ : std_logic;
SIGNAL \Selector7~1_dataout\ : std_logic;
SIGNAL \nextstate[4]~40_dataout\ : std_logic;
SIGNAL \Selector6~16_pexpout\ : std_logic;
SIGNAL \Selector6~9_dataout\ : std_logic;
SIGNAL \nextstate[0]~46_dataout\ : std_logic;
SIGNAL \Selector4~17_pexpout\ : std_logic;
SIGNAL \Selector4~10_dataout\ : std_logic;
SIGNAL \nextstate[1]~22_dataout\ : std_logic;
SIGNAL \Equal10~6_dataout\ : std_logic;
SIGNAL state : std_logic_vector(4 DOWNTO 0);
SIGNAL \R~dataout\ : std_logic_vector(1 TO 4);
SIGNAL \K~dataout\ : std_logic_vector(1 TO 3);
SIGNAL \ALT_INV_K~dataout\ : std_logic_vector(3 DOWNTO 1);
SIGNAL ALT_INV_state : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_Selector5~1_dataout\ : std_logic;
SIGNAL \ALT_INV_R~dataout\ : std_logic_vector(4 DOWNTO 1);

BEGIN

ww_clk <= clk;
ww_K <= K;
ww_R <= R;
q <= ww_q;
UNLOCK <= ww_UNLOCK;

\Selector5~1_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4));

\Selector5~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(4));

\Selector5~1_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & \K~dataout\(1) & NOT \R~dataout\(2) & \R~dataout\(4));

\Selector5~1_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(1));

\Selector5~1_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3));

\Selector5~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector5~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~10_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & state(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & \K~dataout\(1) & NOT \R~dataout\(2) & \R~dataout\(4) & NOT state(4) & NOT state(3) & state(1));

\Selector4~10_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3) & NOT state(1) & state(0));

\Selector4~10_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & NOT state(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & \K~dataout\(2) & NOT \K~dataout\(1) & \R~dataout\(2) & NOT \R~dataout\(4) & NOT state(4) & NOT state(3) & state(1));

\Selector4~10_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(4) & NOT state(1) & state(0));

\Selector4~10_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(4) & state(1) & NOT state(0));

\Selector4~10_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~10_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~10_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~10_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector4~10_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~10_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector5~1_dataout\ & \Selector4~10_dataout\);

\nextstate[1]~22_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[1]~22_dataout\ & NOT \Selector5~1_dataout\);

\nextstate[1]~22_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[1]~22_dataout\ & \Selector4~10_dataout\);

\nextstate[1]~22_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\nextstate[1]~22_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[1]~22_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[1]~22_dataout\);

\state[1]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\state[1]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[1]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~8_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & state(0) & NOT \R~dataout\(4) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & NOT state(2) & state(1));

\Selector2~8_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(4) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & state(2) & NOT state(1));

\Selector2~8_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT \R~dataout\(4) & \K~dataout\(1) & \R~dataout\(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & state(2) & NOT state(1));

\Selector2~8_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & NOT state(3) & NOT state(4) & \R~dataout\(4) & \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & state(2) & state(1));

\Selector2~8_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & NOT state(0) & NOT \R~dataout\(4) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & state(2));

\Selector2~8_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~8_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~8_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~8_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector2~8_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~8_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[2]~28_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4) & state(2) & NOT state(1) & \nextstate[2]~28_dataout\);

\nextstate[2]~28_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector5~1_dataout\ & \Selector2~8_dataout\);

\nextstate[2]~28_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[2]~28_dataout\ & NOT \Selector5~1_dataout\);

\nextstate[2]~28_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[2]~28_dataout\ & \Selector2~8_dataout\);

\nextstate[2]~28_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4) & state(2) & NOT state(1) & \Selector5~1_dataout\);

\nextstate[2]~28_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[2]~28_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[2]~28_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[2]~28_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\nextstate[2]~28_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[2]~28_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[2]~28_dataout\);

\state[2]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\state[2]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[2]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector0~3sexp5_dataout\ & \Selector0~3sexp4_dataout\ & \Selector0~3sexp3_dataout\ & \Selector0~3sexp2_dataout\ & \Selector0~3sexp1_dataout\ & \Selector5~1_dataout\);

\nextstate[3]~34_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[3]~34_dataout\ & NOT \Selector5~1_dataout\);

\nextstate[3]~34_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector0~3sexp5_dataout\ & \Selector0~3sexp4_dataout\ & \Selector0~3sexp3_dataout\ & \Selector0~3sexp2_dataout\ & \Selector0~3sexp1_dataout\ & \nextstate[3]~34_dataout\);

\nextstate[3]~34_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\nextstate[3]~34_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[3]~34_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[3]~34_dataout\);

\state[3]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\state[3]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[3]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector7~1_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(0) & state(1) & state(2) & state(3) & NOT state(4));

\Selector7~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(3) & state(4));

\Selector7~1_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(2) & state(4));

\Selector7~1_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(1) & state(4));

\Selector7~1_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(0) & state(4));

\Selector7~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector7~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector7~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector7~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector7~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector7~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector5~1_dataout\ & \Selector7~1_dataout\);

\nextstate[4]~40_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[4]~40_dataout\ & NOT \Selector5~1_dataout\);

\nextstate[4]~40_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[4]~40_dataout\ & \Selector7~1_dataout\);

\nextstate[4]~40_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\nextstate[4]~40_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[4]~40_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[4]~40_dataout\);

\state[4]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\state[4]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[4]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(3) & NOT state(4));

\Equal10~6_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Equal10~6_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Equal10~6_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~9_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & state(2) & state(1) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & \K~dataout\(1) & NOT \R~dataout\(2) & \R~dataout\(4) & NOT state(4) & NOT state(3));

\Selector6~9_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3) & NOT state(0));

\Selector6~9_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & NOT state(2) & state(1) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & \K~dataout\(2) & NOT \K~dataout\(1) & \R~dataout\(2) & NOT \R~dataout\(4) & NOT state(4) & NOT state(3));

\Selector6~9_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & NOT state(2) & NOT state(1) & NOT \R~dataout\(1) & \R~dataout\(3) & \K~dataout\(3) & NOT \K~dataout\(2) & NOT \K~dataout\(1) & NOT \R~dataout\(2) & NOT \R~dataout\(4) & NOT state(4) & NOT state(3));

\Selector6~9_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & state(2) & NOT state(1) & NOT \R~dataout\(1) & NOT \R~dataout\(3) & NOT \K~dataout\(3) & NOT \K~dataout\(2) & \K~dataout\(1) & \R~dataout\(2) & NOT \R~dataout\(4) & NOT state(4) & NOT state(3));

\Selector6~9_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~9_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~9_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~9_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector6~9_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~9_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \Selector5~1_dataout\ & \Selector6~9_dataout\);

\nextstate[0]~46_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[0]~46_dataout\ & NOT \Selector5~1_dataout\);

\nextstate[0]~46_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[0]~46_dataout\ & \Selector6~9_dataout\);

\nextstate[0]~46_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\nextstate[0]~46_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\nextstate[0]~46_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \nextstate[0]~46_dataout\);

\state[0]_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\state[0]_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\state[0]_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(2));

\Selector5~8_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(0));

\Selector5~8_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector5~8_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector5~8_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4) & state(1) & NOT state(0));

\Selector4~17_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3) & state(1) & NOT state(0));

\Selector4~17_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4) & NOT state(1) & state(0));

\Selector4~17_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector4~17_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector4~17_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~17_pterm0_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(0) & state(3) & NOT state(2) & state(1));

\Selector2~17_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3) & state(2) & NOT state(1));

\Selector2~17_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(0) & state(4) & state(2));

\Selector2~17_pterm3_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(0) & state(3) & state(2));

\Selector2~17_pterm4_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(0) & state(4) & NOT state(2) & state(1));

\Selector2~17_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~17_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~17_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~17_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector2~17_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector2~17_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(4) & NOT state(0));

\Selector6~16_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Selector6~16_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector6~16_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Selector0~3sexp1_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & NOT \R~dataout\(1) & NOT state(4) & \R~dataout\(4) & NOT \R~dataout\(2) & \K~dataout\(1) & NOT \K~dataout\(2) & NOT \K~dataout\(3) & NOT \R~dataout\(3) & state(2) & state(0) & state(1));

\Selector0~3sexp2_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & state(3) & state(2) & state(0) & state(1));

\Selector0~3sexp3_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(3) & NOT state(1));

\Selector0~3sexp4_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(3) & NOT state(0));

\Selector0~3sexp5_datain_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT state(3) & NOT state(2));
\ALT_INV_K~dataout\(1) <= NOT \K~dataout\(1);
\ALT_INV_K~dataout\(2) <= NOT \K~dataout\(2);
\ALT_INV_K~dataout\(3) <= NOT \K~dataout\(3);
ALT_INV_state(0) <= NOT state(0);
ALT_INV_state(4) <= NOT state(4);
ALT_INV_state(3) <= NOT state(3);
ALT_INV_state(2) <= NOT state(2);
ALT_INV_state(1) <= NOT state(1);
\ALT_INV_Selector5~1_dataout\ <= NOT \Selector5~1_dataout\;
\ALT_INV_R~dataout\(1) <= NOT \R~dataout\(1);
\ALT_INV_R~dataout\(2) <= NOT \R~dataout\(2);
\ALT_INV_R~dataout\(3) <= NOT \R~dataout\(3);
\ALT_INV_R~dataout\(4) <= NOT \R~dataout\(4);

-- Location: PIN_43
\clk~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk,
	dataout => \clk~dataout\);

-- Location: LC5
\Selector2~17\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \Selector2~17_pterm0_bus\,
	pterm1 => \Selector2~17_pterm1_bus\,
	pterm2 => \Selector2~17_pterm2_bus\,
	pterm3 => \Selector2~17_pterm3_bus\,
	pterm4 => \Selector2~17_pterm4_bus\,
	pterm5 => \Selector2~17_pterm5_bus\,
	pxor => \Selector2~17_pxor_bus\,
	pclk => \Selector2~17_pclk_bus\,
	papre => \Selector2~17_papre_bus\,
	paclr => \Selector2~17_paclr_bus\,
	pena => \Selector2~17_pena_bus\,
	pexpout => \Selector2~17_pexpout\);

-- Location: PIN_21
\K[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_K(2),
	dataout => \K~dataout\(2));

-- Location: PIN_24
\K[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_K(3),
	dataout => \K~dataout\(3));

-- Location: PIN_12
\R[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_R(3),
	dataout => \R~dataout\(3));

-- Location: PIN_34
\R[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_R(1),
	dataout => \R~dataout\(1));

-- Location: PIN_11
\R[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_R(2),
	dataout => \R~dataout\(2));

-- Location: PIN_20
\K[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_K(1),
	dataout => \K~dataout\(1));

-- Location: PIN_25
\R[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_R(4),
	dataout => \R~dataout\(4));

-- Location: LC6
\Selector2~8\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \Selector2~17_pexpout\,
	pterm0 => \Selector2~8_pterm0_bus\,
	pterm1 => \Selector2~8_pterm1_bus\,
	pterm2 => \Selector2~8_pterm2_bus\,
	pterm3 => \Selector2~8_pterm3_bus\,
	pterm4 => \Selector2~8_pterm4_bus\,
	pterm5 => \Selector2~8_pterm5_bus\,
	pxor => \Selector2~8_pxor_bus\,
	pclk => \Selector2~8_pclk_bus\,
	papre => \Selector2~8_papre_bus\,
	paclr => \Selector2~8_paclr_bus\,
	pena => \Selector2~8_pena_bus\,
	dataout => \Selector2~8_dataout\);

-- Location: LC16
\nextstate[2]~28\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \nextstate[2]~28_pterm0_bus\,
	pterm1 => \nextstate[2]~28_pterm1_bus\,
	pterm2 => \nextstate[2]~28_pterm2_bus\,
	pterm3 => \nextstate[2]~28_pterm3_bus\,
	pterm4 => \nextstate[2]~28_pterm4_bus\,
	pterm5 => \nextstate[2]~28_pterm5_bus\,
	pxor => \nextstate[2]~28_pxor_bus\,
	pclk => \nextstate[2]~28_pclk_bus\,
	papre => \nextstate[2]~28_papre_bus\,
	paclr => \nextstate[2]~28_paclr_bus\,
	pena => \nextstate[2]~28_pena_bus\,
	dataout => \nextstate[2]~28_dataout\);

-- Location: LC11
\state[2]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \clk~dataout\,
	pterm0 => \state[2]_pterm0_bus\,
	pterm1 => \state[2]_pterm1_bus\,
	pterm2 => \state[2]_pterm2_bus\,
	pterm3 => \state[2]_pterm3_bus\,
	pterm4 => \state[2]_pterm4_bus\,
	pterm5 => \state[2]_pterm5_bus\,
	pxor => \state[2]_pxor_bus\,
	pclk => \state[2]_pclk_bus\,
	papre => \state[2]_papre_bus\,
	paclr => \state[2]_paclr_bus\,
	pena => \state[2]_pena_bus\,
	dataout => state(2));

-- Location: LC1
\Selector5~8\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \Selector5~8_pterm0_bus\,
	pterm1 => \Selector5~8_pterm1_bus\,
	pterm2 => \Selector5~8_pterm2_bus\,
	pterm3 => \Selector5~8_pterm3_bus\,
	pterm4 => \Selector5~8_pterm4_bus\,
	pterm5 => \Selector5~8_pterm5_bus\,
	pxor => \Selector5~8_pxor_bus\,
	pclk => \Selector5~8_pclk_bus\,
	papre => \Selector5~8_papre_bus\,
	paclr => \Selector5~8_paclr_bus\,
	pena => \Selector5~8_pena_bus\,
	pexpout => \Selector5~8_pexpout\);

-- Location: LC2
\Selector5~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \Selector5~8_pexpout\,
	pterm0 => \Selector5~1_pterm0_bus\,
	pterm1 => \Selector5~1_pterm1_bus\,
	pterm2 => \Selector5~1_pterm2_bus\,
	pterm3 => \Selector5~1_pterm3_bus\,
	pterm4 => \Selector5~1_pterm4_bus\,
	pterm5 => \Selector5~1_pterm5_bus\,
	pxor => \Selector5~1_pxor_bus\,
	pclk => \Selector5~1_pclk_bus\,
	papre => \Selector5~1_papre_bus\,
	paclr => \Selector5~1_paclr_bus\,
	pena => \Selector5~1_pena_bus\,
	dataout => \Selector5~1_dataout\);

-- Location: SEXP7
\Selector0~3sexp1\ : max_sexp
PORT MAP (
	datain => \Selector0~3sexp1_datain_bus\,
	dataout => \Selector0~3sexp1_dataout\);

-- Location: SEXP9
\Selector0~3sexp2\ : max_sexp
PORT MAP (
	datain => \Selector0~3sexp2_datain_bus\,
	dataout => \Selector0~3sexp2_dataout\);

-- Location: SEXP10
\Selector0~3sexp3\ : max_sexp
PORT MAP (
	datain => \Selector0~3sexp3_datain_bus\,
	dataout => \Selector0~3sexp3_dataout\);

-- Location: SEXP1
\Selector0~3sexp4\ : max_sexp
PORT MAP (
	datain => \Selector0~3sexp4_datain_bus\,
	dataout => \Selector0~3sexp4_dataout\);

-- Location: SEXP3
\Selector0~3sexp5\ : max_sexp
PORT MAP (
	datain => \Selector0~3sexp5_datain_bus\,
	dataout => \Selector0~3sexp5_dataout\);

-- Location: LC9
\nextstate[3]~34\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \nextstate[3]~34_pterm0_bus\,
	pterm1 => \nextstate[3]~34_pterm1_bus\,
	pterm2 => \nextstate[3]~34_pterm2_bus\,
	pterm3 => \nextstate[3]~34_pterm3_bus\,
	pterm4 => \nextstate[3]~34_pterm4_bus\,
	pterm5 => \nextstate[3]~34_pterm5_bus\,
	pxor => \nextstate[3]~34_pxor_bus\,
	pclk => \nextstate[3]~34_pclk_bus\,
	papre => \nextstate[3]~34_papre_bus\,
	paclr => \nextstate[3]~34_paclr_bus\,
	pena => \nextstate[3]~34_pena_bus\,
	dataout => \nextstate[3]~34_dataout\);

-- Location: LC13
\state[3]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \clk~dataout\,
	pterm0 => \state[3]_pterm0_bus\,
	pterm1 => \state[3]_pterm1_bus\,
	pterm2 => \state[3]_pterm2_bus\,
	pterm3 => \state[3]_pterm3_bus\,
	pterm4 => \state[3]_pterm4_bus\,
	pterm5 => \state[3]_pterm5_bus\,
	pxor => \state[3]_pxor_bus\,
	pclk => \state[3]_pclk_bus\,
	papre => \state[3]_papre_bus\,
	paclr => \state[3]_paclr_bus\,
	pena => \state[3]_pena_bus\,
	dataout => state(3));

-- Location: LC12
\Selector7~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \Selector7~1_pterm0_bus\,
	pterm1 => \Selector7~1_pterm1_bus\,
	pterm2 => \Selector7~1_pterm2_bus\,
	pterm3 => \Selector7~1_pterm3_bus\,
	pterm4 => \Selector7~1_pterm4_bus\,
	pterm5 => \Selector7~1_pterm5_bus\,
	pxor => \Selector7~1_pxor_bus\,
	pclk => \Selector7~1_pclk_bus\,
	papre => \Selector7~1_papre_bus\,
	paclr => \Selector7~1_paclr_bus\,
	pena => \Selector7~1_pena_bus\,
	dataout => \Selector7~1_dataout\);

-- Location: LC25
\nextstate[4]~40\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \nextstate[4]~40_pterm0_bus\,
	pterm1 => \nextstate[4]~40_pterm1_bus\,
	pterm2 => \nextstate[4]~40_pterm2_bus\,
	pterm3 => \nextstate[4]~40_pterm3_bus\,
	pterm4 => \nextstate[4]~40_pterm4_bus\,
	pterm5 => \nextstate[4]~40_pterm5_bus\,
	pxor => \nextstate[4]~40_pxor_bus\,
	pclk => \nextstate[4]~40_pclk_bus\,
	papre => \nextstate[4]~40_papre_bus\,
	paclr => \nextstate[4]~40_paclr_bus\,
	pena => \nextstate[4]~40_pena_bus\,
	dataout => \nextstate[4]~40_dataout\);

-- Location: LC26
\state[4]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \clk~dataout\,
	pterm0 => \state[4]_pterm0_bus\,
	pterm1 => \state[4]_pterm1_bus\,
	pterm2 => \state[4]_pterm2_bus\,
	pterm3 => \state[4]_pterm3_bus\,
	pterm4 => \state[4]_pterm4_bus\,
	pterm5 => \state[4]_pterm5_bus\,
	pxor => \state[4]_pxor_bus\,
	pclk => \state[4]_pclk_bus\,
	papre => \state[4]_papre_bus\,
	paclr => \state[4]_paclr_bus\,
	pena => \state[4]_pena_bus\,
	dataout => state(4));

-- Location: LC7
\Selector6~16\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \Selector6~16_pterm0_bus\,
	pterm1 => \Selector6~16_pterm1_bus\,
	pterm2 => \Selector6~16_pterm2_bus\,
	pterm3 => \Selector6~16_pterm3_bus\,
	pterm4 => \Selector6~16_pterm4_bus\,
	pterm5 => \Selector6~16_pterm5_bus\,
	pxor => \Selector6~16_pxor_bus\,
	pclk => \Selector6~16_pclk_bus\,
	papre => \Selector6~16_papre_bus\,
	paclr => \Selector6~16_paclr_bus\,
	pena => \Selector6~16_pena_bus\,
	pexpout => \Selector6~16_pexpout\);

-- Location: LC8
\Selector6~9\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \Selector6~16_pexpout\,
	pterm0 => \Selector6~9_pterm0_bus\,
	pterm1 => \Selector6~9_pterm1_bus\,
	pterm2 => \Selector6~9_pterm2_bus\,
	pterm3 => \Selector6~9_pterm3_bus\,
	pterm4 => \Selector6~9_pterm4_bus\,
	pterm5 => \Selector6~9_pterm5_bus\,
	pxor => \Selector6~9_pxor_bus\,
	pclk => \Selector6~9_pclk_bus\,
	papre => \Selector6~9_papre_bus\,
	paclr => \Selector6~9_paclr_bus\,
	pena => \Selector6~9_pena_bus\,
	dataout => \Selector6~9_dataout\);

-- Location: LC17
\nextstate[0]~46\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \nextstate[0]~46_pterm0_bus\,
	pterm1 => \nextstate[0]~46_pterm1_bus\,
	pterm2 => \nextstate[0]~46_pterm2_bus\,
	pterm3 => \nextstate[0]~46_pterm3_bus\,
	pterm4 => \nextstate[0]~46_pterm4_bus\,
	pterm5 => \nextstate[0]~46_pterm5_bus\,
	pxor => \nextstate[0]~46_pxor_bus\,
	pclk => \nextstate[0]~46_pclk_bus\,
	papre => \nextstate[0]~46_papre_bus\,
	paclr => \nextstate[0]~46_paclr_bus\,
	pena => \nextstate[0]~46_pena_bus\,
	dataout => \nextstate[0]~46_dataout\);

-- Location: LC27
\state[0]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \clk~dataout\,
	pterm0 => \state[0]_pterm0_bus\,
	pterm1 => \state[0]_pterm1_bus\,
	pterm2 => \state[0]_pterm2_bus\,
	pterm3 => \state[0]_pterm3_bus\,
	pterm4 => \state[0]_pterm4_bus\,
	pterm5 => \state[0]_pterm5_bus\,
	pxor => \state[0]_pxor_bus\,
	pclk => \state[0]_pclk_bus\,
	papre => \state[0]_papre_bus\,
	paclr => \state[0]_paclr_bus\,
	pena => \state[0]_pena_bus\,
	dataout => state(0));

-- Location: LC3
\Selector4~17\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "vcc",
	output_mode => "comb",
	pexp_mode => "on")
-- pragma translate_on
PORT MAP (
	pterm0 => \Selector4~17_pterm0_bus\,
	pterm1 => \Selector4~17_pterm1_bus\,
	pterm2 => \Selector4~17_pterm2_bus\,
	pterm3 => \Selector4~17_pterm3_bus\,
	pterm4 => \Selector4~17_pterm4_bus\,
	pterm5 => \Selector4~17_pterm5_bus\,
	pxor => \Selector4~17_pxor_bus\,
	pclk => \Selector4~17_pclk_bus\,
	papre => \Selector4~17_papre_bus\,
	paclr => \Selector4~17_paclr_bus\,
	pena => \Selector4~17_pena_bus\,
	pexpout => \Selector4~17_pexpout\);

-- Location: LC4
\Selector4~10\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pexpin => \Selector4~17_pexpout\,
	pterm0 => \Selector4~10_pterm0_bus\,
	pterm1 => \Selector4~10_pterm1_bus\,
	pterm2 => \Selector4~10_pterm2_bus\,
	pterm3 => \Selector4~10_pterm3_bus\,
	pterm4 => \Selector4~10_pterm4_bus\,
	pterm5 => \Selector4~10_pterm5_bus\,
	pxor => \Selector4~10_pxor_bus\,
	pclk => \Selector4~10_pclk_bus\,
	papre => \Selector4~10_papre_bus\,
	paclr => \Selector4~10_paclr_bus\,
	pena => \Selector4~10_pena_bus\,
	dataout => \Selector4~10_dataout\);

-- Location: LC15
\nextstate[1]~22\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \nextstate[1]~22_pterm0_bus\,
	pterm1 => \nextstate[1]~22_pterm1_bus\,
	pterm2 => \nextstate[1]~22_pterm2_bus\,
	pterm3 => \nextstate[1]~22_pterm3_bus\,
	pterm4 => \nextstate[1]~22_pterm4_bus\,
	pterm5 => \nextstate[1]~22_pterm5_bus\,
	pxor => \nextstate[1]~22_pxor_bus\,
	pclk => \nextstate[1]~22_pclk_bus\,
	papre => \nextstate[1]~22_papre_bus\,
	paclr => \nextstate[1]~22_paclr_bus\,
	pena => \nextstate[1]~22_pena_bus\,
	dataout => \nextstate[1]~22_dataout\);

-- Location: LC10
\state[1]\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	clk => \clk~dataout\,
	pterm0 => \state[1]_pterm0_bus\,
	pterm1 => \state[1]_pterm1_bus\,
	pterm2 => \state[1]_pterm2_bus\,
	pterm3 => \state[1]_pterm3_bus\,
	pterm4 => \state[1]_pterm4_bus\,
	pterm5 => \state[1]_pterm5_bus\,
	pxor => \state[1]_pxor_bus\,
	pclk => \state[1]_pclk_bus\,
	papre => \state[1]_papre_bus\,
	paclr => \state[1]_paclr_bus\,
	pena => \state[1]_pena_bus\,
	dataout => state(1));

-- Location: LC14
\Equal10~6\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \Equal10~6_pterm0_bus\,
	pterm1 => \Equal10~6_pterm1_bus\,
	pterm2 => \Equal10~6_pterm2_bus\,
	pterm3 => \Equal10~6_pterm3_bus\,
	pterm4 => \Equal10~6_pterm4_bus\,
	pterm5 => \Equal10~6_pterm5_bus\,
	pxor => \Equal10~6_pxor_bus\,
	pclk => \Equal10~6_pclk_bus\,
	papre => \Equal10~6_papre_bus\,
	paclr => \Equal10~6_paclr_bus\,
	pena => \Equal10~6_pena_bus\,
	dataout => \Equal10~6_dataout\);

-- Location: PIN_14
\q[1]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => state(1),
	oe => VCC,
	padio => ww_q(1));

-- Location: PIN_16
\q[2]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => state(2),
	oe => VCC,
	padio => ww_q(2));

-- Location: PIN_18
\q[3]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => state(3),
	oe => VCC,
	padio => ww_q(3));

-- Location: PIN_31
\q[4]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => state(4),
	oe => VCC,
	padio => ww_q(4));

-- Location: PIN_19
\UNLOCK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \Equal10~6_dataout\,
	oe => VCC,
	padio => ww_UNLOCK);

-- Location: PIN_29
\q[0]~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => state(0),
	oe => VCC,
	padio => ww_q(0));
END structure;


