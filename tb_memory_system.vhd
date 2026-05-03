-- =============================================================
-- tb_memory_system.vhd
-- Testbench mejorado del sistema ROM+RAM+FSM
-- Validaciones:
--   A. Lectura desde ROM (copia automatica ROM->RAM)
--   B. Verificacion de datos reales en display
--   C. Persistencia de datos en RAM tras reset
--   D. Reset inicial y en caliente
-- Universidad del Cauca
-- Andre Luna
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

  -- Patrones esperados del decodificador 7seg para 0-F
  -- Activo en bajo, orden gfedcba
  type seg_array is array (0 to 15) of std_logic_vector(6 downto 0);
  constant SEG_PATTERNS : seg_array := (
    0  => "1000000", -- 0
    1  => "1111001", -- 1
    2  => "0100100", -- 2
    3  => "0110000", -- 3
    4  => "0011001", -- 4
    5  => "0010010", -- 5
    6  => "0000010", -- 6
    7  => "1111000", -- 7
    8  => "0000000", -- 8
    9  => "0010000", -- 9
    10 => "0001000", -- A
    11 => "0000011", -- B
    12 => "1000110", -- C
    13 => "0100001", -- D
    14 => "0000110", -- E
    15 => "0001110"  -- F
  );

  -- Primer dato de ROM: x"AA" = 1010 1010
  -- nibble bajo = A = 10, nibble alto = A = 10
  constant ROM_DATO_0_LOW  : integer := 10; -- nibble bajo de 0xAA
  constant ROM_DATO_0_HIGH : integer := 10; -- nibble alto de 0xAA

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

    -- =========================================================
    -- D. Reset inicial
    -- =========================================================
    report "=== D. Reset inicial ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);
    KEY_tb(0) <= '1';
    SW_tb <= "11";
    report "=== Reset liberado ===" severity note;

    -- =========================================================
    -- A. Esperar copia automatica ROM->RAM
    -- =========================================================
    report "=== A. Esperando copia ROM->RAM ===" severity note;
    wait_cycles(3000, CLOCK_50_tb);
    report "=== A. Copia ROM->RAM completa ===" severity note;

    -- =========================================================
    -- B. Verificar dato real en display
    -- El primer dato de ROM es 0xAA
    -- nibble bajo = A (10) -> SEG = "0001000"
    -- nibble alto = A (10) -> SEG = "0001000"
    -- =========================================================
    report "=== B. Verificando dato real en display ===" severity note;

    assert HEX0_tb /= "1111111"
      report "FALLO B: HEX0 apagado"
      severity error;

    assert HEX1_tb /= "1111111"
      report "FALLO B: HEX1 apagado"
      severity error;

    -- Verificar patron exacto del primer dato mostrado
    assert HEX0_tb = SEG_PATTERNS(ROM_DATO_0_LOW)
      report "FALLO B: HEX0 no muestra nibble bajo de 0xAA"
      severity error;

    assert HEX1_tb = SEG_PATTERNS(ROM_DATO_0_HIGH)
      report "FALLO B: HEX1 no muestra nibble alto de 0xAA"
      severity error;

    report "=== B. Display muestra dato correcto ===" severity note;

    -- =========================================================
    -- C. Persistencia de datos tras reset
    -- El reset reinicia la FSM pero NO borra la RAM
    -- Tras el reset la FSM vuelve a leer la ROM y
    -- reescribe la RAM con los mismos datos
    -- =========================================================
    report "=== C. Verificando persistencia tras reset ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);
    KEY_tb(0) <= '1';
    wait_cycles(3000, CLOCK_50_tb);

    -- El display debe volver a mostrar el mismo dato
    assert HEX0_tb /= "1111111"
      report "FALLO C: display apagado tras reset"
      severity error;

    assert HEX0_tb = SEG_PATTERNS(ROM_DATO_0_LOW)
      report "FALLO C: dato incorrecto tras reset"
      severity error;

    report "=== C. Datos correctos tras reset ===" severity note;

    -- =========================================================
    -- D. Reset en caliente verificando que FSM no se cuelga
    -- Se aplican multiples resets consecutivos
    -- =========================================================
    report "=== D. Multiples resets consecutivos ===" severity note;

    for i in 1 to 3 loop
      KEY_tb(0) <= '0';
      wait_cycles(3, CLOCK_50_tb);
      KEY_tb(0) <= '1';
      wait_cycles(100, CLOCK_50_tb);
    end loop;

    wait_cycles(3000, CLOCK_50_tb);

    assert HEX0_tb /= "1111111"
      report "FALLO D: sistema colgado tras resets multiples"
      severity error;

    report "=== D. Sistema estable tras resets multiples ===" severity note;

    report "=== SIMULACION FINALIZADA ===" severity note;
    wait;

  end process stimulus;

end architecture sim;