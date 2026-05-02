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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/02/2026 17:01:45"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	memory_system_top IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	addr : IN std_logic_vector(3 DOWNTO 0);
	data_in : IN std_logic_vector(7 DOWNTO 0);
	we : IN std_logic;
	re : IN std_logic;
	data_out : OUT std_logic_vector(7 DOWNTO 0);
	done : OUT std_logic;
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END memory_system_top;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[1]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[2]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[3]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- we	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- re	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF memory_system_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_addr : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_we : std_logic;
SIGNAL ww_re : std_logic;
SIGNAL ww_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_out[0]~output_o\ : std_logic;
SIGNAL \data_out[1]~output_o\ : std_logic;
SIGNAL \data_out[2]~output_o\ : std_logic;
SIGNAL \data_out[3]~output_o\ : std_logic;
SIGNAL \data_out[4]~output_o\ : std_logic;
SIGNAL \data_out[5]~output_o\ : std_logic;
SIGNAL \data_out[6]~output_o\ : std_logic;
SIGNAL \data_out[7]~output_o\ : std_logic;
SIGNAL \done~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \u_ctrl|state.IDLE~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.IDLE~q\ : std_logic;
SIGNAL \u_ctrl|Selector3~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector3~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector5~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector5~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector4~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector4~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector2~1_combout\ : std_logic;
SIGNAL \u_ctrl|Equal0~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector7~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.READ_ROM~q\ : std_logic;
SIGNAL \u_ctrl|state~12_combout\ : std_logic;
SIGNAL \u_ctrl|state.WAIT_ROM~q\ : std_logic;
SIGNAL \u_ctrl|state~11_combout\ : std_logic;
SIGNAL \u_ctrl|state.WAIT_ROM2~q\ : std_logic;
SIGNAL \u_ctrl|state~9_combout\ : std_logic;
SIGNAL \u_ctrl|state.WRITE_RAM~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|state.WRITE_RAM~q\ : std_logic;
SIGNAL \u_ctrl|state~10_combout\ : std_logic;
SIGNAL \u_ctrl|state.READ_RAM~q\ : std_logic;
SIGNAL \u_ctrl|Selector12~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.ST_DONE~q\ : std_logic;
SIGNAL \we~input_o\ : std_logic;
SIGNAL \u_ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_we~q\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[0]~feeder_combout\ : std_logic;
SIGNAL \addr[3]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_addr~6_combout\ : std_logic;
SIGNAL \u_ctrl|ram_addr~7_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[7]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[8]~feeder_combout\ : std_logic;
SIGNAL \addr[2]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_addr~4_combout\ : std_logic;
SIGNAL \u_ctrl|ram_addr~5_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[5]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem~14_combout\ : std_logic;
SIGNAL \addr[0]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_addr~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_addr~1_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[2]~feeder_combout\ : std_logic;
SIGNAL \addr[1]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_addr~2_combout\ : std_logic;
SIGNAL \u_ctrl|ram_addr~3_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[3]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem~13_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem~15_combout\ : std_logic;
SIGNAL \u_ctrl|rom_addr~4_combout\ : std_logic;
SIGNAL \u_ctrl|rom_addr[0]~1_combout\ : std_logic;
SIGNAL \u_ctrl|rom_addr~2_combout\ : std_logic;
SIGNAL \u_ctrl|rom_addr~3_combout\ : std_logic;
SIGNAL \u_ctrl|rom_addr~0_combout\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux7~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_re~2_combout\ : std_logic;
SIGNAL \u_ctrl|rom_re~q\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[0]~feeder_combout\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_din~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_din[1]~1_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[9]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux6~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[1]~feeder_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_din~2_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux5~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[2]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|ram_din~3_combout\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux4~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[3]~feeder_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_din~4_combout\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux3~0_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_din~5_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux2~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_din~6_combout\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux1~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[6]~feeder_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \u_ctrl|ram_din~7_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \u_ctrl|u_rom|Mux0~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_din~8_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~0_combout\ : std_logic;
SIGNAL \re~input_o\ : std_logic;
SIGNAL \u_ctrl|Selector1~0_combout\ : std_logic;
SIGNAL \u_ctrl|ram_re~q\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg[3]~1_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[10]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~2_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[11]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~3_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[12]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~4_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass[13]~feeder_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~5_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~6_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~7_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~8_combout\ : std_logic;
SIGNAL \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \u_ctrl|u_ram|q_reg~9_combout\ : std_logic;
SIGNAL \u_ctrl|Selector6~0_combout\ : std_logic;
SIGNAL \u_ctrl|done_reg~q\ : std_logic;
SIGNAL \u_hex0|Mux6~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux5~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux4~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux3~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux2~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux1~0_combout\ : std_logic;
SIGNAL \u_hex0|Mux0~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux6~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux5~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux4~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux3~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux2~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux1~0_combout\ : std_logic;
SIGNAL \u_hex1|Mux0~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|rom_addr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|ram_din\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|ram_addr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|addr_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|u_rom|q_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|q_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|u_ram|mem_rtl_0_bypass\ : std_logic_vector(0 TO 16);
SIGNAL \u_hex1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \u_hex0|ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_addr <= addr;
ww_data_in <= data_in;
ww_we <= we;
ww_re <= re;
data_out <= ww_data_out;
done <= ww_done;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
\u_ctrl|ram_din\(7) & \u_ctrl|ram_din\(6) & \u_ctrl|ram_din\(5) & \u_ctrl|ram_din\(4) & \u_ctrl|ram_din\(3) & \u_ctrl|ram_din\(2) & \u_ctrl|ram_din\(1) & \u_ctrl|ram_din\(0));

\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\u_ctrl|ram_addr\(3) & \u_ctrl|ram_addr\(2) & \u_ctrl|ram_addr\(1) & \u_ctrl|ram_addr\(0));

\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\u_ctrl|ram_addr~7_combout\ & \u_ctrl|ram_addr~5_combout\ & \u_ctrl|ram_addr~3_combout\ & \u_ctrl|ram_addr~1_combout\);

\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a1\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a2\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a3\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a4\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a6\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a7\ <= \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\u_hex1|ALT_INV_Mux0~0_combout\ <= NOT \u_hex1|Mux0~0_combout\;
\u_hex0|ALT_INV_Mux0~0_combout\ <= NOT \u_hex0|Mux0~0_combout\;

