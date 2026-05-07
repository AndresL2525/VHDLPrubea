-- =============================================================
-- Archivo      : rom_sync.vhd
-- Proyecto     : Sistema con Memorias ROM y RAM
-- Universidad  : Universidad del Cauca
-- Autor        : Camilo Andres Luna
-- Fecha        : Mayo 2026
--
-- Descripcion:
--   Memoria ROM sincrona de 16 posiciones x 8 bits.
--   Contiene datos predefinidos que no pueden modificarse
--   en tiempo de ejecucion. Es la fuente de datos del sistema.
--
--   Comportamiento:
--   La lectura ocurre en el flanco de subida del reloj
--   cuando re = '1'. El dato tarda un ciclo en aparecer
--   en data_out debido a la naturaleza sincrona del diseno.
--   Por esto, la FSM usa dos estados de espera antes de
--   capturar el dato (S_WAIT_ROM y S_WAIT_ROM2).
--
--   Elementos usados del paquete mem_pkg:
--     data_word      : tipo del dato de salida (8 bits)
--     addr_word      : tipo de la direccion de entrada (4 bits)
--     mem_t          : tipo del arreglo interno de la ROM
--     addr_to_integer: funcion para convertir la direccion
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity rom_sync is
  port (
    clk      : in  std_logic;   -- Reloj del sistema (generado por divisor_frecuencia)
    re       : in  std_logic;   -- Habilitacion de lectura: '1' activa la lectura
    addr     : in  addr_word;   -- Direccion de 4 bits que selecciona la posicion
    data_out : out data_word    -- Dato de 8 bits leido en el ciclo anterior
  );
end entity rom_sync;

architecture rtl of rom_sync is

  -- Contenido fijo de la ROM.
  -- Se inicializa con 16 valores hexadecimales que representan
  -- los datos que la FSM copiara hacia la RAM.
  -- Se usa constant porque los datos nunca cambian.
  constant rom_mem : mem_t := (
    0  => x"AA",  -- Direccion 0:  1010 1010
    1  => x"55",  -- Direccion 1:  0101 0101
    2  => x"F0",  -- Direccion 2:  1111 0000
    3  => x"0F",  -- Direccion 3:  0000 1111
    4  => x"FF",  -- Direccion 4:  1111 1111
    5  => x"00",  -- Direccion 5:  0000 0000
    6  => x"A5",  -- Direccion 6:  1010 0101
    7  => x"5A",  -- Direccion 7:  0101 1010
    8  => x"12",  -- Direccion 8:  0001 0010
    9  => x"34",  -- Direccion 9:  0011 0100
    10 => x"56",  -- Direccion 10: 0101 0110
    11 => x"78",  -- Direccion 11: 0111 1000
    12 => x"9A",  -- Direccion 12: 1001 1010
    13 => x"BC",  -- Direccion 13: 1011 1100
    14 => x"DE",  -- Direccion 14: 1101 1110
    15 => x"EF"   -- Direccion 15: 1110 1111
  );

  -- Registro de salida que retiene el ultimo dato leido.
  -- en el flanco y se mantiene estable hasta la proxima lectura.
  signal q_reg : data_word := (others => '0');

  -- Atributo que indica a Quartus usar bloques M9K de la FPGA.
  -- Sin este atributo Quartus podria usar logica distribuida,
  -- lo cual es menos eficiente para memorias grandes.
  attribute romstyle : string;
  attribute romstyle of rom_mem : constant is "M9K";

begin

  -- Proceso de lectura sincrona.
  -- Solo actualiza q_reg cuando re = '1' y hay flanco de subida.
  -- La direccion se convierte a entero con addr_to_integer()
  -- definida en mem_pkg para acceder al arreglo rom_mem.
  process(clk)
  begin
    if rising_edge(clk) then
      if re = '1' then
        q_reg <= rom_mem(addr_to_integer(addr));
      end if;
    end if;
  end process;

  -- Conecta el registro interno a la salida del modulo.
  -- data_out siempre refleja el ultimo dato leido.
  data_out <= q_reg;

end architecture rtl;