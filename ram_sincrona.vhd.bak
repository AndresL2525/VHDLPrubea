-- =============================================================
-- ram_sincrona.vhd
-- RAM síncrona 16×8, lectura/escritura parametrizable
-- Adaptada del código base existente para usar mem_pkg
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
    addr     : in  addr_word;
    data_in  : in  data_word;
    data_out : out data_word
  );
end entity ram_sincrona;

architecture rtl of ram_sincrona is

  type ram_type is array (0 to 2**ADDR_WIDTH-1) of data_word;

  signal mem    : ram_type;
  signal q_reg  : data_word := (others => '0');

  attribute ramstyle        : string;
  attribute ramstyle of mem : signal is "M9K";

begin

  process(clk)
    variable idx : integer range 0 to 2**ADDR_WIDTH-1;
  begin
    if rising_edge(clk) then
      idx := addr_to_integer(addr);   -- usa función del package
      if wr_en = '1' then
        mem(idx) <= data_in;
        -- Política de lectura en escritura simultánea
        if    RDW_MODE = "WRITE_FIRST" then q_reg <= data_in;
        elsif RDW_MODE = "READ_FIRST"  then q_reg <= mem(idx);
        -- NO_CHANGE: q_reg no se toca
        end if;
      elsif rd_en = '1' then
        q_reg <= mem(idx);
      end if;
    end if;
  end process;

  data_out <= q_reg;

end architecture rtl;