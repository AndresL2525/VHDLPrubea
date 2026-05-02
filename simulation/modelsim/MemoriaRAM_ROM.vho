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

-- DATE "05/02/2026 10:15:12"

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
	data_out : BUFFER std_logic_vector(7 DOWNTO 0);
	done : BUFFER std_logic
	);
END memory_system_top;

-- Design Ports Information
-- data_out[0]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[1]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[2]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[3]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[4]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[5]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out[7]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[0]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[1]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[2]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- addr[3]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- we	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- re	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[4]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[5]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[6]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[7]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
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
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \u_ctrl|state.S_IDLE~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_IDLE~q\ : std_logic;
SIGNAL \u_ctrl|Selector7~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_READ_ROM~q\ : std_logic;
SIGNAL \u_ctrl|state~12_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_WAIT_ROM~q\ : std_logic;
SIGNAL \u_ctrl|state~11_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_WAIT_ROM2~q\ : std_logic;
SIGNAL \u_ctrl|state~9_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_WRITE_RAM~q\ : std_logic;
SIGNAL \u_ctrl|state~10_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_READ_RAM~q\ : std_logic;
SIGNAL \u_ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector2~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector3~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector3~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector5~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector5~1_combout\ : std_logic;
SIGNAL \u_ctrl|Selector4~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector4~1_combout\ : std_logic;
SIGNAL \u_ctrl|Equal0~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector12~0_combout\ : std_logic;
SIGNAL \u_ctrl|state.S_DONE~q\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_rom_re~2_combout\ : std_logic;
SIGNAL \u_ctrl|Selector13~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector15~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector14~0_combout\ : std_logic;
SIGNAL \u_ctrl|Selector16~0_combout\ : std_logic;
SIGNAL \u_rom|Mux7~0_combout\ : std_logic;
SIGNAL \u_ctrl|s_rom_re~3_combout\ : std_logic;
SIGNAL \u_ctrl|s_rom_re~q\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg[7]~1_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~0_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in[4]~1_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[9]~feeder_combout\ : std_logic;
SIGNAL \addr[3]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~6_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~7_combout\ : std_logic;
SIGNAL \addr[2]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~4_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~5_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[8]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem~14_combout\ : std_logic;
SIGNAL \addr[0]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~0_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~1_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr[0]~feeder_combout\ : std_logic;
SIGNAL \addr[1]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~2_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr~3_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_addr[1]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[3]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[2]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem~13_combout\ : std_logic;
SIGNAL \we~input_o\ : std_logic;
SIGNAL \u_ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_we~q\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[0]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem~15_combout\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \u_rom|Mux6~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~2_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~2_combout\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \u_rom|Mux5~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~3_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~3_combout\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \u_rom|Mux4~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~4_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~4_combout\ : std_logic;
SIGNAL \data_in[4]~input_o\ : std_logic;
SIGNAL \u_rom|Mux3~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~5_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~5_combout\ : std_logic;
SIGNAL \u_rom|Mux2~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~6_combout\ : std_logic;
SIGNAL \data_in[5]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~6_combout\ : std_logic;
SIGNAL \u_rom|Mux1~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~7_combout\ : std_logic;
SIGNAL \data_in[6]~input_o\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~7_combout\ : std_logic;
SIGNAL \data_in[7]~input_o\ : std_logic;
SIGNAL \u_rom|Mux0~0_combout\ : std_logic;
SIGNAL \u_ctrl|rom_data_reg~8_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_data_in~8_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \u_ram|q_reg~0_combout\ : std_logic;
SIGNAL \re~input_o\ : std_logic;
SIGNAL \u_ctrl|Selector1~0_combout\ : std_logic;
SIGNAL \u_ctrl|s_ram_re~q\ : std_logic;
SIGNAL \u_ram|q_reg[5]~1_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \u_ram|q_reg~2_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \u_ram|q_reg~3_combout\ : std_logic;
SIGNAL \u_ram|q_reg~4_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[12]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \u_ram|q_reg~5_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[13]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \u_ram|q_reg~6_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[14]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \u_ram|q_reg~7_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \u_ram|q_reg~8_combout\ : std_logic;
SIGNAL \u_ram|q_reg~9_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0_bypass[16]~feeder_combout\ : std_logic;
SIGNAL \u_ram|mem_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \u_ram|q_reg~10_combout\ : std_logic;
SIGNAL \u_ctrl|Selector6~0_combout\ : std_logic;
SIGNAL \u_ctrl|done_reg~q\ : std_logic;
SIGNAL \u_ctrl|s_rom_addr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|s_ram_data_in\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|s_ram_addr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_ctrl|rom_data_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ctrl|addr_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_rom|q_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_ram|mem_rtl_0_bypass\ : std_logic_vector(0 TO 16);
SIGNAL \u_ram|q_reg\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_addr <= addr;
ww_data_in <= data_in;
ww_we <= we;
ww_re <= re;
data_out <= ww_data_out;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
\u_ctrl|s_ram_data_in\(7) & \u_ctrl|s_ram_data_in\(6) & \u_ctrl|s_ram_data_in\(5) & \u_ctrl|s_ram_data_in\(4) & \u_ctrl|s_ram_data_in\(3) & \u_ctrl|s_ram_data_in\(2) & \u_ctrl|s_ram_data_in\(1) & \u_ctrl|s_ram_data_in\(0));

\u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\u_ctrl|s_ram_addr\(3) & \u_ctrl|s_ram_addr\(2) & \u_ctrl|s_ram_addr\(1) & \u_ctrl|s_ram_addr\(0));

\u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\u_ctrl|s_ram_addr~7_combout\ & \u_ctrl|s_ram_addr~5_combout\ & \u_ctrl|s_ram_addr~3_combout\ & \u_ctrl|s_ram_addr~1_combout\);

\u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_ram|mem_rtl_0|auto_generated|ram_block1a1\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\u_ram|mem_rtl_0|auto_generated|ram_block1a2\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\u_ram|mem_rtl_0|auto_generated|ram_block1a3\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\u_ram|mem_rtl_0|auto_generated|ram_block1a4\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\u_ram|mem_rtl_0|auto_generated|ram_block1a5\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\u_ram|mem_rtl_0|auto_generated|ram_block1a6\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\u_ram|mem_rtl_0|auto_generated|ram_block1a7\ <= \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X14_Y0_N16
\data_out[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(0),
	devoe => ww_devoe,
	o => \data_out[0]~output_o\);