-- Location: IOOBUF_X23_Y0_N9
\data_out[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(0),
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\data_out[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(1),
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X19_Y0_N2
\data_out[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(2),
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N30
\data_out[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(3),
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\data_out[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(4),
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X11_Y0_N30
\data_out[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(5),
	devoe => ww_devoe,
	o => \data_out[5]~output_o\);

-- Location: IOOBUF_X19_Y0_N16
\data_out[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(6),
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X19_Y0_N9
\data_out[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|u_ram|q_reg\(7),
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\done~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ctrl|done_reg~q\,
	devoe => ww_devoe,
	o => \done~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\HEX0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N30
\HEX0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X19_Y0_N30
\HEX0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X23_Y0_N2
\HEX0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\HEX0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X23_Y0_N30
\HEX0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X19_Y0_N23
\HEX0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex0|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X16_Y0_N30
\HEX1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\HEX1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X14_Y0_N16
\HEX1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\HEX1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\HEX1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\HEX1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\HEX1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_hex1|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X21_Y0_N8
\rst~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X29_Y3_N10
\u_ctrl|state.IDLE~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state.IDLE~0_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	combout => \u_ctrl|state.IDLE~0_combout\);

-- Location: FF_X29_Y3_N11
\u_ctrl|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state.IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.IDLE~q\);

-- Location: LCCOMB_X28_Y3_N24
\u_ctrl|Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector3~0_combout\ = (\u_ctrl|addr_cnt\(2) & ((\u_ctrl|addr_cnt\(3)) # ((!\u_ctrl|addr_cnt\(1)) # (!\u_ctrl|addr_cnt\(0))))) # (!\u_ctrl|addr_cnt\(2) & (((\u_ctrl|addr_cnt\(0) & \u_ctrl|addr_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(2),
	datab => \u_ctrl|addr_cnt\(3),
	datac => \u_ctrl|addr_cnt\(0),
	datad => \u_ctrl|addr_cnt\(1),
	combout => \u_ctrl|Selector3~0_combout\);

-- Location: LCCOMB_X29_Y3_N24
\u_ctrl|Selector3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector3~1_combout\ = (\u_ctrl|state.READ_RAM~q\ & (\u_ctrl|Selector3~0_combout\)) # (!\u_ctrl|state.READ_RAM~q\ & (((\u_ctrl|addr_cnt\(2) & \u_ctrl|state.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.READ_RAM~q\,
	datab => \u_ctrl|Selector3~0_combout\,
	datac => \u_ctrl|addr_cnt\(2),
	datad => \u_ctrl|state.IDLE~q\,
	combout => \u_ctrl|Selector3~1_combout\);

-- Location: FF_X29_Y3_N25
\u_ctrl|addr_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector3~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|addr_cnt\(2));

-- Location: LCCOMB_X29_Y3_N18
\u_ctrl|Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector5~0_combout\ = (\u_ctrl|addr_cnt\(3) & (\u_ctrl|addr_cnt\(2) & (\u_ctrl|state.READ_RAM~q\ & \u_ctrl|addr_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(3),
	datab => \u_ctrl|addr_cnt\(2),
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|addr_cnt\(1),
	combout => \u_ctrl|Selector5~0_combout\);

-- Location: LCCOMB_X29_Y3_N8
\u_ctrl|Selector5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector5~1_combout\ = (\u_ctrl|Selector5~0_combout\) # ((\u_ctrl|state.READ_RAM~q\ & (!\u_ctrl|addr_cnt\(0))) # (!\u_ctrl|state.READ_RAM~q\ & (\u_ctrl|addr_cnt\(0) & \u_ctrl|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.READ_RAM~q\,
	datab => \u_ctrl|Selector5~0_combout\,
	datac => \u_ctrl|addr_cnt\(0),
	datad => \u_ctrl|state.IDLE~q\,
	combout => \u_ctrl|Selector5~1_combout\);

-- Location: FF_X29_Y3_N9
\u_ctrl|addr_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector5~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|addr_cnt\(0));

-- Location: LCCOMB_X29_Y3_N28
\u_ctrl|Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector4~0_combout\ = (\u_ctrl|state.READ_RAM~q\ & ((\u_ctrl|addr_cnt\(0) $ (\u_ctrl|addr_cnt\(1))))) # (!\u_ctrl|state.READ_RAM~q\ & (\u_ctrl|state.IDLE~q\ & ((\u_ctrl|addr_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.IDLE~q\,
	datab => \u_ctrl|addr_cnt\(0),
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|addr_cnt\(1),
	combout => \u_ctrl|Selector4~0_combout\);

-- Location: LCCOMB_X29_Y3_N6
\u_ctrl|Selector4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector4~1_combout\ = (\u_ctrl|Selector4~0_combout\) # ((\u_ctrl|state.READ_RAM~q\ & \u_ctrl|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|Selector4~0_combout\,
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|Equal0~0_combout\,
	combout => \u_ctrl|Selector4~1_combout\);

-- Location: FF_X29_Y3_N7
\u_ctrl|addr_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector4~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|addr_cnt\(1));

-- Location: LCCOMB_X29_Y3_N14
\u_ctrl|Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector2~0_combout\ = (\u_ctrl|addr_cnt\(1) & (\u_ctrl|addr_cnt\(0) & (\u_ctrl|state.READ_RAM~q\ & \u_ctrl|addr_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(1),
	datab => \u_ctrl|addr_cnt\(0),
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|addr_cnt\(2),
	combout => \u_ctrl|Selector2~0_combout\);

-- Location: LCCOMB_X29_Y3_N26
\u_ctrl|Selector2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector2~1_combout\ = (\u_ctrl|Selector2~0_combout\) # ((\u_ctrl|addr_cnt\(3) & ((\u_ctrl|state.READ_RAM~q\) # (\u_ctrl|state.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.READ_RAM~q\,
	datab => \u_ctrl|Selector2~0_combout\,
	datac => \u_ctrl|addr_cnt\(3),
	datad => \u_ctrl|state.IDLE~q\,
	combout => \u_ctrl|Selector2~1_combout\);

-- Location: FF_X29_Y3_N27
\u_ctrl|addr_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector2~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|addr_cnt\(3));

-- Location: LCCOMB_X29_Y3_N16
\u_ctrl|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Equal0~0_combout\ = (\u_ctrl|addr_cnt\(3) & (\u_ctrl|addr_cnt\(2) & (\u_ctrl|addr_cnt\(0) & \u_ctrl|addr_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(3),
	datab => \u_ctrl|addr_cnt\(2),
	datac => \u_ctrl|addr_cnt\(0),
	datad => \u_ctrl|addr_cnt\(1),
	combout => \u_ctrl|Equal0~0_combout\);

-- Location: LCCOMB_X29_Y3_N4
\u_ctrl|Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector7~0_combout\ = ((\u_ctrl|state.READ_RAM~q\ & !\u_ctrl|Equal0~0_combout\)) # (!\u_ctrl|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.IDLE~q\,
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|Equal0~0_combout\,
	combout => \u_ctrl|Selector7~0_combout\);

-- Location: FF_X29_Y3_N5
\u_ctrl|state.READ_ROM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector7~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.READ_ROM~q\);

-- Location: LCCOMB_X28_Y3_N10
\u_ctrl|state~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~12_combout\ = (!\rst~input_o\ & \u_ctrl|state.READ_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|state.READ_ROM~q\,
	combout => \u_ctrl|state~12_combout\);

-- Location: FF_X28_Y3_N11
\u_ctrl|state.WAIT_ROM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.WAIT_ROM~q\);

