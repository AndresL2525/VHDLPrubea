-- =============================================================
-- ram_sincrona.vhd
-- RAM sincrona 16x8, lectura/escritura parametrizable
-- Universidad del Cauca - SENA Ficha 3229446
-- Andre Lopez - Mayo 2026
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity ram_sincrona is
  generic (
    DATA_WIDTH : positive := 8;
    ADDR_WIDTH : positive := 4;
    RDW_MODE   : string   := "READ_FIRST"
  );
  port (
    clk      : in  std_logic;
    rd_en    : in  std_logic;
    wr_en    : in  std_logic;
    addr     : in  addr_t;
    data_in  : in  word_t;
    data_out : out word_t
  );
end entity ram_sincrona;

architecture rtl of ram_sincrona is

  type ram_type is array (0 to 2**ADDR_WIDTH-1) of word_t;
  signal mem   : ram_type;
  signal q_reg : word_t := (others => '0');

  attribute ramstyle        : string;
  attribute ramstyle of mem : signal is "M9K";

begin

  process(clk)
    variable idx : integer range 0 to 2**ADDR_WIDTH-1;
  begin
    if rising_edge(clk) then
      idx := to_integer(unsigned(addr));
      if wr_en = '1' then
        mem(idx) <= data_in;
        if    RDW_MODE = "WRITE_FIRST" then q_reg <= data_in;
        elsif RDW_MODE = "READ_FIRST"  then q_reg <= mem(idx);
        end if;
      elsif rd_en = '1' then
        q_reg <= mem(idx);
      end if;
    end if;
  end process;

  data_out <= q_reg;

end architecture rtl;