-- Location: IOOBUF_X11_Y0_N30
\data_out[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(1),
	devoe => ww_devoe,
	o => \data_out[1]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\data_out[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(2),
	devoe => ww_devoe,
	o => \data_out[2]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\data_out[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(3),
	devoe => ww_devoe,
	o => \data_out[3]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\data_out[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(4),
	devoe => ww_devoe,
	o => \data_out[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\data_out[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(5),
	devoe => ww_devoe,
	o => \data_out[5]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\data_out[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(6),
	devoe => ww_devoe,
	o => \data_out[6]~output_o\);

-- Location: IOOBUF_X14_Y0_N23
\data_out[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_ram|q_reg\(7),
	devoe => ww_devoe,
	o => \data_out[7]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
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

-- Location: IOIBUF_X5_Y0_N22
\rst~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X8_Y1_N26
\u_ctrl|state.S_IDLE~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state.S_IDLE~0_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \u_ctrl|state.S_IDLE~0_combout\);

-- Location: FF_X8_Y1_N27
\u_ctrl|state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state.S_IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.S_IDLE~q\);

-- Location: LCCOMB_X8_Y1_N0
\u_ctrl|Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector7~0_combout\ = ((!\u_ctrl|Equal0~0_combout\ & \u_ctrl|state.S_READ_RAM~q\)) # (!\u_ctrl|state.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|Equal0~0_combout\,
	datac => \u_ctrl|state.S_IDLE~q\,
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector7~0_combout\);

-- Location: FF_X8_Y1_N1
\u_ctrl|state.S_READ_ROM\ : dffeas
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
	q => \u_ctrl|state.S_READ_ROM~q\);

-- Location: LCCOMB_X9_Y1_N20
\u_ctrl|state~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~12_combout\ = (\u_ctrl|state.S_READ_ROM~q\ & !\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_READ_ROM~q\,
	datac => \rst~input_o\,
	combout => \u_ctrl|state~12_combout\);

-- Location: FF_X9_Y1_N21
\u_ctrl|state.S_WAIT_ROM\ : dffeas
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
	q => \u_ctrl|state.S_WAIT_ROM~q\);

-- Location: LCCOMB_X9_Y1_N4
\u_ctrl|state~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~11_combout\ = (!\rst~input_o\ & \u_ctrl|state.S_WAIT_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_ctrl|state.S_WAIT_ROM~q\,
	combout => \u_ctrl|state~11_combout\);

-- Location: FF_X9_Y1_N5
\u_ctrl|state.S_WAIT_ROM2\ : dffeas
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
	q => \u_ctrl|state.S_WAIT_ROM2~q\);

-- Location: LCCOMB_X11_Y1_N22
\u_ctrl|state~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~9_combout\ = (!\rst~input_o\ & \u_ctrl|state.S_WAIT_ROM2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_ctrl|state.S_WAIT_ROM2~q\,
	combout => \u_ctrl|state~9_combout\);

-- Location: FF_X11_Y1_N23
\u_ctrl|state.S_WRITE_RAM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|state.S_WRITE_RAM~q\);

-- Location: LCCOMB_X11_Y1_N20
\u_ctrl|state~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|state~10_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\ & !\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datac => \rst~input_o\,
	combout => \u_ctrl|state~10_combout\);

-- Location: FF_X11_Y1_N21
\u_ctrl|state.S_READ_RAM\ : dffeas
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
	q => \u_ctrl|state.S_READ_RAM~q\);

-- Location: LCCOMB_X8_Y1_N16
\u_ctrl|Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector2~0_combout\ = (\u_ctrl|addr_counter\(0) & (\u_ctrl|addr_counter\(2) & (\u_ctrl|addr_counter\(1) & \u_ctrl|state.S_READ_RAM~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(0),
	datab => \u_ctrl|addr_counter\(2),
	datac => \u_ctrl|addr_counter\(1),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector2~0_combout\);

-- Location: LCCOMB_X8_Y1_N10
\u_ctrl|Selector2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector2~1_combout\ = (\u_ctrl|Selector2~0_combout\) # ((\u_ctrl|addr_counter\(3) & ((\u_ctrl|state.S_IDLE~q\) # (\u_ctrl|state.S_READ_RAM~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_IDLE~q\,
	datab => \u_ctrl|Selector2~0_combout\,
	datac => \u_ctrl|addr_counter\(3),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector2~1_combout\);

-- Location: FF_X8_Y1_N11
\u_ctrl|addr_counter[3]\ : dffeas
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
	q => \u_ctrl|addr_counter\(3));

-- Location: LCCOMB_X8_Y1_N14
\u_ctrl|Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector3~0_combout\ = (\u_ctrl|addr_counter\(1) & ((\u_ctrl|addr_counter\(2) & ((\u_ctrl|addr_counter\(3)) # (!\u_ctrl|addr_counter\(0)))) # (!\u_ctrl|addr_counter\(2) & ((\u_ctrl|addr_counter\(0)))))) # (!\u_ctrl|addr_counter\(1) & 
-- (\u_ctrl|addr_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(1),
	datab => \u_ctrl|addr_counter\(2),
	datac => \u_ctrl|addr_counter\(3),
	datad => \u_ctrl|addr_counter\(0),
	combout => \u_ctrl|Selector3~0_combout\);

-- Location: LCCOMB_X8_Y1_N20
\u_ctrl|Selector3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector3~1_combout\ = (\u_ctrl|state.S_READ_RAM~q\ & (((\u_ctrl|Selector3~0_combout\)))) # (!\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|state.S_IDLE~q\ & ((\u_ctrl|addr_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_IDLE~q\,
	datab => \u_ctrl|Selector3~0_combout\,
	datac => \u_ctrl|addr_counter\(2),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector3~1_combout\);

-- Location: FF_X8_Y1_N21
\u_ctrl|addr_counter[2]\ : dffeas
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
	q => \u_ctrl|addr_counter\(2));

-- Location: LCCOMB_X8_Y1_N2
\u_ctrl|Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector5~0_combout\ = (\u_ctrl|addr_counter\(1) & (\u_ctrl|addr_counter\(2) & (\u_ctrl|addr_counter\(3) & \u_ctrl|state.S_READ_RAM~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(1),
	datab => \u_ctrl|addr_counter\(2),
	datac => \u_ctrl|addr_counter\(3),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector5~0_combout\);

-- Location: LCCOMB_X8_Y1_N12
\u_ctrl|Selector5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector5~1_combout\ = (\u_ctrl|Selector5~0_combout\) # ((\u_ctrl|addr_counter\(0) & (\u_ctrl|state.S_IDLE~q\ & !\u_ctrl|state.S_READ_RAM~q\)) # (!\u_ctrl|addr_counter\(0) & ((\u_ctrl|state.S_READ_RAM~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_IDLE~q\,
	datab => \u_ctrl|Selector5~0_combout\,
	datac => \u_ctrl|addr_counter\(0),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector5~1_combout\);

-- Location: FF_X8_Y1_N13
\u_ctrl|addr_counter[0]\ : dffeas
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
	q => \u_ctrl|addr_counter\(0));

-- Location: LCCOMB_X8_Y1_N8
\u_ctrl|Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector4~0_combout\ = (\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|addr_counter\(1) $ (((\u_ctrl|addr_counter\(0)))))) # (!\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|addr_counter\(1) & (\u_ctrl|state.S_IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(1),
	datab => \u_ctrl|state.S_READ_RAM~q\,
	datac => \u_ctrl|state.S_IDLE~q\,
	datad => \u_ctrl|addr_counter\(0),
	combout => \u_ctrl|Selector4~0_combout\);