-- Location: LCCOMB_X28_Y3_N28
\u_ctrl|state~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~11_combout\ = (!\rst~input_o\ & \u_ctrl|state.WAIT_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|state.WAIT_ROM~q\,
	combout => \u_ctrl|state~11_combout\);

-- Location: FF_X28_Y3_N29
\u_ctrl|state.WAIT_ROM2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.WAIT_ROM2~q\);

-- Location: LCCOMB_X28_Y3_N6
\u_ctrl|state~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~9_combout\ = (!\rst~input_o\ & \u_ctrl|state.WAIT_ROM2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|state.WAIT_ROM2~q\,
	combout => \u_ctrl|state~9_combout\);

-- Location: LCCOMB_X28_Y3_N22
\u_ctrl|state.WRITE_RAM~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state.WRITE_RAM~feeder_combout\ = \u_ctrl|state~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|state~9_combout\,
	combout => \u_ctrl|state.WRITE_RAM~feeder_combout\);

-- Location: FF_X28_Y3_N23
\u_ctrl|state.WRITE_RAM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state.WRITE_RAM~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.WRITE_RAM~q\);

-- Location: LCCOMB_X26_Y3_N16
\u_ctrl|state~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~10_combout\ = (!\rst~input_o\ & \u_ctrl|state.WRITE_RAM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \u_ctrl|state.WRITE_RAM~q\,
	combout => \u_ctrl|state~10_combout\);

-- Location: FF_X26_Y3_N17
\u_ctrl|state.READ_RAM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.READ_RAM~q\);

-- Location: LCCOMB_X29_Y3_N30
\u_ctrl|Selector12~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector12~0_combout\ = (\u_ctrl|state.ST_DONE~q\) # ((\u_ctrl|state.READ_RAM~q\ & \u_ctrl|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.READ_RAM~q\,
	datac => \u_ctrl|state.ST_DONE~q\,
	datad => \u_ctrl|Equal0~0_combout\,
	combout => \u_ctrl|Selector12~0_combout\);

-- Location: FF_X29_Y3_N31
\u_ctrl|state.ST_DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector12~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.ST_DONE~q\);

-- Location: IOIBUF_X30_Y0_N15
\we~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_we,
	o => \we~input_o\);

-- Location: LCCOMB_X26_Y3_N20
\u_ctrl|Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector0~0_combout\ = (\u_ctrl|state.WRITE_RAM~q\) # ((\u_ctrl|state.ST_DONE~q\ & \we~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.ST_DONE~q\,
	datac => \u_ctrl|state.WRITE_RAM~q\,
	datad => \we~input_o\,
	combout => \u_ctrl|Selector0~0_combout\);

-- Location: FF_X26_Y3_N21
\u_ctrl|ram_we\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector0~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_we~q\);

-- Location: LCCOMB_X26_Y4_N22
\u_ctrl|u_ram|mem_rtl_0_bypass[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[0]~feeder_combout\ = \u_ctrl|ram_we~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_we~q\,
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[0]~feeder_combout\);

-- Location: FF_X26_Y4_N23
\u_ctrl|u_ram|mem_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(0));

-- Location: IOIBUF_X30_Y0_N1
\addr[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(3),
	o => \addr[3]~input_o\);

-- Location: LCCOMB_X29_Y3_N22
\u_ctrl|ram_addr~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~6_combout\ = (\u_ctrl|state.READ_RAM~q\ & (((\u_ctrl|addr_cnt\(3))))) # (!\u_ctrl|state.READ_RAM~q\ & ((\u_ctrl|state.WRITE_RAM~q\ & ((\u_ctrl|addr_cnt\(3)))) # (!\u_ctrl|state.WRITE_RAM~q\ & (\u_ctrl|ram_addr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.READ_RAM~q\,
	datab => \u_ctrl|ram_addr\(3),
	datac => \u_ctrl|addr_cnt\(3),
	datad => \u_ctrl|state.WRITE_RAM~q\,
	combout => \u_ctrl|ram_addr~6_combout\);

-- Location: LCCOMB_X29_Y3_N2
\u_ctrl|ram_addr~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~7_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.ST_DONE~q\ & (\addr[3]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|ram_addr~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \addr[3]~input_o\,
	datac => \u_ctrl|ram_addr~6_combout\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_addr~7_combout\);

-- Location: FF_X29_Y3_N3
\u_ctrl|ram_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_addr~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_addr\(3));

-- Location: LCCOMB_X26_Y4_N26
\u_ctrl|u_ram|mem_rtl_0_bypass[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[7]~feeder_combout\ = \u_ctrl|ram_addr\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_addr\(3),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[7]~feeder_combout\);

-- Location: FF_X26_Y4_N27
\u_ctrl|u_ram|mem_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(7));

-- Location: LCCOMB_X26_Y4_N16
\u_ctrl|u_ram|mem_rtl_0_bypass[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[8]~feeder_combout\ = \u_ctrl|ram_addr~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_addr~7_combout\,
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[8]~feeder_combout\);

-- Location: FF_X26_Y4_N17
\u_ctrl|u_ram|mem_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(8));

-- Location: IOIBUF_X26_Y0_N22
\addr[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(2),
	o => \addr[2]~input_o\);

-- Location: FF_X26_Y3_N11
\u_ctrl|ram_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_addr~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_addr\(2));

-- Location: LCCOMB_X26_Y3_N8
\u_ctrl|ram_addr~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~4_combout\ = (\u_ctrl|state.READ_RAM~q\ & (((\u_ctrl|addr_cnt\(2))))) # (!\u_ctrl|state.READ_RAM~q\ & ((\u_ctrl|state.WRITE_RAM~q\ & ((\u_ctrl|addr_cnt\(2)))) # (!\u_ctrl|state.WRITE_RAM~q\ & (\u_ctrl|ram_addr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|ram_addr\(2),
	datab => \u_ctrl|state.READ_RAM~q\,
	datac => \u_ctrl|state.WRITE_RAM~q\,
	datad => \u_ctrl|addr_cnt\(2),
	combout => \u_ctrl|ram_addr~4_combout\);

-- Location: LCCOMB_X26_Y3_N10
\u_ctrl|ram_addr~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~5_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.ST_DONE~q\ & (\addr[2]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|ram_addr~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr[2]~input_o\,
	datab => \rst~input_o\,
	datac => \u_ctrl|ram_addr~4_combout\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_addr~5_combout\);

-- Location: FF_X26_Y4_N3
\u_ctrl|u_ram|mem_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_addr~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(6));

-- Location: LCCOMB_X26_Y4_N12
\u_ctrl|u_ram|mem_rtl_0_bypass[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[5]~feeder_combout\ = \u_ctrl|ram_addr\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_ctrl|ram_addr\(2),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[5]~feeder_combout\);

-- Location: FF_X26_Y4_N13
\u_ctrl|u_ram|mem_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(5));

