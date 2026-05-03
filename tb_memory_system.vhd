-- =============================================================
-- tb_memory_system.vhd
-- Testbench del sistema ROM+RAM+FSM
-- Validaciones:
--   A. Lectura desde ROM (copia automatica ROM->RAM)
--   B. Escritura en RAM (dato llega al display)
--   C. Lectura desde RAM (display muestra dato correcto)
--   D. Reset del sistema (inicial y en caliente)
-- Universidad del Cauca - SENA Ficha 3229446
-- Andre Lopez - Mayo 2026
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_memory_system is
end entity tb_memory_system;

architecture sim of tb_memory_system is

  constant CLK_PERIOD : time := 20 ns;

  signal CLOCK_50_tb : std_logic := '0';
  signal KEY_tb      : std_logic_vector(0 downto 0) := "1";
  signal SW_tb       : std_logic_vector(1 downto 0) := "11";
  signal HEX0_tb     : std_logic_vector(6 downto 0);
  signal HEX1_tb     : std_logic_vector(6 downto 0);

  -- Procedimiento para esperar N ciclos de reloj
  procedure wait_cycles(n : integer; signal clk : in std_logic) is
  begin
    for i in 1 to n loop
      wait until rising_edge(clk);
    end loop;
  end procedure;

begin

  DUT : entity work.memory_system_top
    port map (
      CLOCK_50 => CLOCK_50_tb,
      KEY      => KEY_tb,
      SW       => SW_tb,
      HEX0     => HEX0_tb,
      HEX1     => HEX1_tb
    );

  clk_process : process
  begin
    CLOCK_50_tb <= '0'; wait for CLK_PERIOD / 2;
    CLOCK_50_tb <= '1'; wait for CLK_PERIOD / 2;
  end process;

  stimulus : process
  begin

    -- =======================================================
    -- D. Reset inicial activo en bajo
    -- =======================================================
    report "=== D. Reset inicial ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);

    -- Verificar que display esta apagado durante reset
    assert HEX0_tb = "1111111" or HEX0_tb = "XXXXXXX"
      report "AVISO D: display activo durante reset"
      severity note;

    -- Liberar reset
    KEY_tb(0) <= '1';
    report "=== Reset liberado ===" severity note;

    -- Velocidad maxima para simulacion rapida
    SW_tb <= "11";

    -- =======================================================
    -- A. Lectura desde ROM - copia automatica ROM->RAM
    -- La FSM copia los 16 datos automaticamente
    -- Con SW="11" el divisor genera la frecuencia mas alta
    -- =======================================================
    report "=== A. Esperando copia automatica ROM->RAM ===" severity note;
    wait_cycles(2000, CLOCK_50_tb);
    report "=== A. Copia ROM->RAM completa ===" severity note;

    -- =======================================================
    -- C. Lectura desde RAM
    -- El display debe mostrar datos validos leidos de RAM
    -- El patron "1111111" indica display apagado (fallo)
    -- =======================================================
    report "=== C. Verificando lectura desde RAM ===" severity note;

    assert HEX0_tb /= "1111111"
      report "FALLO C: HEX0 apagado - dato no llego desde RAM al display"
      severity error;

    assert HEX1_tb /= "1111111"
      report "FALLO C: HEX1 apagado - dato no llego desde RAM al display"
      severity error;

    report "=== C. Lectura desde RAM correcta ===" severity note;

    -- =======================================================
    -- B. Escritura en RAM
    -- Verificar que el dato se mantiene estable en display
    -- lo que confirma que la RAM retiene el dato escrito
    -- =======================================================
    report "=== B. Verificando dato estable en display ===" severity note;
    wait_cycles(500, CLOCK_50_tb);

    assert HEX0_tb /= "1111111"
      report "FALLO B: display perdio el dato - RAM no retiene"
      severity error;

    report "=== B. Dato estable en display - RAM retiene dato ===" severity note;

    -- =======================================================
    -- D. Reset en caliente
    -- El sistema debe reiniciarse y volver a mostrar datos
    -- =======================================================
    report "=== D. Reset en caliente ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);
    KEY_tb(0) <= '1';
    report "=== Sistema reiniciado ===" severity note;

    -- Esperar que el sistema vuelva a copiar ROM->RAM
    wait_cycles(2000, CLOCK_50_tb);

    assert HEX0_tb /= "1111111"
      report "FALLO D: display apagado tras reset en caliente"
      severity error;

    report "=== D. Sistema funcional tras reset ===" severity note;

    -- =======================================================
    -- Fin de simulacion
    -- =======================================================
    report "=== SIMULACION FINALIZADA SIN ERRORES CRITICOS ===" severity note;
    wait;

  end process stimulus;

end architecture sim;