-- Location: LCCOMB_X8_Y1_N30
\u_ctrl|Selector4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector4~1_combout\ = (\u_ctrl|Selector4~0_combout\) # ((\u_ctrl|Equal0~0_combout\ & \u_ctrl|state.S_READ_RAM~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|Equal0~0_combout\,
	datac => \u_ctrl|Selector4~0_combout\,
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector4~1_combout\);

-- Location: FF_X8_Y1_N31
\u_ctrl|addr_counter[1]\ : dffeas
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
	q => \u_ctrl|addr_counter\(1));

-- Location: LCCOMB_X8_Y1_N28
\u_ctrl|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Equal0~0_combout\ = (\u_ctrl|addr_counter\(1) & (\u_ctrl|addr_counter\(2) & (\u_ctrl|addr_counter\(3) & \u_ctrl|addr_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(1),
	datab => \u_ctrl|addr_counter\(2),
	datac => \u_ctrl|addr_counter\(3),
	datad => \u_ctrl|addr_counter\(0),
	combout => \u_ctrl|Equal0~0_combout\);

-- Location: LCCOMB_X8_Y1_N18
\u_ctrl|Selector12~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector12~0_combout\ = (\u_ctrl|state.S_DONE~q\) # ((\u_ctrl|Equal0~0_combout\ & \u_ctrl|state.S_READ_RAM~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|Equal0~0_combout\,
	datac => \u_ctrl|state.S_DONE~q\,
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector12~0_combout\);

-- Location: FF_X8_Y1_N19
\u_ctrl|state.S_DONE\ : dffeas
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
	q => \u_ctrl|state.S_DONE~q\);

-- Location: IOIBUF_X7_Y0_N8
\data_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X9_Y1_N6
\u_ctrl|s_rom_re~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_rom_re~2_combout\ = (!\u_ctrl|state.S_READ_ROM~q\ & !\u_ctrl|state.S_WAIT_ROM~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_ctrl|state.S_READ_ROM~q\,
	datad => \u_ctrl|state.S_WAIT_ROM~q\,
	combout => \u_ctrl|s_rom_re~2_combout\);

-- Location: LCCOMB_X9_Y1_N10
\u_ctrl|Selector13~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector13~0_combout\ = (\u_ctrl|s_rom_re~2_combout\ & (((!\u_ctrl|state.S_DONE~q\ & \u_ctrl|s_rom_addr\(3))))) # (!\u_ctrl|s_rom_re~2_combout\ & (\u_ctrl|addr_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(3),
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \u_ctrl|s_rom_addr\(3),
	datad => \u_ctrl|s_rom_re~2_combout\,
	combout => \u_ctrl|Selector13~0_combout\);

-- Location: FF_X9_Y1_N11
\u_ctrl|s_rom_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector13~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_rom_addr\(3));

-- Location: LCCOMB_X9_Y1_N2
\u_ctrl|Selector15~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector15~0_combout\ = (\u_ctrl|s_rom_re~2_combout\ & (((!\u_ctrl|state.S_DONE~q\ & \u_ctrl|s_rom_addr\(1))))) # (!\u_ctrl|s_rom_re~2_combout\ & (\u_ctrl|addr_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(1),
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \u_ctrl|s_rom_addr\(1),
	datad => \u_ctrl|s_rom_re~2_combout\,
	combout => \u_ctrl|Selector15~0_combout\);

-- Location: FF_X9_Y1_N3
\u_ctrl|s_rom_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector15~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_rom_addr\(1));

-- Location: LCCOMB_X9_Y1_N8
\u_ctrl|Selector14~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector14~0_combout\ = (\u_ctrl|s_rom_re~2_combout\ & (((!\u_ctrl|state.S_DONE~q\ & \u_ctrl|s_rom_addr\(2))))) # (!\u_ctrl|s_rom_re~2_combout\ & (\u_ctrl|addr_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|addr_counter\(2),
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_re~2_combout\,
	combout => \u_ctrl|Selector14~0_combout\);

-- Location: FF_X9_Y1_N9
\u_ctrl|s_rom_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector14~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_rom_addr\(2));

-- Location: LCCOMB_X9_Y1_N12
\u_ctrl|Selector16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector16~0_combout\ = (\u_ctrl|s_rom_re~2_combout\ & (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|s_rom_addr\(0))))) # (!\u_ctrl|s_rom_re~2_combout\ & (((\u_ctrl|addr_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datab => \u_ctrl|addr_counter\(0),
	datac => \u_ctrl|s_rom_addr\(0),
	datad => \u_ctrl|s_rom_re~2_combout\,
	combout => \u_ctrl|Selector16~0_combout\);

-- Location: FF_X9_Y1_N13
\u_ctrl|s_rom_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|Selector16~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_rom_addr\(0));

-- Location: LCCOMB_X9_Y1_N26
\u_rom|Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux7~0_combout\ = (\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(1) & (\u_ctrl|s_rom_addr\(2) & \u_ctrl|s_rom_addr\(0)))) # (!\u_ctrl|s_rom_addr\(3) & ((\u_ctrl|s_rom_addr\(2) $ (\u_ctrl|s_rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux7~0_combout\);

-- Location: LCCOMB_X9_Y1_N0
\u_ctrl|s_rom_re~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_rom_re~3_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.S_READ_ROM~q\) # (\u_ctrl|state.S_WAIT_ROM~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_READ_ROM~q\,
	datac => \rst~input_o\,
	datad => \u_ctrl|state.S_WAIT_ROM~q\,
	combout => \u_ctrl|s_rom_re~3_combout\);