-- Location: LCCOMB_X26_Y4_N2
\u_ctrl|u_ram|mem~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem~14_combout\ = (\u_ctrl|u_ram|mem_rtl_0_bypass\(7) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(8) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(6) $ (!\u_ctrl|u_ram|mem_rtl_0_bypass\(5))))) # (!\u_ctrl|u_ram|mem_rtl_0_bypass\(7) & 
-- (!\u_ctrl|u_ram|mem_rtl_0_bypass\(8) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(6) $ (!\u_ctrl|u_ram|mem_rtl_0_bypass\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0_bypass\(7),
	datab => \u_ctrl|u_ram|mem_rtl_0_bypass\(8),
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(6),
	datad => \u_ctrl|u_ram|mem_rtl_0_bypass\(5),
	combout => \u_ctrl|u_ram|mem~14_combout\);

-- Location: IOIBUF_X21_Y0_N1
\addr[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(0),
	o => \addr[0]~input_o\);

-- Location: LCCOMB_X26_Y3_N26
\u_ctrl|ram_addr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~0_combout\ = (\u_ctrl|state.WRITE_RAM~q\ & (\u_ctrl|addr_cnt\(0))) # (!\u_ctrl|state.WRITE_RAM~q\ & ((\u_ctrl|state.READ_RAM~q\ & (\u_ctrl|addr_cnt\(0))) # (!\u_ctrl|state.READ_RAM~q\ & ((\u_ctrl|ram_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(0),
	datab => \u_ctrl|ram_addr\(0),
	datac => \u_ctrl|state.WRITE_RAM~q\,
	datad => \u_ctrl|state.READ_RAM~q\,
	combout => \u_ctrl|ram_addr~0_combout\);

-- Location: LCCOMB_X26_Y3_N24
\u_ctrl|ram_addr~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~1_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.ST_DONE~q\ & (\addr[0]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|ram_addr~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr[0]~input_o\,
	datab => \rst~input_o\,
	datac => \u_ctrl|ram_addr~0_combout\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_addr~1_combout\);

-- Location: FF_X26_Y3_N25
\u_ctrl|ram_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_addr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_addr\(0));

-- Location: FF_X26_Y4_N31
\u_ctrl|u_ram|mem_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_addr\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(1));

-- Location: LCCOMB_X26_Y4_N24
\u_ctrl|u_ram|mem_rtl_0_bypass[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[2]~feeder_combout\ = \u_ctrl|ram_addr~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_addr~1_combout\,
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[2]~feeder_combout\);

-- Location: FF_X26_Y4_N25
\u_ctrl|u_ram|mem_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(2));

-- Location: IOIBUF_X32_Y0_N1
\addr[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(1),
	o => \addr[1]~input_o\);

-- Location: FF_X29_Y3_N1
\u_ctrl|ram_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_addr~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_addr\(1));

-- Location: LCCOMB_X29_Y3_N20
\u_ctrl|ram_addr~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~2_combout\ = (\u_ctrl|state.READ_RAM~q\ & (\u_ctrl|addr_cnt\(1))) # (!\u_ctrl|state.READ_RAM~q\ & ((\u_ctrl|state.WRITE_RAM~q\ & (\u_ctrl|addr_cnt\(1))) # (!\u_ctrl|state.WRITE_RAM~q\ & ((\u_ctrl|ram_addr\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_cnt\(1),
	datab => \u_ctrl|ram_addr\(1),
	datac => \u_ctrl|state.READ_RAM~q\,
	datad => \u_ctrl|state.WRITE_RAM~q\,
	combout => \u_ctrl|ram_addr~2_combout\);

-- Location: LCCOMB_X29_Y3_N0
\u_ctrl|ram_addr~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_addr~3_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.ST_DONE~q\ & (\addr[1]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|ram_addr~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr[1]~input_o\,
	datab => \u_ctrl|state.ST_DONE~q\,
	datac => \rst~input_o\,
	datad => \u_ctrl|ram_addr~2_combout\,
	combout => \u_ctrl|ram_addr~3_combout\);

-- Location: FF_X26_Y4_N19
\u_ctrl|u_ram|mem_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_addr~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(4));

-- Location: LCCOMB_X26_Y4_N28
\u_ctrl|u_ram|mem_rtl_0_bypass[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[3]~feeder_combout\ = \u_ctrl|ram_addr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_addr\(1),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[3]~feeder_combout\);

-- Location: FF_X26_Y4_N29
\u_ctrl|u_ram|mem_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(3));

-- Location: LCCOMB_X26_Y4_N18
\u_ctrl|u_ram|mem~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem~13_combout\ = (\u_ctrl|u_ram|mem_rtl_0_bypass\(1) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(2) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(4) $ (!\u_ctrl|u_ram|mem_rtl_0_bypass\(3))))) # (!\u_ctrl|u_ram|mem_rtl_0_bypass\(1) & 
-- (!\u_ctrl|u_ram|mem_rtl_0_bypass\(2) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(4) $ (!\u_ctrl|u_ram|mem_rtl_0_bypass\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0_bypass\(1),
	datab => \u_ctrl|u_ram|mem_rtl_0_bypass\(2),
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(4),
	datad => \u_ctrl|u_ram|mem_rtl_0_bypass\(3),
	combout => \u_ctrl|u_ram|mem~13_combout\);

-- Location: LCCOMB_X26_Y4_N20
\u_ctrl|u_ram|mem~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem~15_combout\ = (\u_ctrl|u_ram|mem_rtl_0_bypass\(0) & (\u_ctrl|u_ram|mem~14_combout\ & \u_ctrl|u_ram|mem~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0_bypass\(0),
	datab => \u_ctrl|u_ram|mem~14_combout\,
	datad => \u_ctrl|u_ram|mem~13_combout\,
	combout => \u_ctrl|u_ram|mem~15_combout\);

-- Location: LCCOMB_X28_Y3_N2
\u_ctrl|rom_addr~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_addr~4_combout\ = (!\rst~input_o\ & \u_ctrl|addr_cnt\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|addr_cnt\(3),
	combout => \u_ctrl|rom_addr~4_combout\);

-- Location: LCCOMB_X28_Y3_N8
\u_ctrl|rom_addr[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_addr[0]~1_combout\ = (\rst~input_o\) # (\u_ctrl|state.READ_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|state.READ_ROM~q\,
	combout => \u_ctrl|rom_addr[0]~1_combout\);

-- Location: FF_X28_Y3_N3
\u_ctrl|rom_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_addr~4_combout\,
	ena => \u_ctrl|rom_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_addr\(3));

-- Location: LCCOMB_X28_Y3_N26
\u_ctrl|rom_addr~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_addr~2_combout\ = (!\rst~input_o\ & \u_ctrl|addr_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datad => \u_ctrl|addr_cnt\(1),
	combout => \u_ctrl|rom_addr~2_combout\);

-- Location: FF_X28_Y3_N27
\u_ctrl|rom_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_addr~2_combout\,
	ena => \u_ctrl|rom_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_addr\(1));

-- Location: LCCOMB_X28_Y3_N0
\u_ctrl|rom_addr~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_addr~3_combout\ = (!\rst~input_o\ & \u_ctrl|addr_cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \u_ctrl|addr_cnt\(2),
	combout => \u_ctrl|rom_addr~3_combout\);

