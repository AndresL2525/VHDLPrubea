-- =============================================================
-- tb_memory_system.vhd
-- Testbench para el top-level simplificado:
-- CLOCK_50, KEY, SW, HEX0, HEX1
-- =============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_memory_system is
end entity tb_memory_system;

architecture sim of tb_memory_system is

  -- Reloj de 50 MHz: periodo de 20 ns
  constant CLK_PERIOD : time := 20 ns;

  -- Señales del testbench
  signal CLOCK_50_tb : std_logic := '0';
  signal KEY_tb      : std_logic_vector(0 downto 0) := "1";
  signal SW_tb       : std_logic_vector(1 downto 0) := "11";
  signal HEX0_tb     : std_logic_vector(6 downto 0);
  signal HEX1_tb     : std_logic_vector(6 downto 0);

begin

  -- =========================================================
  -- Instancia del sistema completo
  -- =========================================================
  DUT : entity work.memory_system_top
    port map (
      CLOCK_50 => CLOCK_50_tb,
      KEY      => KEY_tb,
      SW       => SW_tb,
      HEX0     => HEX0_tb,
      HEX1     => HEX1_tb
    );

  -- =========================================================
  -- Generación del reloj
  -- =========================================================
  clk_process : process
  begin
    CLOCK_50_tb <= '0';
    wait for CLK_PERIOD / 2;
    CLOCK_50_tb <= '1';
    wait for CLK_PERIOD / 2;
  end process;

  -- =========================================================
  -- Estímulos
  -- =========================================================
  stimulus : process
  begin

    -- Reset activo en bajo con KEY0
    report "=== Reset inicial ===" severity note;
    KEY_tb(0) <= '0';
    wait for 200 ns;

    -- Liberar reset
    KEY_tb(0) <= '1';
    report "=== Reset liberado ===" severity note;

    -- Selección de velocidad más rápida
    SW_tb <= "11";

    -- Esperar funcionamiento del sistema
    wait for 5 ms;

    report "=== Simulación finalizada ===" severity note;
    wait;

  end process;

end architecture sim;