-- Location: FF_X9_Y1_N1
\u_ctrl|s_rom_re\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_rom_re~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_rom_re~q\);

-- Location: FF_X9_Y1_N27
\u_rom|q_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux7~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(0));

-- Location: LCCOMB_X10_Y1_N16
\u_ctrl|rom_data_reg~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~0_combout\ = (\u_rom|q_reg\(0) & !\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_rom|q_reg\(0),
	datac => \rst~input_o\,
	combout => \u_ctrl|rom_data_reg~0_combout\);

-- Location: LCCOMB_X11_Y1_N26
\u_ctrl|rom_data_reg[7]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg[7]~1_combout\ = (\rst~input_o\) # (\u_ctrl|state.S_WAIT_ROM2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_ctrl|state.S_WAIT_ROM2~q\,
	combout => \u_ctrl|rom_data_reg[7]~1_combout\);

-- Location: FF_X10_Y1_N17
\u_ctrl|rom_data_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~0_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(0));

-- Location: LCCOMB_X10_Y1_N20
\u_ctrl|s_ram_data_in~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~0_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[0]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \data_in[0]~input_o\,
	datad => \u_ctrl|rom_data_reg\(0),
	combout => \u_ctrl|s_ram_data_in~0_combout\);

-- Location: LCCOMB_X11_Y1_N28
\u_ctrl|s_ram_data_in[4]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in[4]~1_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\) # ((\rst~input_o\) # (\u_ctrl|state.S_DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datac => \rst~input_o\,
	datad => \u_ctrl|state.S_DONE~q\,
	combout => \u_ctrl|s_ram_data_in[4]~1_combout\);

-- Location: FF_X10_Y1_N21
\u_ctrl|s_ram_data_in[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~0_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(0));

-- Location: LCCOMB_X14_Y1_N22
\u_ram|mem_rtl_0_bypass[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[9]~feeder_combout\ = \u_ctrl|s_ram_data_in\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_data_in\(0),
	combout => \u_ram|mem_rtl_0_bypass[9]~feeder_combout\);

-- Location: FF_X14_Y1_N23
\u_ram|mem_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(9));

-- Location: IOIBUF_X11_Y0_N15
\addr[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(3),
	o => \addr[3]~input_o\);

-- Location: LCCOMB_X11_Y1_N6
\u_ctrl|s_ram_addr~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~6_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\ & (((\u_ctrl|addr_counter\(3))))) # (!\u_ctrl|state.S_WRITE_RAM~q\ & ((\u_ctrl|state.S_READ_RAM~q\ & ((\u_ctrl|addr_counter\(3)))) # (!\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|s_ram_addr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datab => \u_ctrl|state.S_READ_RAM~q\,
	datac => \u_ctrl|s_ram_addr\(3),
	datad => \u_ctrl|addr_counter\(3),
	combout => \u_ctrl|s_ram_addr~6_combout\);

-- Location: LCCOMB_X11_Y1_N8
\u_ctrl|s_ram_addr~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~7_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.S_DONE~q\ & (\addr[3]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|s_ram_addr~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datab => \addr[3]~input_o\,
	datac => \rst~input_o\,
	datad => \u_ctrl|s_ram_addr~6_combout\,
	combout => \u_ctrl|s_ram_addr~7_combout\);

-- Location: FF_X11_Y1_N9
\u_ctrl|s_ram_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_addr~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_addr\(3));

-- Location: FF_X12_Y1_N23
\u_ram|mem_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(7));

-- Location: IOIBUF_X7_Y0_N29
\addr[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(2),
	o => \addr[2]~input_o\);

-- Location: LCCOMB_X11_Y1_N30
\u_ctrl|s_ram_addr~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~4_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\ & (((\u_ctrl|addr_counter\(2))))) # (!\u_ctrl|state.S_WRITE_RAM~q\ & ((\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|addr_counter\(2))) # (!\u_ctrl|state.S_READ_RAM~q\ & ((\u_ctrl|s_ram_addr\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datab => \u_ctrl|state.S_READ_RAM~q\,
	datac => \u_ctrl|addr_counter\(2),
	datad => \u_ctrl|s_ram_addr\(2),
	combout => \u_ctrl|s_ram_addr~4_combout\);

-- Location: LCCOMB_X11_Y1_N4
\u_ctrl|s_ram_addr~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~5_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.S_DONE~q\ & (\addr[2]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|s_ram_addr~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addr[2]~input_o\,
	datab => \rst~input_o\,
	datac => \u_ctrl|s_ram_addr~4_combout\,
	datad => \u_ctrl|state.S_DONE~q\,
	combout => \u_ctrl|s_ram_addr~5_combout\);

-- Location: FF_X12_Y1_N7
\u_ctrl|s_ram_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_addr\(2));

-- Location: FF_X12_Y1_N1
\u_ram|mem_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(5));

-- Location: FF_X12_Y1_N11
\u_ram|mem_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(6));

-- Location: LCCOMB_X12_Y1_N12
\u_ram|mem_rtl_0_bypass[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[8]~feeder_combout\ = \u_ctrl|s_ram_addr~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_addr~7_combout\,
	combout => \u_ram|mem_rtl_0_bypass[8]~feeder_combout\);

-- Location: FF_X12_Y1_N13
\u_ram|mem_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(8));

-- Location: LCCOMB_X12_Y1_N10
\u_ram|mem~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem~14_combout\ = (\u_ram|mem_rtl_0_bypass\(7) & (\u_ram|mem_rtl_0_bypass\(8) & (\u_ram|mem_rtl_0_bypass\(5) $ (!\u_ram|mem_rtl_0_bypass\(6))))) # (!\u_ram|mem_rtl_0_bypass\(7) & (!\u_ram|mem_rtl_0_bypass\(8) & (\u_ram|mem_rtl_0_bypass\(5) $ 
-- (!\u_ram|mem_rtl_0_bypass\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(7),
	datab => \u_ram|mem_rtl_0_bypass\(5),
	datac => \u_ram|mem_rtl_0_bypass\(6),
	datad => \u_ram|mem_rtl_0_bypass\(8),
	combout => \u_ram|mem~14_combout\);

-- Location: IOIBUF_X11_Y0_N8
\addr[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(0),
	o => \addr[0]~input_o\);