-- Location: FF_X28_Y3_N1
\u_ctrl|rom_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_addr~3_combout\,
	ena => \u_ctrl|rom_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_addr\(2));

-- Location: LCCOMB_X28_Y3_N4
\u_ctrl|rom_addr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_addr~0_combout\ = (!\rst~input_o\ & \u_ctrl|addr_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \u_ctrl|addr_cnt\(0),
	combout => \u_ctrl|rom_addr~0_combout\);

-- Location: FF_X28_Y3_N5
\u_ctrl|rom_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_addr~0_combout\,
	ena => \u_ctrl|rom_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_addr\(0));

-- Location: LCCOMB_X27_Y3_N28
\u_ctrl|u_rom|Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux7~0_combout\ = (\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(1) & (\u_ctrl|rom_addr\(2) & \u_ctrl|rom_addr\(0)))) # (!\u_ctrl|rom_addr\(3) & ((\u_ctrl|rom_addr\(2) $ (\u_ctrl|rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux7~0_combout\);

-- Location: LCCOMB_X28_Y3_N12
\u_ctrl|rom_re~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_re~2_combout\ = (\u_ctrl|state.WAIT_ROM~q\) # (\u_ctrl|state.READ_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.WAIT_ROM~q\,
	datad => \u_ctrl|state.READ_ROM~q\,
	combout => \u_ctrl|rom_re~2_combout\);

-- Location: FF_X28_Y3_N13
\u_ctrl|rom_re\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_re~2_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_re~q\);

-- Location: FF_X27_Y3_N29
\u_ctrl|u_rom|q_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux7~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(0));

-- Location: LCCOMB_X27_Y3_N20
\u_ctrl|rom_data_reg[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[0]~feeder_combout\ = \u_ctrl|u_rom|q_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|u_rom|q_reg\(0),
	combout => \u_ctrl|rom_data_reg[0]~feeder_combout\);

-- Location: FF_X27_Y3_N21
\u_ctrl|rom_data_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg[0]~feeder_combout\,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(0));

-- Location: IOIBUF_X26_Y0_N15
\data_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X26_Y3_N0
\u_ctrl|ram_din~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~0_combout\ = (\u_ctrl|state.ST_DONE~q\ & ((\data_in[0]~input_o\))) # (!\u_ctrl|state.ST_DONE~q\ & (\u_ctrl|rom_data_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_data_reg\(0),
	datac => \data_in[0]~input_o\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~0_combout\);

-- Location: LCCOMB_X26_Y3_N22
\u_ctrl|ram_din[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din[1]~1_combout\ = (\rst~input_o\) # ((\u_ctrl|state.WRITE_RAM~q\) # (\u_ctrl|state.ST_DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~input_o\,
	datac => \u_ctrl|state.WRITE_RAM~q\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din[1]~1_combout\);

-- Location: FF_X26_Y3_N1
\u_ctrl|ram_din[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~0_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(0));

-- Location: LCCOMB_X24_Y4_N8
\u_ctrl|u_ram|mem_rtl_0_bypass[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[9]~feeder_combout\ = \u_ctrl|ram_din\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_din\(0),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[9]~feeder_combout\);

-- Location: FF_X24_Y4_N9
\u_ctrl|u_ram|mem_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(9));

-- Location: LCCOMB_X27_Y3_N18
\u_ctrl|u_rom|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux6~0_combout\ = (\u_ctrl|rom_addr\(3) & (((\u_ctrl|rom_addr\(1) & \u_ctrl|rom_addr\(2))) # (!\u_ctrl|rom_addr\(0)))) # (!\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(1) $ (((!\u_ctrl|rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux6~0_combout\);

-- Location: FF_X27_Y3_N19
\u_ctrl|u_rom|q_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux6~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(1));

-- Location: LCCOMB_X27_Y3_N6
\u_ctrl|rom_data_reg[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[1]~feeder_combout\ = \u_ctrl|u_rom|q_reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|u_rom|q_reg\(1),
	combout => \u_ctrl|rom_data_reg[1]~feeder_combout\);

-- Location: FF_X27_Y3_N7
\u_ctrl|rom_data_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg[1]~feeder_combout\,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(1));

-- Location: IOIBUF_X26_Y0_N29
\data_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X26_Y3_N14
\u_ctrl|ram_din~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~2_combout\ = (\u_ctrl|state.ST_DONE~q\ & ((\data_in[1]~input_o\))) # (!\u_ctrl|state.ST_DONE~q\ & (\u_ctrl|rom_data_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_data_reg\(1),
	datab => \data_in[1]~input_o\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~2_combout\);

-- Location: FF_X26_Y3_N15
\u_ctrl|ram_din[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~2_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(1));

