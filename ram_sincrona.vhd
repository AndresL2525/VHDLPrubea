-- =============================================================
-- Archivo      : ram_sincrona.vhd
-- Proyecto     : Sistema con Memorias ROM y RAM
-- Universidad  : Universidad del Cauca
-- Autor        : Camilo Andres Luna
-- Fecha        : Mayo 2026
--
-- Descripcion:
--   Memoria RAM sincrona de 16 posiciones x 8 bits.
--   Es el destino de los datos copiados desde la ROM por la FSM.
--   Tambien es la fuente del dato que se envia al display.
--
--   Operaciones soportadas:
--     Escritura : ocurre cuando wr_en = '1' en flanco de subida.
--                 La FSM la activa en el estado S_WRITE_RAM.
--     Lectura   : ocurre cuando rd_en = '1' en flanco de subida.
--                 La FSM la activa en S_READ_RAM y S_READ_RAM_WAIT.
--
--   Prioridad de operacion:
--   La escritura tiene prioridad sobre la lectura. Si ambas
--   senales estan activas al mismo tiempo, solo se escribe.
--   En este sistema la FSM garantiza que nunca ocurren
--   simultaneamente, pero la prioridad se mantiene por diseno.
--
--   Latencia de lectura:
--   La RAM es sincrona: el dato leido no aparece en data_out
--   en el mismo ciclo en que se activa rd_en, sino en el
--   ciclo siguiente. Por esto la FSM incluye el estado
--   S_READ_RAM_WAIT antes de capturar el dato en S_SHOW.
--
--
--   Elementos usados del paquete mem_pkg:
--     data_word      : tipo del dato de entrada y salida (8 bits)
--     addr_word      : tipo de la direccion (4 bits)
--     mem_t          : tipo del arreglo interno de la RAM
--     MEM_DEPTH      : constante con el numero de posiciones (16)
--     addr_to_integer: funcion para convertir addr a indice entero
-- =============================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity ram_sincrona is
  port (
    clk      : in  std_logic;  -- Reloj del sistema
    rd_en    : in  std_logic;  -- Habilitación de lectura
    wr_en    : in  std_logic;  -- Habilitación de escritura
    addr     : in  addr_word;  -- Dirección de memoria
    data_in  : in  data_word;  -- Dato que se escribe en RAM
    data_out : out data_word   -- Dato leído desde RAM
  );
end entity ram_sincrona;

architecture rtl of ram_sincrona is

  -- =========================================================
  -- Memoria interna
  -- =========================================================
  -- mem_t fue definido en mem_pkg como una memoria de:
  --   16 posiciones x 8 bits
  signal mem : mem_t;

  -- Registro de salida.
  -- Guarda el último dato leído.
  signal q_reg : data_word := (others => '0');

  -- =========================================================
  -- Atributo para implementación en FPGA
  -- =========================================================
  -- Indica a Quartus que puede implementar esta memoria
  -- usando bloques internos M9K.
  attribute ramstyle : string;
  attribute ramstyle of mem : signal is "M9K";

begin

  -- =========================================================
  -- Proceso de lectura/escritura síncrona
  -- =========================================================
  -- En cada flanco de subida del reloj:
  --
  --   1. Se convierte la dirección addr a entero.
  --   2. Si wr_en = '1', se escribe data_in en la RAM.
  --   3. Si wr_en = '0' y rd_en = '1', se lee la RAM.
  --
  -- Se da prioridad a la escritura sobre la lectura.
  process(clk)
    variable idx : integer range 0 to MEM_DEPTH-1;
  begin
    if rising_edge(clk) then

      -- Conversión de dirección vectorial a índice entero.
      idx := addr_to_integer(addr);

      -- Escritura en RAM
      if wr_en = '1' then
        mem(idx) <= data_in;

      -- Lectura desde RAM
      elsif rd_en = '1' then
        q_reg <= mem(idx);
      end if;

    end if;
  end process;

  -- La salida corresponde al registro de lectura.
  data_out <= q_reg;

end architecture rtl;	