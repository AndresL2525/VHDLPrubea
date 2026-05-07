-- =============================================================
-- Archivo      : divisor_frecuencia.vhd
-- Proyecto     : Sistema con Memorias ROM y RAM
-- Universidad  : Universidad del Cauca
-- Autor        : Camilo Andres Luna
-- Fecha        : Mayo 2026
--
-- Descripcion:
--   Divisor de frecuencia configurable para la FPGA DE0.
--   Recibe el reloj principal de 50 MHz de la FPGA y genera
--   un reloj mas lento que controla la velocidad de la FSM.
--
--
--   Frecuencias de salida segun selector:
--     "00" -> ~1 Hz   (cambio lento, facil de observar)
--     "01" -> ~2 Hz
--     "10" -> ~4 Hz
--     "11" -> ~8 Hz   (cambio rapido, util para simulacion)
--
--   Principio de funcionamiento:
--   El contador interno cuenta ciclos del reloj de 50 MHz.
--   Al llegar al limite configurado, invierte la senal de
--   salida. El periodo del reloj de salida es el doble del
--   tiempo que tarda el contador en llegar al limite.
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia is
  port (
    clk_50    : in  std_logic;                    -- Reloj principal FPGA: 50 MHz
    reset     : in  std_logic;                    -- Reset sincrono activo en alto
    selector  : in  std_logic_vector(1 downto 0); -- SW[1:0]: elige la frecuencia de salida
    clk_lento : out std_logic                     -- Reloj dividido hacia la FSM y memorias
  );
end entity divisor_frecuencia;

architecture arch1 of divisor_frecuencia is

  -- Contador de 26 bits para dividir el reloj de 50 MHz.
  -- Con 26 bits se puede contar hasta 67,108,864,
  -- suficiente para generar frecuencias desde 1 Hz.
  signal cnt     : unsigned(25 downto 0) := (others => '0');

  -- Registro de la senal de salida.
  -- Se invierte cada vez que cnt llega al limite.
  signal clk_reg : std_logic := '0';

  -- Limite del contador segun la frecuencia seleccionada.
  -- Definido como senal para poder asignarse desde un proceso.
  signal limite  : unsigned(25 downto 0);

begin

  -- Proceso combinacional: selecciona el limite del contador
  -- segun el valor de los switches SW[1:0].
  -- Un limite menor produce una frecuencia de salida mayor.
  process(selector)
  begin
    case selector is
      when "00" =>
        limite <= to_unsigned(10, 26); -- Frecuencia baja (~1 Hz en FPGA real)
      when "01" =>
        limite <= to_unsigned(5, 26);  -- Frecuencia media-baja (~2 Hz en FPGA real)
      when "10" =>
        limite <= to_unsigned(3, 26);  -- Frecuencia media-alta (~4 Hz en FPGA real)
      when others =>
        limite <= to_unsigned(1, 26);  -- Frecuencia alta (~8 Hz en FPGA real)
    end case;
  end process;

  -- Proceso secuencial: cuenta ciclos y genera el reloj lento.
  -- En cada flanco de subida de clk_50:
  --   - Si el contador llega al limite: reinicia y cambia clk_reg
  --   - Si no: incrementa el contador
  -- El reset pone el contador y la salida en cero.
  process(clk_50, reset)
  begin
    if reset = '1' then
      cnt     <= (others => '0');
      clk_reg <= '0';
    elsif rising_edge(clk_50) then
      if cnt = limite then
        cnt     <= (others => '0');
        clk_reg <= not clk_reg;
      else
        cnt <= cnt + 1;
      end if;
    end if;
  end process;

  -- Conecta el registro interno a la salida del modulo.
  -- Este reloj alimenta directamente la FSM, la ROM y la RAM.
  clk_lento <= clk_reg;

end architecture arch1;