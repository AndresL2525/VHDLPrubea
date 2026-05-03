-- =============================================================
-- Archivo : rom_sync.vhd
-- Descripción:
--   Memoria ROM síncrona de 16 posiciones x 8 bits.
--
--   La ROM contiene datos predefinidos.
--   Solo permite lectura.
--
--   La lectura es síncrona:
--   el dato de salida se actualiza en el flanco de subida
--   del reloj cuando re = '1'.
--
--   Usa:
--     - data_word
--     - addr_word
--     - mem_t
--     - addr_to_integer()
--
--   Estos elementos vienen del paquete mem_pkg.
-- =============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity rom_sync is
  port (
    clk      : in  std_logic;   -- Reloj del sistema
    re       : in  std_logic;   -- Habilitación de lectura
    addr     : in  addr_word;   -- Dirección de lectura
    data_out : out data_word    -- Dato leído desde la ROM
  );
end entity rom_sync;

architecture rtl of rom_sync is

  -- =========================================================
  -- Contenido fijo de la ROM
  -- =========================================================
  -- La ROM tiene 16 posiciones.
  -- Cada posición almacena un dato de 8 bits.
  --
  -- Estos valores son constantes, por eso se declara como
  -- constant y no como signal.
  constant rom_mem : mem_t := (
    0  => x"AA",  -- Dirección 0
    1  => x"55",  -- Dirección 1
    2  => x"F0",  -- Dirección 2
    3  => x"0F",  -- Dirección 3
    4  => x"FF",  -- Dirección 4
    5  => x"00",  -- Dirección 5
    6  => x"A5",  -- Dirección 6
    7  => x"5A",  -- Dirección 7
    8  => x"12",  -- Dirección 8
    9  => x"34",  -- Dirección 9
    10 => x"56",  -- Dirección 10
    11 => x"78",  -- Dirección 11
    12 => x"9A",  -- Dirección 12
    13 => x"BC",  -- Dirección 13
    14 => x"DE",  -- Dirección 14
    15 => x"EF"   -- Dirección 15
  );

  -- Registro de salida.
  -- Guarda el último dato leído.
  signal q_reg : data_word := (others => '0');

  -- =========================================================
  -- Atributo para implementación en FPGA
  -- =========================================================
  -- Indica a Quartus que puede implementar esta memoria
  -- usando bloques internos M9K.
  attribute romstyle : string;
  attribute romstyle of rom_mem : constant is "M9K";

begin

  -- =========================================================
  -- Proceso de lectura síncrona
  -- =========================================================
  -- En cada flanco de subida del reloj:
  --   - Si re = '1', se lee la posición indicada por addr.
  --   - La dirección se convierte a integer usando la función
  --     addr_to_integer() definida en mem_pkg.
  process(clk)
  begin
    if rising_edge(clk) then
      if re = '1' then
        q_reg <= rom_mem(addr_to_integer(addr));
      end if;
    end if;
  end process;

  -- La salida de la ROM es el valor guardado en q_reg.
  data_out <= q_reg;

end architecture rtl;