-- Location: LCCOMB_X11_Y1_N18
\u_ctrl|s_ram_addr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~0_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\ & (((\u_ctrl|addr_counter\(0))))) # (!\u_ctrl|state.S_WRITE_RAM~q\ & ((\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|addr_counter\(0))) # (!\u_ctrl|state.S_READ_RAM~q\ & ((\u_ctrl|s_ram_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datab => \u_ctrl|state.S_READ_RAM~q\,
	datac => \u_ctrl|addr_counter\(0),
	datad => \u_ctrl|s_ram_addr\(0),
	combout => \u_ctrl|s_ram_addr~0_combout\);

-- Location: LCCOMB_X11_Y1_N12
\u_ctrl|s_ram_addr~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~1_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.S_DONE~q\ & (\addr[0]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|s_ram_addr~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datab => \addr[0]~input_o\,
	datac => \rst~input_o\,
	datad => \u_ctrl|s_ram_addr~0_combout\,
	combout => \u_ctrl|s_ram_addr~1_combout\);

-- Location: LCCOMB_X11_Y1_N0
\u_ctrl|s_ram_addr[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr[0]~feeder_combout\ = \u_ctrl|s_ram_addr~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_addr~1_combout\,
	combout => \u_ctrl|s_ram_addr[0]~feeder_combout\);

-- Location: FF_X11_Y1_N1
\u_ctrl|s_ram_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_addr[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_addr\(0));

-- Location: FF_X12_Y1_N27
\u_ram|mem_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(1));

-- Location: IOIBUF_X7_Y0_N1
\addr[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_addr(1),
	o => \addr[1]~input_o\);

-- Location: LCCOMB_X11_Y1_N10
\u_ctrl|s_ram_addr~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~2_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\ & (((\u_ctrl|addr_counter\(1))))) # (!\u_ctrl|state.S_WRITE_RAM~q\ & ((\u_ctrl|state.S_READ_RAM~q\ & ((\u_ctrl|addr_counter\(1)))) # (!\u_ctrl|state.S_READ_RAM~q\ & (\u_ctrl|s_ram_addr\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_WRITE_RAM~q\,
	datab => \u_ctrl|s_ram_addr\(1),
	datac => \u_ctrl|addr_counter\(1),
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|s_ram_addr~2_combout\);

-- Location: LCCOMB_X11_Y1_N16
\u_ctrl|s_ram_addr~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr~3_combout\ = (!\rst~input_o\ & ((\u_ctrl|state.S_DONE~q\ & (\addr[1]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|s_ram_addr~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datab => \addr[1]~input_o\,
	datac => \rst~input_o\,
	datad => \u_ctrl|s_ram_addr~2_combout\,
	combout => \u_ctrl|s_ram_addr~3_combout\);

-- Location: LCCOMB_X11_Y1_N2
\u_ctrl|s_ram_addr[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_addr[1]~feeder_combout\ = \u_ctrl|s_ram_addr~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_addr~3_combout\,
	combout => \u_ctrl|s_ram_addr[1]~feeder_combout\);

-- Location: FF_X11_Y1_N3
\u_ctrl|s_ram_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_addr[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_addr\(1));

-- Location: LCCOMB_X12_Y1_N20
\u_ram|mem_rtl_0_bypass[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[3]~feeder_combout\ = \u_ctrl|s_ram_addr\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_addr\(1),
	combout => \u_ram|mem_rtl_0_bypass[3]~feeder_combout\);

-- Location: FF_X12_Y1_N21
\u_ram|mem_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(3));

-- Location: FF_X12_Y1_N15
\u_ram|mem_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_addr~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(4));

-- Location: LCCOMB_X12_Y1_N16
\u_ram|mem_rtl_0_bypass[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[2]~feeder_combout\ = \u_ctrl|s_ram_addr~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_addr~1_combout\,
	combout => \u_ram|mem_rtl_0_bypass[2]~feeder_combout\);

-- Location: FF_X12_Y1_N17
\u_ram|mem_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(2));

-- Location: LCCOMB_X12_Y1_N14
\u_ram|mem~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem~13_combout\ = (\u_ram|mem_rtl_0_bypass\(1) & (\u_ram|mem_rtl_0_bypass\(2) & (\u_ram|mem_rtl_0_bypass\(3) $ (!\u_ram|mem_rtl_0_bypass\(4))))) # (!\u_ram|mem_rtl_0_bypass\(1) & (!\u_ram|mem_rtl_0_bypass\(2) & (\u_ram|mem_rtl_0_bypass\(3) $ 
-- (!\u_ram|mem_rtl_0_bypass\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(1),
	datab => \u_ram|mem_rtl_0_bypass\(3),
	datac => \u_ram|mem_rtl_0_bypass\(4),
	datad => \u_ram|mem_rtl_0_bypass\(2),
	combout => \u_ram|mem~13_combout\);

-- Location: IOIBUF_X5_Y0_N1
\we~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_we,
	o => \we~input_o\);

-- Location: LCCOMB_X11_Y1_N24
\u_ctrl|Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector0~0_combout\ = (\u_ctrl|state.S_WRITE_RAM~q\) # ((\u_ctrl|state.S_DONE~q\ & \we~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datac => \u_ctrl|state.S_WRITE_RAM~q\,
	datad => \we~input_o\,
	combout => \u_ctrl|Selector0~0_combout\);

-- Location: FF_X11_Y1_N25
\u_ctrl|s_ram_we\ : dffeas
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
	q => \u_ctrl|s_ram_we~q\);

-- Location: LCCOMB_X12_Y1_N18
\u_ram|mem_rtl_0_bypass[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[0]~feeder_combout\ = \u_ctrl|s_ram_we~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_we~q\,
	combout => \u_ram|mem_rtl_0_bypass[0]~feeder_combout\);

-- Location: FF_X12_Y1_N19
\u_ram|mem_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(0));

-- Location: LCCOMB_X12_Y1_N8
\u_ram|mem~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem~15_combout\ = (\u_ram|mem~14_combout\ & (\u_ram|mem~13_combout\ & \u_ram|mem_rtl_0_bypass\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem~14_combout\,
	datab => \u_ram|mem~13_combout\,
	datad => \u_ram|mem_rtl_0_bypass\(0),
	combout => \u_ram|mem~15_combout\);

-- Location: IOIBUF_X9_Y0_N22
\data_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X9_Y1_N30
\u_rom|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux6~0_combout\ = (\u_ctrl|s_rom_addr\(3) & (((\u_ctrl|s_rom_addr\(1) & \u_ctrl|s_rom_addr\(2))) # (!\u_ctrl|s_rom_addr\(0)))) # (!\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(1) $ (((!\u_ctrl|s_rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux6~0_combout\);

-- Location: FF_X9_Y1_N31
\u_rom|q_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux6~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(1));

-- Location: LCCOMB_X10_Y1_N18
\u_ctrl|rom_data_reg~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~2_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(1),
	combout => \u_ctrl|rom_data_reg~2_combout\);

-- Location: FF_X10_Y1_N19
\u_ctrl|rom_data_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~2_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(1));

