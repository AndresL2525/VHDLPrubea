-- =============================================================
-- Archivo : divisor_frecuencia.vhd
-- Descripción:
--   Divisor de frecuencia para la FPGA DE0.
--   Recibe el reloj principal de 50 MHz y genera un reloj lento.
--
--   El selector permite elegir la velocidad:
--     selector = "00" -> frecuencia lenta base
--     selector = "01" -> más rápida
--     selector = "10" -> más rápida
--     selector = "11" -> más rápida
--
--   Este reloj lento se usa para que la FSM avance despacio
--   y los cambios puedan observarse en los displays.
-- =============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia is
  port (
    clk_50     : in  std_logic;                      -- Reloj principal de 50 MHz
    reset      : in  std_logic;                      -- Reset activo en alto
    selector   : in  std_logic_vector(1 downto 0);   -- Selector de velocidad
    clk_lento  : out std_logic                       -- Reloj dividido de salida
  );
end entity divisor_frecuencia;

architecture arch1 of divisor_frecuencia is

  -- Contador de 26 bits.
  -- 2^26 = 67,108,864, suficiente para contar hasta 25,000,000.
  signal cnt     : unsigned(25 downto 0) := (others => '0');
  signal clk_reg : std_logic := '0';

  -- Límite de conteo usado para seleccionar la velocidad.
  signal limite  : unsigned(25 downto 0);

begin

  -- =========================================================
  -- Selección de velocidad
  -- =========================================================
  -- Cada valor del selector cambia el límite del contador.
  -- Mientras menor sea el límite, más rápido cambia clk_lento.
  process(selector)
  begin
    case selector is
      when "00" =>
        limite <= to_unsigned(24999999, 26); -- Aproximadamente 1 Hz

      when "01" =>
        limite <= to_unsigned(12499999, 26); -- Aproximadamente 2 Hz

      when "10" =>
        limite <= to_unsigned(6249999, 26);  -- Aproximadamente 4 Hz

      when others =>
        limite <= to_unsigned(3124999, 26);  -- Aproximadamente 8 Hz
    end case;
  end process;

  -- =========================================================
  -- Proceso secuencial del divisor
  -- =========================================================
  -- Cuenta ciclos del reloj de 50 MHz.
  -- Cuando el contador llega al límite, invierte clk_reg.
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

  -- Salida del reloj dividido
  clk_lento <= clk_reg;

end architecture arch1;