-- Location: IOIBUF_X30_Y0_N22
\data_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: LCCOMB_X27_Y3_N12
\u_ctrl|u_rom|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux5~0_combout\ = (\u_ctrl|rom_addr\(3) & ((\u_ctrl|rom_addr\(1) & ((\u_ctrl|rom_addr\(2)) # (!\u_ctrl|rom_addr\(0)))) # (!\u_ctrl|rom_addr\(1) & ((\u_ctrl|rom_addr\(0)))))) # (!\u_ctrl|rom_addr\(3) & ((\u_ctrl|rom_addr\(2) $ 
-- (\u_ctrl|rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux5~0_combout\);

-- Location: FF_X27_Y3_N13
\u_ctrl|u_rom|q_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux5~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(2));

-- Location: LCCOMB_X27_Y3_N16
\u_ctrl|rom_data_reg[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[2]~feeder_combout\ = \u_ctrl|u_rom|q_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|u_rom|q_reg\(2),
	combout => \u_ctrl|rom_data_reg[2]~feeder_combout\);

-- Location: FF_X27_Y3_N17
\u_ctrl|rom_data_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg[2]~feeder_combout\,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(2));

-- Location: LCCOMB_X26_Y3_N12
\u_ctrl|ram_din~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~3_combout\ = (\u_ctrl|state.ST_DONE~q\ & (\data_in[2]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|rom_data_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_in[2]~input_o\,
	datab => \u_ctrl|rom_data_reg\(2),
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~3_combout\);

-- Location: FF_X26_Y3_N13
\u_ctrl|ram_din[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~3_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(2));

-- Location: LCCOMB_X27_Y3_N10
\u_ctrl|u_rom|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux4~0_combout\ = (\u_ctrl|rom_addr\(3) & ((\u_ctrl|rom_addr\(2)) # ((\u_ctrl|rom_addr\(1) & \u_ctrl|rom_addr\(0))))) # (!\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(1) $ (((!\u_ctrl|rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux4~0_combout\);

-- Location: FF_X27_Y3_N11
\u_ctrl|u_rom|q_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux4~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(3));

-- Location: LCCOMB_X27_Y3_N2
\u_ctrl|rom_data_reg[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[3]~feeder_combout\ = \u_ctrl|u_rom|q_reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|u_rom|q_reg\(3),
	combout => \u_ctrl|rom_data_reg[3]~feeder_combout\);

-- Location: FF_X27_Y3_N3
\u_ctrl|rom_data_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg[3]~feeder_combout\,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(3));

-- Location: IOIBUF_X26_Y0_N8
\data_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: LCCOMB_X26_Y3_N6
\u_ctrl|ram_din~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~4_combout\ = (\u_ctrl|state.ST_DONE~q\ & ((\data_in[3]~input_o\))) # (!\u_ctrl|state.ST_DONE~q\ & (\u_ctrl|rom_data_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_data_reg\(3),
	datac => \data_in[3]~input_o\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~4_combout\);

-- Location: FF_X26_Y3_N7
\u_ctrl|ram_din[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~4_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(3));

-- Location: LCCOMB_X27_Y3_N4
\u_ctrl|u_rom|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux3~0_combout\ = (\u_ctrl|rom_addr\(3) & (((!\u_ctrl|rom_addr\(0)) # (!\u_ctrl|rom_addr\(2))) # (!\u_ctrl|rom_addr\(1)))) # (!\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(1) $ (\u_ctrl|rom_addr\(2) $ (\u_ctrl|rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux3~0_combout\);

-- Location: FF_X27_Y3_N5
\u_ctrl|u_rom|q_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux3~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(4));

-- Location: FF_X27_Y3_N1
\u_ctrl|rom_data_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|u_rom|q_reg\(4),
	sload => VCC,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(4));

-- Location: IOIBUF_X30_Y0_N8
\data_in[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: LCCOMB_X26_Y3_N4
\u_ctrl|ram_din~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~5_combout\ = (\u_ctrl|state.ST_DONE~q\ & ((\data_in[4]~input_o\))) # (!\u_ctrl|state.ST_DONE~q\ & (\u_ctrl|rom_data_reg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.ST_DONE~q\,
	datac => \u_ctrl|rom_data_reg\(4),
	datad => \data_in[4]~input_o\,
	combout => \u_ctrl|ram_din~5_combout\);

-- Location: FF_X26_Y3_N5
\u_ctrl|ram_din[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~5_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(4));

-- Location: IOIBUF_X28_Y0_N8
\data_in[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: LCCOMB_X27_Y3_N22
\u_ctrl|u_rom|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux2~0_combout\ = \u_ctrl|rom_addr\(3) $ (!\u_ctrl|rom_addr\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux2~0_combout\);

-- Location: FF_X27_Y3_N23
\u_ctrl|u_rom|q_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux2~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(5));

-- Location: FF_X27_Y3_N31
\u_ctrl|rom_data_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|u_rom|q_reg\(5),
	sload => VCC,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(5));

-- Location: LCCOMB_X26_Y3_N2
\u_ctrl|ram_din~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~6_combout\ = (\u_ctrl|state.ST_DONE~q\ & (\data_in[5]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|rom_data_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in[5]~input_o\,
	datac => \u_ctrl|rom_data_reg\(5),
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~6_combout\);

-- Location: FF_X26_Y3_N3
\u_ctrl|ram_din[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~6_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(5));

-- Location: LCCOMB_X27_Y3_N24
\u_ctrl|u_rom|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux1~0_combout\ = \u_ctrl|rom_addr\(1) $ (((!\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(2) $ (\u_ctrl|rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datab => \u_ctrl|rom_addr\(1),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux1~0_combout\);

-- Location: FF_X27_Y3_N25
\u_ctrl|u_rom|q_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux1~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(6));

-- Location: LCCOMB_X27_Y3_N8
\u_ctrl|rom_data_reg[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[6]~feeder_combout\ = \u_ctrl|u_rom|q_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|u_rom|q_reg\(6),
	combout => \u_ctrl|rom_data_reg[6]~feeder_combout\);

-- Location: FF_X27_Y3_N9
\u_ctrl|rom_data_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg[6]~feeder_combout\,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(6));

-- Location: IOIBUF_X30_Y0_N29
\data_in[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: LCCOMB_X26_Y3_N28
\u_ctrl|ram_din~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~7_combout\ = (\u_ctrl|state.ST_DONE~q\ & ((\data_in[6]~input_o\))) # (!\u_ctrl|state.ST_DONE~q\ & (\u_ctrl|rom_data_reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.ST_DONE~q\,
	datac => \u_ctrl|rom_data_reg\(6),
	datad => \data_in[6]~input_o\,
	combout => \u_ctrl|ram_din~7_combout\);

-- Location: FF_X26_Y3_N29
\u_ctrl|ram_din[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~7_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(6));

-- Location: IOIBUF_X28_Y0_N22
\data_in[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: LCCOMB_X27_Y3_N26
\u_ctrl|u_rom|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_rom|Mux0~0_combout\ = (\u_ctrl|rom_addr\(3) & (\u_ctrl|rom_addr\(2))) # (!\u_ctrl|rom_addr\(3) & ((!\u_ctrl|rom_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_addr\(3),
	datac => \u_ctrl|rom_addr\(2),
	datad => \u_ctrl|rom_addr\(0),
	combout => \u_ctrl|u_rom|Mux0~0_combout\);

-- Location: FF_X27_Y3_N27
\u_ctrl|u_rom|q_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_rom|Mux0~0_combout\,
	ena => \u_ctrl|rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_rom|q_reg\(7));

-- Location: FF_X27_Y3_N15
\u_ctrl|rom_data_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|u_rom|q_reg\(7),
	sload => VCC,
	ena => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(7));

-- Location: LCCOMB_X26_Y3_N18
\u_ctrl|ram_din~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|ram_din~8_combout\ = (\u_ctrl|state.ST_DONE~q\ & (\data_in[7]~input_o\)) # (!\u_ctrl|state.ST_DONE~q\ & ((\u_ctrl|rom_data_reg\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_in[7]~input_o\,
	datac => \u_ctrl|rom_data_reg\(7),
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|ram_din~8_combout\);

-- Location: FF_X26_Y3_N19
\u_ctrl|ram_din[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|ram_din~8_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|ram_din[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_din\(7));

-- Location: M9K_X25_Y4_N0
\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "memory_controller:u_ctrl|ram_sincrona:u_ram|altsyncram:mem_rtl_0|altsyncram_aki1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 4,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 15,
	port_b_logical_ram_depth => 16,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_ctrl|ram_we~q\,
	portbre => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X24_Y4_N0
\u_ctrl|u_ram|q_reg~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~0_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(9))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem~15_combout\,
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(9),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \u_ctrl|u_ram|q_reg~0_combout\);

-- Location: IOIBUF_X26_Y0_N1
\re~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_re,
	o => \re~input_o\);

-- Location: LCCOMB_X26_Y3_N30
\u_ctrl|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector1~0_combout\ = (\u_ctrl|state.READ_RAM~q\) # ((\re~input_o\ & \u_ctrl|state.ST_DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.READ_RAM~q\,
	datac => \re~input_o\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|Selector1~0_combout\);