-- Location: LCCOMB_X10_Y1_N6
\u_ctrl|s_ram_data_in~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~2_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[1]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_in[1]~input_o\,
	datac => \u_ctrl|state.S_DONE~q\,
	datad => \u_ctrl|rom_data_reg\(1),
	combout => \u_ctrl|s_ram_data_in~2_combout\);

-- Location: FF_X10_Y1_N7
\u_ctrl|s_ram_data_in[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~2_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(1));

-- Location: IOIBUF_X9_Y0_N8
\data_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: LCCOMB_X9_Y1_N24
\u_rom|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux5~0_combout\ = (\u_ctrl|s_rom_addr\(3) & ((\u_ctrl|s_rom_addr\(1) & ((\u_ctrl|s_rom_addr\(2)) # (!\u_ctrl|s_rom_addr\(0)))) # (!\u_ctrl|s_rom_addr\(1) & ((\u_ctrl|s_rom_addr\(0)))))) # (!\u_ctrl|s_rom_addr\(3) & ((\u_ctrl|s_rom_addr\(2) $ 
-- (\u_ctrl|s_rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux5~0_combout\);

-- Location: FF_X9_Y1_N25
\u_rom|q_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux5~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(2));

-- Location: LCCOMB_X10_Y1_N28
\u_ctrl|rom_data_reg~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~3_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(2),
	combout => \u_ctrl|rom_data_reg~3_combout\);

-- Location: FF_X10_Y1_N29
\u_ctrl|rom_data_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~3_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(2));

-- Location: LCCOMB_X10_Y1_N24
\u_ctrl|s_ram_data_in~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~3_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[2]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_in[2]~input_o\,
	datac => \u_ctrl|state.S_DONE~q\,
	datad => \u_ctrl|rom_data_reg\(2),
	combout => \u_ctrl|s_ram_data_in~3_combout\);

-- Location: FF_X10_Y1_N25
\u_ctrl|s_ram_data_in[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~3_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(2));

-- Location: IOIBUF_X9_Y0_N29
\data_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: LCCOMB_X9_Y1_N22
\u_rom|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux4~0_combout\ = (\u_ctrl|s_rom_addr\(3) & ((\u_ctrl|s_rom_addr\(2)) # ((\u_ctrl|s_rom_addr\(1) & \u_ctrl|s_rom_addr\(0))))) # (!\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(1) $ (((!\u_ctrl|s_rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux4~0_combout\);

-- Location: FF_X9_Y1_N23
\u_rom|q_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux4~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(3));

-- Location: LCCOMB_X10_Y1_N10
\u_ctrl|rom_data_reg~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~4_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(3),
	combout => \u_ctrl|rom_data_reg~4_combout\);

-- Location: FF_X10_Y1_N11
\u_ctrl|rom_data_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~4_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(3));

-- Location: LCCOMB_X10_Y1_N22
\u_ctrl|s_ram_data_in~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~4_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[3]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_in[3]~input_o\,
	datac => \u_ctrl|state.S_DONE~q\,
	datad => \u_ctrl|rom_data_reg\(3),
	combout => \u_ctrl|s_ram_data_in~4_combout\);

-- Location: FF_X10_Y1_N23
\u_ctrl|s_ram_data_in[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~4_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(3));

-- Location: IOIBUF_X5_Y0_N29
\data_in[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(4),
	o => \data_in[4]~input_o\);

-- Location: LCCOMB_X9_Y1_N16
\u_rom|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux3~0_combout\ = (\u_ctrl|s_rom_addr\(3) & (((!\u_ctrl|s_rom_addr\(0)) # (!\u_ctrl|s_rom_addr\(2))) # (!\u_ctrl|s_rom_addr\(1)))) # (!\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(1) $ (\u_ctrl|s_rom_addr\(2) $ (\u_ctrl|s_rom_addr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux3~0_combout\);

-- Location: FF_X9_Y1_N17
\u_rom|q_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux3~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(4));

-- Location: LCCOMB_X10_Y1_N12
\u_ctrl|rom_data_reg~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~5_combout\ = (\u_rom|q_reg\(4) & !\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_rom|q_reg\(4),
	datac => \rst~input_o\,
	combout => \u_ctrl|rom_data_reg~5_combout\);

-- Location: FF_X10_Y1_N13
\u_ctrl|rom_data_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~5_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(4));

-- Location: LCCOMB_X10_Y1_N4
\u_ctrl|s_ram_data_in~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~5_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[4]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in[4]~input_o\,
	datac => \u_ctrl|state.S_DONE~q\,
	datad => \u_ctrl|rom_data_reg\(4),
	combout => \u_ctrl|s_ram_data_in~5_combout\);

-- Location: FF_X10_Y1_N5
\u_ctrl|s_ram_data_in[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~5_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(4));

-- Location: LCCOMB_X9_Y1_N18
\u_rom|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux2~0_combout\ = \u_ctrl|s_rom_addr\(3) $ (!\u_ctrl|s_rom_addr\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux2~0_combout\);

-- Location: FF_X9_Y1_N19
\u_rom|q_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux2~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(5));

-- Location: LCCOMB_X10_Y1_N26
\u_ctrl|rom_data_reg~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~6_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(5),
	combout => \u_ctrl|rom_data_reg~6_combout\);

-- Location: FF_X10_Y1_N27
\u_ctrl|rom_data_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~6_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(5));

-- Location: IOIBUF_X9_Y0_N1
\data_in[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(5),
	o => \data_in[5]~input_o\);

-- Location: LCCOMB_X10_Y1_N30
\u_ctrl|s_ram_data_in~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~6_combout\ = (\u_ctrl|state.S_DONE~q\ & ((\data_in[5]~input_o\))) # (!\u_ctrl|state.S_DONE~q\ & (\u_ctrl|rom_data_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|rom_data_reg\(5),
	datab => \data_in[5]~input_o\,
	datac => \u_ctrl|state.S_DONE~q\,
	combout => \u_ctrl|s_ram_data_in~6_combout\);

-- Location: FF_X10_Y1_N31
\u_ctrl|s_ram_data_in[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~6_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(5));

