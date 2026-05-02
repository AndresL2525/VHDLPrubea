-- =============================================================
-- memory_system_top.vhd
-- Top-level estructural: ROM + RAM + FSM
-- Señales externas: clk, rst, addr, data_in, data_out, we, re
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_system_top is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    -- Señales de acceso externo (activas después de done)
    addr     : in  addr_word;
    data_in  : in  data_word;
    we       : in  std_logic;
    re       : in  std_logic;
    -- Salidas
    data_out : out data_word;
    done     : out std_logic
  );
end entity memory_system_top;

architecture structural of memory_system_top is

  -- -------------------------------------------------------
  -- Señales internas entre controlador y memorias
  -- -------------------------------------------------------
  signal rom_re_s      : std_logic;
  signal rom_addr_s    : addr_word;
  signal rom_data_s    : data_word;

  signal ram_we_s      : std_logic;
  signal ram_re_s      : std_logic;
  signal ram_addr_s    : addr_word;
  signal ram_din_s     : data_word;
  signal ram_dout_s    : data_word;

  signal data_out_s    : data_word;
  signal done_s        : std_logic;

begin

  -- -------------------------------------------------------
  -- Instancia ROM síncrona
  -- -------------------------------------------------------
  u_rom : component rom_sync
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH
    )
    port map (
      clk      => clk,
      re       => rom_re_s,
      addr     => rom_addr_s,
      data_out => rom_data_s
    );

  -- -------------------------------------------------------
  -- Instancia RAM síncrona
  -- -------------------------------------------------------
  u_ram : component ram_sincrona
    generic map (
      DATA_WIDTH => DATA_WIDTH,
      ADDR_WIDTH => ADDR_WIDTH,
      RDW_MODE   => "READ_FIRST"
    )
    port map (
      clk      => clk,
      rd_en    => ram_re_s,
      wr_en    => ram_we_s,
      addr     => ram_addr_s,
      data_in  => ram_din_s,
      data_out => ram_dout_s
    );

  -- -------------------------------------------------------
  -- Instancia controlador FSM
  -- -------------------------------------------------------
  u_ctrl : component memory_controller
    port map (
      clk          => clk,
      rst          => rst,
      rom_re       => rom_re_s,
      rom_addr     => rom_addr_s,
      rom_data     => rom_data_s,
      ram_we       => ram_we_s,
      ram_re       => ram_re_s,
      ram_addr     => ram_addr_s,
      ram_data_in  => ram_din_s,
      ram_data_out => ram_dout_s,
      ext_we       => we,
      ext_re       => re,
      ext_addr     => addr,
      ext_data_in  => data_in,
      data_out     => data_out_s,
      done         => done_s
    );

  -- -------------------------------------------------------
  -- Salidas del top-level
  -- -------------------------------------------------------
  data_out <= data_out_s;
  done     <= done_s;

end architecture structural;