-- Location: FF_X26_Y3_N31
\u_ctrl|ram_re\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector1~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|ram_re~q\);

-- Location: LCCOMB_X26_Y4_N14
\u_ctrl|u_ram|q_reg[3]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg[3]~1_combout\ = (\u_ctrl|ram_re~q\) # (\u_ctrl|ram_we~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|ram_re~q\,
	datad => \u_ctrl|ram_we~q\,
	combout => \u_ctrl|u_ram|q_reg[3]~1_combout\);

-- Location: FF_X24_Y4_N1
\u_ctrl|u_ram|q_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~0_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(0));

-- Location: LCCOMB_X24_Y4_N6
\u_ctrl|u_ram|mem_rtl_0_bypass[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[10]~feeder_combout\ = \u_ctrl|ram_din\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_din\(1),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[10]~feeder_combout\);

-- Location: FF_X24_Y4_N7
\u_ctrl|u_ram|mem_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(10));

-- Location: LCCOMB_X24_Y4_N10
\u_ctrl|u_ram|q_reg~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~2_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(10))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0_bypass\(10),
	datac => \u_ctrl|u_ram|mem~15_combout\,
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a1\,
	combout => \u_ctrl|u_ram|q_reg~2_combout\);

-- Location: FF_X24_Y4_N11
\u_ctrl|u_ram|q_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~2_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(1));

-- Location: LCCOMB_X24_Y4_N4
\u_ctrl|u_ram|mem_rtl_0_bypass[11]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[11]~feeder_combout\ = \u_ctrl|ram_din\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_din\(2),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[11]~feeder_combout\);

-- Location: FF_X24_Y4_N5
\u_ctrl|u_ram|mem_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(11));

-- Location: LCCOMB_X24_Y4_N16
\u_ctrl|u_ram|q_reg~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~3_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(11))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem~15_combout\,
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(11),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a2\,
	combout => \u_ctrl|u_ram|q_reg~3_combout\);

-- Location: FF_X24_Y4_N17
\u_ctrl|u_ram|q_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~3_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(2));

-- Location: LCCOMB_X24_Y4_N22
\u_ctrl|u_ram|mem_rtl_0_bypass[12]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[12]~feeder_combout\ = \u_ctrl|ram_din\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_din\(3),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[12]~feeder_combout\);

-- Location: FF_X24_Y4_N23
\u_ctrl|u_ram|mem_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(12));

-- Location: LCCOMB_X24_Y4_N2
\u_ctrl|u_ram|q_reg~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~4_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(12))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem~15_combout\,
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(12),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a3\,
	combout => \u_ctrl|u_ram|q_reg~4_combout\);

-- Location: FF_X24_Y4_N3
\u_ctrl|u_ram|q_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~4_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(3));

-- Location: LCCOMB_X26_Y4_N8
\u_ctrl|u_ram|mem_rtl_0_bypass[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|mem_rtl_0_bypass[13]~feeder_combout\ = \u_ctrl|ram_din\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|ram_din\(4),
	combout => \u_ctrl|u_ram|mem_rtl_0_bypass[13]~feeder_combout\);

-- Location: FF_X26_Y4_N9
\u_ctrl|u_ram|mem_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|mem_rtl_0_bypass[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(13));

-- Location: LCCOMB_X26_Y4_N0
\u_ctrl|u_ram|q_reg~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~5_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(13))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|u_ram|mem~15_combout\,
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(13),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a4\,
	combout => \u_ctrl|u_ram|q_reg~5_combout\);

-- Location: FF_X26_Y4_N1
\u_ctrl|u_ram|q_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~5_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(4));

-- Location: FF_X26_Y4_N7
\u_ctrl|u_ram|mem_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_din\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(14));

-- Location: LCCOMB_X26_Y4_N6
\u_ctrl|u_ram|q_reg~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~6_combout\ = (\u_ctrl|u_ram|mem_rtl_0_bypass\(0) & (\u_ctrl|u_ram|mem_rtl_0_bypass\(14))) # (!\u_ctrl|u_ram|mem_rtl_0_bypass\(0) & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0_bypass\(0),
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(14),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\,
	combout => \u_ctrl|u_ram|q_reg~6_combout\);

-- Location: LCCOMB_X26_Y4_N10
\u_ctrl|u_ram|q_reg~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~7_combout\ = (\u_ctrl|u_ram|mem~13_combout\ & ((\u_ctrl|u_ram|mem~14_combout\ & ((\u_ctrl|u_ram|q_reg~6_combout\))) # (!\u_ctrl|u_ram|mem~14_combout\ & (\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\)))) # 
-- (!\u_ctrl|u_ram|mem~13_combout\ & (\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a5\,
	datab => \u_ctrl|u_ram|mem~13_combout\,
	datac => \u_ctrl|u_ram|mem~14_combout\,
	datad => \u_ctrl|u_ram|q_reg~6_combout\,
	combout => \u_ctrl|u_ram|q_reg~7_combout\);

-- Location: FF_X26_Y4_N11
\u_ctrl|u_ram|q_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~7_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(5));

-- Location: FF_X26_Y4_N15
\u_ctrl|u_ram|mem_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_din\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(15));

-- Location: LCCOMB_X26_Y4_N4
\u_ctrl|u_ram|q_reg~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~8_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(15))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|u_ram|mem~15_combout\,
	datac => \u_ctrl|u_ram|mem_rtl_0_bypass\(15),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a6\,
	combout => \u_ctrl|u_ram|q_reg~8_combout\);

-- Location: FF_X26_Y4_N5
\u_ctrl|u_ram|q_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~8_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(6));

-- Location: FF_X24_Y4_N19
\u_ctrl|u_ram|mem_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|ram_din\(7),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|mem_rtl_0_bypass\(16));

-- Location: LCCOMB_X24_Y4_N24
\u_ctrl|u_ram|q_reg~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|u_ram|q_reg~9_combout\ = (\u_ctrl|u_ram|mem~15_combout\ & (\u_ctrl|u_ram|mem_rtl_0_bypass\(16))) # (!\u_ctrl|u_ram|mem~15_combout\ & ((\u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|mem~15_combout\,
	datab => \u_ctrl|u_ram|mem_rtl_0_bypass\(16),
	datad => \u_ctrl|u_ram|mem_rtl_0|auto_generated|ram_block1a7\,
	combout => \u_ctrl|u_ram|q_reg~9_combout\);

-- Location: FF_X24_Y4_N25
\u_ctrl|u_ram|q_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|u_ram|q_reg~9_combout\,
	ena => \u_ctrl|u_ram|q_reg[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|u_ram|q_reg\(7));

-- Location: LCCOMB_X29_Y3_N12
\u_ctrl|Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector6~0_combout\ = (\u_ctrl|state.ST_DONE~q\) # ((\u_ctrl|state.IDLE~q\ & \u_ctrl|done_reg~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.IDLE~q\,
	datac => \u_ctrl|done_reg~q\,
	datad => \u_ctrl|state.ST_DONE~q\,
	combout => \u_ctrl|Selector6~0_combout\);

