-- =============================================================
-- rom_sync.vhd
-- ROM síncrona 16×8, inicializada con datos predefinidos
-- Usa addr_to_integer del package mem_pkg
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity rom_sync is
  generic (
    DATA_WIDTH : positive := 8;
    ADDR_WIDTH : positive := 4
  );
  port (
    clk      : in  std_logic;
    re       : in  std_logic;           -- read enable
    addr     : in  addr_word;
    data_out : out data_word
  );
end entity rom_sync;

architecture rtl of rom_sync is

  -- Contenido inicial de la ROM (16 posiciones)
  constant rom_mem : mem_array := (
    0  => x"AA",  -- 1010 1010
    1  => x"55",  -- 0101 0101
    2  => x"F0",  -- 1111 0000
    3  => x"0F",  -- 0000 1111
    4  => x"FF",  -- 1111 1111
    5  => x"00",  -- 0000 0000
    6  => x"A5",  -- 1010 0101
    7  => x"5A",  -- 0101 1010
    8  => x"12",
    9  => x"34",
    10 => x"56",
    11 => x"78",
    12 => x"9A",
    13 => x"BC",
    14 => x"DE",
    15 => x"EF"
  );

  signal q_reg : data_word := (others => '0');

  attribute romstyle        : string;
  attribute romstyle of rom_mem : constant is "M9K";

begin

  -- Lectura síncrona con read enable
  process(clk)
  begin
    if rising_edge(clk) then
      if re = '1' then
        q_reg <= rom_mem(addr_to_integer(addr));
      end if;
    end if;
  end process;

  data_out <= q_reg;

end architecture rtl;