-- Location: LCCOMB_X9_Y1_N28
\u_rom|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux1~0_combout\ = \u_ctrl|s_rom_addr\(1) $ (((!\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(2) $ (\u_ctrl|s_rom_addr\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datab => \u_ctrl|s_rom_addr\(1),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux1~0_combout\);

-- Location: FF_X9_Y1_N29
\u_rom|q_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux1~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(6));

-- Location: LCCOMB_X10_Y1_N8
\u_ctrl|rom_data_reg~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~7_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(6),
	combout => \u_ctrl|rom_data_reg~7_combout\);

-- Location: FF_X10_Y1_N9
\u_ctrl|rom_data_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~7_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(6));

-- Location: IOIBUF_X9_Y0_N15
\data_in[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(6),
	o => \data_in[6]~input_o\);

-- Location: LCCOMB_X10_Y1_N0
\u_ctrl|s_ram_data_in~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~7_combout\ = (\u_ctrl|state.S_DONE~q\ & ((\data_in[6]~input_o\))) # (!\u_ctrl|state.S_DONE~q\ & (\u_ctrl|rom_data_reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \u_ctrl|rom_data_reg\(6),
	datad => \data_in[6]~input_o\,
	combout => \u_ctrl|s_ram_data_in~7_combout\);

-- Location: FF_X10_Y1_N1
\u_ctrl|s_ram_data_in[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~7_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(6));

-- Location: IOIBUF_X5_Y0_N8
\data_in[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(7),
	o => \data_in[7]~input_o\);

-- Location: LCCOMB_X9_Y1_N14
\u_rom|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_rom|Mux0~0_combout\ = (\u_ctrl|s_rom_addr\(3) & (\u_ctrl|s_rom_addr\(2))) # (!\u_ctrl|s_rom_addr\(3) & ((!\u_ctrl|s_rom_addr\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_rom_addr\(3),
	datac => \u_ctrl|s_rom_addr\(2),
	datad => \u_ctrl|s_rom_addr\(0),
	combout => \u_rom|Mux0~0_combout\);

-- Location: FF_X9_Y1_N15
\u_rom|q_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_rom|Mux0~0_combout\,
	ena => \u_ctrl|s_rom_re~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_rom|q_reg\(7));

-- Location: LCCOMB_X10_Y1_N2
\u_ctrl|rom_data_reg~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|rom_data_reg~8_combout\ = (!\rst~input_o\ & \u_rom|q_reg\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_rom|q_reg\(7),
	combout => \u_ctrl|rom_data_reg~8_combout\);

-- Location: FF_X10_Y1_N3
\u_ctrl|rom_data_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|rom_data_reg~8_combout\,
	ena => \u_ctrl|rom_data_reg[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|rom_data_reg\(7));

-- Location: LCCOMB_X10_Y1_N14
\u_ctrl|s_ram_data_in~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|s_ram_data_in~8_combout\ = (\u_ctrl|state.S_DONE~q\ & (\data_in[7]~input_o\)) # (!\u_ctrl|state.S_DONE~q\ & ((\u_ctrl|rom_data_reg\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ctrl|state.S_DONE~q\,
	datac => \data_in[7]~input_o\,
	datad => \u_ctrl|rom_data_reg\(7),
	combout => \u_ctrl|s_ram_data_in~8_combout\);

-- Location: FF_X10_Y1_N15
\u_ctrl|s_ram_data_in[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ctrl|s_ram_data_in~8_combout\,
	sclr => \rst~input_o\,
	ena => \u_ctrl|s_ram_data_in[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ctrl|s_ram_data_in\(7));

-- Location: M9K_X13_Y1_N0
\u_ram|mem_rtl_0|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "ram_sincrona:u_ram|altsyncram:mem_rtl_0|altsyncram_aki1:auto_generated|ALTSYNCRAM",
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
	portawe => \u_ctrl|s_ram_we~q\,
	portbre => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_ram|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X14_Y1_N28
\u_ram|q_reg~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~0_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(9))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(9),
	datac => \u_ram|mem~15_combout\,
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \u_ram|q_reg~0_combout\);

-- Location: IOIBUF_X7_Y0_N22
\re~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_re,
	o => \re~input_o\);

-- Location: LCCOMB_X11_Y1_N14
\u_ctrl|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector1~0_combout\ = (\u_ctrl|state.S_READ_RAM~q\) # ((\u_ctrl|state.S_DONE~q\ & \re~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_DONE~q\,
	datac => \re~input_o\,
	datad => \u_ctrl|state.S_READ_RAM~q\,
	combout => \u_ctrl|Selector1~0_combout\);

-- Location: FF_X11_Y1_N15
\u_ctrl|s_ram_re\ : dffeas
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
	q => \u_ctrl|s_ram_re~q\);

-- Location: LCCOMB_X12_Y1_N6
\u_ram|q_reg[5]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg[5]~1_combout\ = (\u_ctrl|s_ram_re~q\) # (\u_ctrl|s_ram_we~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|s_ram_re~q\,
	datad => \u_ctrl|s_ram_we~q\,
	combout => \u_ram|q_reg[5]~1_combout\);

-- Location: FF_X14_Y1_N29
\u_ram|q_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~0_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(0));

-- Location: FF_X12_Y1_N9
\u_ram|mem_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_data_in\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(10));

-- Location: LCCOMB_X12_Y1_N4
\u_ram|q_reg~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~2_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(10))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem~15_combout\,
	datac => \u_ram|mem_rtl_0_bypass\(10),
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a1\,
	combout => \u_ram|q_reg~2_combout\);

-- Location: FF_X12_Y1_N5
\u_ram|q_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~2_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(1));

-- Location: FF_X12_Y1_N29
\u_ram|mem_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_data_in\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(11));

-- Location: LCCOMB_X12_Y1_N28
\u_ram|q_reg~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~3_combout\ = (\u_ram|mem_rtl_0_bypass\(0) & (\u_ram|mem_rtl_0_bypass\(11))) # (!\u_ram|mem_rtl_0_bypass\(0) & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram|mem_rtl_0_bypass\(0),
	datac => \u_ram|mem_rtl_0_bypass\(11),
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a2\,
	combout => \u_ram|q_reg~3_combout\);

