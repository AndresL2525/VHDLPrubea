-- =============================================================
-- Archivo : mem_pkg.vhd
-- Descripción:
--   Paquete principal del sistema ROM-RAM.
--   Define constantes, tipos de datos, tipo de memoria,
--   una función para convertir direcciones y un procedimiento
--   para limpiar señales de control.
-- =============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mem_pkg is

  -- =========================================================
  -- Constantes globales del sistema
  -- =========================================================
  -- DATA_WIDTH define el tamaño de cada palabra de memoria.
  -- En este proyecto cada dato tiene 8 bits.
  constant DATA_WIDTH : integer := 8;

  -- ADDR_WIDTH define el tamaño del bus de direcciones.
  -- Con 4 bits se pueden direccionar 16 posiciones.
  constant ADDR_WIDTH : integer := 4;

  -- MEM_DEPTH define la cantidad total de posiciones de memoria.
  -- Como ADDR_WIDTH = 4, entonces MEM_DEPTH = 2^4 = 16.
  constant MEM_DEPTH : integer := 2**ADDR_WIDTH;

  -- =========================================================
  -- Tipos definidos para el proyecto
  -- =========================================================
  -- data_word representa una palabra de datos de 8 bits.
  subtype data_word is std_logic_vector(DATA_WIDTH-1 downto 0);

  -- addr_word representa una dirección de memoria de 4 bits.
  subtype addr_word is std_logic_vector(ADDR_WIDTH-1 downto 0);

  -- mem_t representa una memoria de 16 posiciones,
  -- donde cada posición almacena una palabra de 8 bits.
  type mem_t is array (0 to MEM_DEPTH-1) of data_word;

  -- =========================================================
  -- Función: addr_to_integer
  -- =========================================================
  -- Convierte una dirección tipo addr_word a integer.
  -- Se usa para acceder a posiciones dentro de arreglos ROM/RAM.
  function addr_to_integer(addr : addr_word) return integer;

  -- =========================================================
  -- Procedimiento: clear_control_signals
  -- =========================================================
  -- Limpia las señales principales de control.
  -- Se usa en la FSM para dejar ROM y RAM desactivadas
  -- cuando no se está leyendo ni escribiendo.
  procedure clear_control_signals(
    signal rom_re : out std_logic;
    signal ram_we : out std_logic;
    signal ram_re : out std_logic
  );

end package mem_pkg;

-- =============================================================
-- Cuerpo del paquete
-- Aquí se implementan la función y el procedimiento declarados.
-- =============================================================

package body mem_pkg is

  -- =========================================================
  -- Implementación de addr_to_integer
  -- =========================================================
  function addr_to_integer(addr : addr_word) return integer is
  begin
    return to_integer(unsigned(addr));
  end function;

  -- =========================================================
  -- Implementación de clear_control_signals
  -- =========================================================
  procedure clear_control_signals(
    signal rom_re : out std_logic;
    signal ram_we : out std_logic;
    signal ram_re : out std_logic
  ) is
  begin
    rom_re <= '0';
    ram_we <= '0';
    ram_re <= '0';
  end procedure;

end package body mem_pkg;