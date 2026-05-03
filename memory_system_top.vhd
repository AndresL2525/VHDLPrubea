-- ============================================================
-- memory_system_top.vhd
-- Top-level del sistema ROM + RAM + FSM para FPGA
-- Universidad del Cauca
-- Andre Luna
-- ============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_system_top is
  port (
    CLOCK_50 : in  std_logic;                    -- Reloj principal FPGA
    KEY      : in  std_logic_vector(0 downto 0); -- KEY0 usado como reset
    SW       : in  std_logic_vector(1 downto 0); -- Selector de velocidad
    HEX0     : out std_logic_vector(6 downto 0); -- Nibble bajo
    HEX1     : out std_logic_vector(6 downto 0)  -- Nibble alto
  );
end entity memory_system_top;

architecture structural of memory_system_top is

  -- Reset interno activo en alto.
  -- KEY0 normalmente es activo en bajo, por eso se invierte.
  signal rst : std_logic;

  -- Reloj lento generado por el divisor de frecuencia.
  signal clk_lento : std_logic;

  -- Señales internas entre ROM, RAM y FSM
  signal rom_re_s   : std_logic;
  signal rom_addr_s : addr_word;
  signal rom_data_s : data_word;

  signal ram_we_s   : std_logic;
  signal ram_re_s   : std_logic;
  signal ram_addr_s : addr_word;
  signal ram_din_s  : data_word;
  signal ram_dout_s : data_word;

  -- Dato final que se mostrará en los displays
  signal display_s : data_word;

  -- Conversión de cada nibble a entero para el decodificador
  signal hex_low  : integer range 0 to 15;
  signal hex_high : integer range 0 to 15;

begin

  -- KEY0 activo en bajo
  rst <= not KEY(0);

  -- =========================================================
  -- Divisor de frecuencia
  -- =========================================================
  u_div : entity work.divisor_frecuencia
    port map (
      clk_50    => CLOCK_50,
      reset     => rst,
      selector  => SW,
      clk_lento => clk_lento
    );

  -- =========================================================
  -- ROM síncrona
  -- =========================================================
  u_rom : entity work.rom_sync
    port map (
      clk      => clk_lento,
      re       => rom_re_s,
      addr     => rom_addr_s,
      data_out => rom_data_s
    );

  -- =========================================================
  -- RAM síncrona
  -- =========================================================
  u_ram : entity work.ram_sincrona
    port map (
      clk      => clk_lento,
      rd_en    => ram_re_s,
      wr_en    => ram_we_s,
      addr     => ram_addr_s,
      data_in  => ram_din_s,
      data_out => ram_dout_s
    );

  -- =========================================================
  -- Controlador FSM
  -- =========================================================
  u_ctrl : entity work.memory_controller
    port map (
      clk          => clk_lento,
      rst          => rst,

      rom_re       => rom_re_s,
      rom_addr     => rom_addr_s,
      rom_data     => rom_data_s,

      ram_we       => ram_we_s,
      ram_re       => ram_re_s,
      ram_addr     => ram_addr_s,
      ram_data_in  => ram_din_s,
      ram_data_out => ram_dout_s,

      display_data => display_s
    );

  -- =========================================================
  -- Separación del dato de 8 bits en dos nibbles
  -- =========================================================
  hex_low  <= to_integer(unsigned(display_s(3 downto 0)));
  hex_high <= to_integer(unsigned(display_s(7 downto 4)));

  -- =========================================================
  -- Display HEX0: nibble bajo
  -- =========================================================
  u_hex0 : entity work.dec_7seg
    port map (
      bcd => hex_low,
      seg => HEX0
    );

  -- =========================================================
  -- Display HEX1: nibble alto
  -- =========================================================
  u_hex1 : entity work.dec_7seg
    port map (
      bcd => hex_high,
      seg => HEX1
    );

end architecture structural;