-- Location: LCCOMB_X12_Y1_N30
\u_ram|q_reg~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~4_combout\ = (\u_ram|mem~14_combout\ & ((\u_ram|mem~13_combout\ & ((\u_ram|q_reg~3_combout\))) # (!\u_ram|mem~13_combout\ & (\u_ram|mem_rtl_0|auto_generated|ram_block1a2\)))) # (!\u_ram|mem~14_combout\ & 
-- (((\u_ram|mem_rtl_0|auto_generated|ram_block1a2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem~14_combout\,
	datab => \u_ram|mem~13_combout\,
	datac => \u_ram|mem_rtl_0|auto_generated|ram_block1a2\,
	datad => \u_ram|q_reg~3_combout\,
	combout => \u_ram|q_reg~4_combout\);

-- Location: FF_X12_Y1_N31
\u_ram|q_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~4_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(2));

-- Location: LCCOMB_X14_Y1_N12
\u_ram|mem_rtl_0_bypass[12]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[12]~feeder_combout\ = \u_ctrl|s_ram_data_in\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_data_in\(3),
	combout => \u_ram|mem_rtl_0_bypass[12]~feeder_combout\);

-- Location: FF_X14_Y1_N13
\u_ram|mem_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(12));

-- Location: LCCOMB_X14_Y1_N2
\u_ram|q_reg~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~5_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(12))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(12),
	datac => \u_ram|mem~15_combout\,
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a3\,
	combout => \u_ram|q_reg~5_combout\);

-- Location: FF_X14_Y1_N3
\u_ram|q_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~5_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(3));

-- Location: LCCOMB_X14_Y1_N10
\u_ram|mem_rtl_0_bypass[13]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[13]~feeder_combout\ = \u_ctrl|s_ram_data_in\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_ctrl|s_ram_data_in\(4),
	combout => \u_ram|mem_rtl_0_bypass[13]~feeder_combout\);

-- Location: FF_X14_Y1_N11
\u_ram|mem_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(13));

-- Location: LCCOMB_X14_Y1_N16
\u_ram|q_reg~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~6_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(13))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(13),
	datac => \u_ram|mem~15_combout\,
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a4\,
	combout => \u_ram|q_reg~6_combout\);

-- Location: FF_X14_Y1_N17
\u_ram|q_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~6_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(4));

-- Location: LCCOMB_X14_Y1_N0
\u_ram|mem_rtl_0_bypass[14]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[14]~feeder_combout\ = \u_ctrl|s_ram_data_in\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_data_in\(5),
	combout => \u_ram|mem_rtl_0_bypass[14]~feeder_combout\);

-- Location: FF_X14_Y1_N1
\u_ram|mem_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(14));

-- Location: LCCOMB_X14_Y1_N18
\u_ram|q_reg~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~7_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(14))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_ram|mem_rtl_0_bypass\(14),
	datac => \u_ram|mem~15_combout\,
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a5\,
	combout => \u_ram|q_reg~7_combout\);

-- Location: FF_X14_Y1_N19
\u_ram|q_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~7_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(5));

-- Location: FF_X12_Y1_N3
\u_ram|mem_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \u_ctrl|s_ram_data_in\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(15));

-- Location: LCCOMB_X12_Y1_N2
\u_ram|q_reg~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~8_combout\ = (\u_ram|mem_rtl_0_bypass\(0) & ((\u_ram|mem_rtl_0_bypass\(15)))) # (!\u_ram|mem_rtl_0_bypass\(0) & (\u_ram|mem_rtl_0|auto_generated|ram_block1a6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0|auto_generated|ram_block1a6\,
	datac => \u_ram|mem_rtl_0_bypass\(15),
	datad => \u_ram|mem_rtl_0_bypass\(0),
	combout => \u_ram|q_reg~8_combout\);

-- Location: LCCOMB_X12_Y1_N24
\u_ram|q_reg~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~9_combout\ = (\u_ram|mem~14_combout\ & ((\u_ram|mem~13_combout\ & ((\u_ram|q_reg~8_combout\))) # (!\u_ram|mem~13_combout\ & (\u_ram|mem_rtl_0|auto_generated|ram_block1a6\)))) # (!\u_ram|mem~14_combout\ & 
-- (((\u_ram|mem_rtl_0|auto_generated|ram_block1a6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem~14_combout\,
	datab => \u_ram|mem~13_combout\,
	datac => \u_ram|mem_rtl_0|auto_generated|ram_block1a6\,
	datad => \u_ram|q_reg~8_combout\,
	combout => \u_ram|q_reg~9_combout\);

-- Location: FF_X12_Y1_N25
\u_ram|q_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~9_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(6));

-- Location: LCCOMB_X14_Y1_N26
\u_ram|mem_rtl_0_bypass[16]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|mem_rtl_0_bypass[16]~feeder_combout\ = \u_ctrl|s_ram_data_in\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_ctrl|s_ram_data_in\(7),
	combout => \u_ram|mem_rtl_0_bypass[16]~feeder_combout\);

-- Location: FF_X14_Y1_N27
\u_ram|mem_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|mem_rtl_0_bypass[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|mem_rtl_0_bypass\(16));

-- Location: LCCOMB_X14_Y1_N24
\u_ram|q_reg~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ram|q_reg~10_combout\ = (\u_ram|mem~15_combout\ & (\u_ram|mem_rtl_0_bypass\(16))) # (!\u_ram|mem~15_combout\ & ((\u_ram|mem_rtl_0|auto_generated|ram_block1a7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ram|mem_rtl_0_bypass\(16),
	datac => \u_ram|mem~15_combout\,
	datad => \u_ram|mem_rtl_0|auto_generated|ram_block1a7\,
	combout => \u_ram|q_reg~10_combout\);

-- Location: FF_X14_Y1_N25
\u_ram|q_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_ram|q_reg~10_combout\,
	ena => \u_ram|q_reg[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_ram|q_reg\(7));

-- Location: LCCOMB_X8_Y1_N24
\u_ctrl|Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \u_ctrl|Selector6~0_combout\ = (\u_ctrl|state.S_DONE~q\) # ((\u_ctrl|state.S_IDLE~q\ & \u_ctrl|done_reg~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_ctrl|state.S_IDLE~q\,
	datac => \u_ctrl|done_reg~q\,
	datad => \u_ctrl|state.S_DONE~q\,
	combout => \u_ctrl|Selector6~0_combout\);

-- Location: FF_X8_Y1_N25
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

ww_data_out(0) <= \data_out[0]~output_o\;

ww_data_out(1) <= \data_out[1]~output_o\;

ww_data_out(2) <= \data_out[2]~output_o\;

ww_data_out(3) <= \data_out[3]~output_o\;

ww_data_out(4) <= \data_out[4]~output_o\;

ww_data_out(5) <= \data_out[5]~output_o\;

ww_data_out(6) <= \data_out[6]~output_o\;

ww_data_out(7) <= \data_out[7]~output_o\;

ww_done <= \done~output_o\;
END structure;


