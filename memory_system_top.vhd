-- ============================================================
-- memory_system_top.vhd
-- Top-level del sistema ROM + RAM + FSM
-- Universidad del Cauca - SENA Ficha 3229446
-- Andre Luna - Mayo 2026
-- ============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_system_top is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    addr     : in  addr_t;
    data_in  : in  word_t;
    we       : in  std_logic;
    re       : in  std_logic;
    data_out : out word_t;
    done     : out std_logic;
    HEX0     : out std_logic_vector(6 downto 0);
    HEX1     : out std_logic_vector(6 downto 0)
  );
end entity memory_system_top;

architecture structural of memory_system_top is

  signal data_out_s : word_t;
  signal done_s     : std_logic;

begin

  -- Instancia del controlador FSM
  -- Contiene ROM y RAM internamente
  u_ctrl : memory_controller
    port map (
      clk      => clk,
      rst      => rst,
      addr     => addr,
      data_in  => data_in,
      we       => we,
      re       => re,
      data_out => data_out_s,
      done     => done_s
    );

  -- Display nibble bajo (bits 3..0) en HEX0
u_hex0 : dec_7seg
  port map (
    bcd => to_integer(unsigned(data_out_s(3 downto 0))),
    seg  => HEX0
  );

-- Display nibble alto (bits 7..4) en HEX1
u_hex1 : dec_7seg
  port map (
    bcd => to_integer(unsigned(data_out_s(7 downto 4))),
    seg  => HEX1
  );

  data_out <= data_out_s;
  done     <= done_s;

end architecture structural;