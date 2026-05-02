-- =============================================================
-- rom_sync.vhd
-- ROM sincrona 16x8 inicializada con datos predefinidos
-- Universidad del Cauca - SENA Ficha 3229446
-- Andre Lopez - Mayo 2026
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity rom_sync is
  port (
    clk      : in  std_logic;
    re       : in  std_logic;
    addr     : in  addr_t;
    data_out : out word_t
  );
end entity rom_sync;

architecture rtl of rom_sync is

  constant rom_mem : mem_t := (
    0  => x"AA",
    1  => x"55",
    2  => x"F0",
    3  => x"0F",
    4  => x"FF",
    5  => x"00",
    6  => x"A5",
    7  => x"5A",
    8  => x"12",
    9  => x"34",
    10 => x"56",
    11 => x"78",
    12 => x"9A",
    13 => x"BC",
    14 => x"DE",
    15 => x"EF"
  );

  signal q_reg : word_t := (others => '0');

  attribute romstyle : string;
  attribute romstyle of rom_mem : constant is "M9K";

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if re = '1' then
        q_reg <= rom_mem(to_integer(unsigned(addr)));
      end if;
    end if;
  end process;

  data_out <= q_reg;

end architecture rtl;