-- Location: FF_X29_Y3_N13
\u_ctrl|done_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector6~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|done_reg~q\);

-- Location: LCCOMB_X24_Y4_N30
\u_hex0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux6~0_combout\ = (!\u_ctrl|u_ram|q_reg\(1) & (!\u_ctrl|u_ram|q_reg\(3) & (\u_ctrl|u_ram|q_reg\(2) $ (\u_ctrl|u_ram|q_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datac => \u_ctrl|u_ram|q_reg\(3),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y4_N20
\u_hex0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux5~0_combout\ = (\u_ctrl|u_ram|q_reg\(2) & (\u_ctrl|u_ram|q_reg\(1) $ (\u_ctrl|u_ram|q_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux5~0_combout\);

-- Location: LCCOMB_X24_Y4_N14
\u_hex0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux4~0_combout\ = (\u_ctrl|u_ram|q_reg\(1) & (!\u_ctrl|u_ram|q_reg\(2) & !\u_ctrl|u_ram|q_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux4~0_combout\);

-- Location: LCCOMB_X24_Y4_N12
\u_hex0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux3~0_combout\ = (!\u_ctrl|u_ram|q_reg\(3) & ((\u_ctrl|u_ram|q_reg\(1) & (\u_ctrl|u_ram|q_reg\(2) & \u_ctrl|u_ram|q_reg\(0))) # (!\u_ctrl|u_ram|q_reg\(1) & (\u_ctrl|u_ram|q_reg\(2) $ (\u_ctrl|u_ram|q_reg\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datac => \u_ctrl|u_ram|q_reg\(3),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux3~0_combout\);

-- Location: LCCOMB_X24_Y4_N18
\u_hex0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux2~0_combout\ = (\u_ctrl|u_ram|q_reg\(0)) # ((!\u_ctrl|u_ram|q_reg\(1) & \u_ctrl|u_ram|q_reg\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux2~0_combout\);

-- Location: LCCOMB_X24_Y4_N28
\u_hex0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux1~0_combout\ = (!\u_ctrl|u_ram|q_reg\(3) & ((\u_ctrl|u_ram|q_reg\(1) & ((\u_ctrl|u_ram|q_reg\(0)) # (!\u_ctrl|u_ram|q_reg\(2)))) # (!\u_ctrl|u_ram|q_reg\(1) & (!\u_ctrl|u_ram|q_reg\(2) & \u_ctrl|u_ram|q_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datac => \u_ctrl|u_ram|q_reg\(3),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux1~0_combout\);

-- Location: LCCOMB_X24_Y4_N26
\u_hex0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex0|Mux0~0_combout\ = (\u_ctrl|u_ram|q_reg\(3)) # ((\u_ctrl|u_ram|q_reg\(1) & ((!\u_ctrl|u_ram|q_reg\(0)) # (!\u_ctrl|u_ram|q_reg\(2)))) # (!\u_ctrl|u_ram|q_reg\(1) & (\u_ctrl|u_ram|q_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(1),
	datab => \u_ctrl|u_ram|q_reg\(2),
	datac => \u_ctrl|u_ram|q_reg\(3),
	datad => \u_ctrl|u_ram|q_reg\(0),
	combout => \u_hex0|Mux0~0_combout\);

-- Location: LCCOMB_X16_Y1_N12
\u_hex1|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux6~0_combout\ = (!\u_ctrl|u_ram|q_reg\(5) & (!\u_ctrl|u_ram|q_reg\(7) & (\u_ctrl|u_ram|q_reg\(6) $ (\u_ctrl|u_ram|q_reg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datab => \u_ctrl|u_ram|q_reg\(6),
	datac => \u_ctrl|u_ram|q_reg\(7),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux6~0_combout\);

-- Location: LCCOMB_X16_Y1_N30
\u_hex1|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux5~0_combout\ = (\u_ctrl|u_ram|q_reg\(6) & (\u_ctrl|u_ram|q_reg\(5) $ (\u_ctrl|u_ram|q_reg\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datac => \u_ctrl|u_ram|q_reg\(6),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux5~0_combout\);

-- Location: LCCOMB_X16_Y1_N8
\u_hex1|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux4~0_combout\ = (\u_ctrl|u_ram|q_reg\(5) & (!\u_ctrl|u_ram|q_reg\(6) & !\u_ctrl|u_ram|q_reg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datac => \u_ctrl|u_ram|q_reg\(6),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux4~0_combout\);

-- Location: LCCOMB_X16_Y1_N18
\u_hex1|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux3~0_combout\ = (!\u_ctrl|u_ram|q_reg\(7) & ((\u_ctrl|u_ram|q_reg\(5) & (\u_ctrl|u_ram|q_reg\(6) & \u_ctrl|u_ram|q_reg\(4))) # (!\u_ctrl|u_ram|q_reg\(5) & (\u_ctrl|u_ram|q_reg\(6) $ (\u_ctrl|u_ram|q_reg\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datab => \u_ctrl|u_ram|q_reg\(6),
	datac => \u_ctrl|u_ram|q_reg\(7),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux3~0_combout\);

-- Location: LCCOMB_X16_Y1_N4
\u_hex1|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux2~0_combout\ = (\u_ctrl|u_ram|q_reg\(4)) # ((!\u_ctrl|u_ram|q_reg\(5) & \u_ctrl|u_ram|q_reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datac => \u_ctrl|u_ram|q_reg\(6),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux2~0_combout\);

-- Location: LCCOMB_X16_Y1_N26
\u_hex1|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux1~0_combout\ = (!\u_ctrl|u_ram|q_reg\(7) & ((\u_ctrl|u_ram|q_reg\(5) & ((\u_ctrl|u_ram|q_reg\(4)) # (!\u_ctrl|u_ram|q_reg\(6)))) # (!\u_ctrl|u_ram|q_reg\(5) & (!\u_ctrl|u_ram|q_reg\(6) & \u_ctrl|u_ram|q_reg\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datab => \u_ctrl|u_ram|q_reg\(6),
	datac => \u_ctrl|u_ram|q_reg\(7),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux1~0_combout\);

-- Location: LCCOMB_X16_Y1_N28
\u_hex1|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_hex1|Mux0~0_combout\ = (\u_ctrl|u_ram|q_reg\(7)) # ((\u_ctrl|u_ram|q_reg\(5) & ((!\u_ctrl|u_ram|q_reg\(4)) # (!\u_ctrl|u_ram|q_reg\(6)))) # (!\u_ctrl|u_ram|q_reg\(5) & (\u_ctrl|u_ram|q_reg\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|u_ram|q_reg\(5),
	datab => \u_ctrl|u_ram|q_reg\(6),
	datac => \u_ctrl|u_ram|q_reg\(7),
	datad => \u_ctrl|u_ram|q_reg\(4),
	combout => \u_hex1|Mux0~0_combout\);

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;

ww_done <= \done~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;
END structure;


