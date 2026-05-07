-- =============================================================
-- Archivo      : tb_memory_system.vhd
-- Proyecto     : Sistema con Memorias ROM y RAM
-- Universidad  : Universidad del Cauca
-- Autor        : Camilo Andres Luna
-- Fecha        : Mayo 2026
--
-- Descripcion:
--   Testbench del sistema completo ROM+RAM+FSM+Display.
--   Instancia memory_system_top y aplica estimulos para
--   verificar el comportamiento bajo cuatro condiciones
--   definidas en el enunciado del microproyecto.
--
--   Validaciones implementadas:
--
--   A. Lectura desde ROM:
--      Verifica que la FSM inicia automaticamente la copia
--      de los 16 datos de la ROM hacia la RAM tras el reset.
--      Se espera un numero suficiente de ciclos para que
--      el proceso complete las 16 posiciones.
--
--   B. Escritura y lectura desde RAM (display):
--      Verifica que el dato copiado en la RAM aparece
--      correctamente en los displays HEX0 y HEX1.
--      Se compara el patron de 7 segmentos observado con
--      el patron esperado para el primer dato de la ROM (0xAA).
--      nibble bajo = A (10) -> patron "0001000"
--      nibble alto = A (10) -> patron "0001000"
--
--   C. Persistencia tras reset:
--      Verifica que tras aplicar reset el sistema vuelve
--      a mostrar los mismos datos correctos. El reset
--      reinicia la FSM pero no borra el contenido de la RAM.
--      La FSM reescribe la RAM con los mismos valores de la ROM.
--
--   D. Reset inicial y resets multiples consecutivos:
--      Verifica que el sistema arranca correctamente tras
--      el reset inicial y que no se cuelga tras aplicar
--      multiples resets en rapida sucesion.
--
--   Estructura del testbench:
--     clk_process : genera el reloj de 50 MHz (periodo 20 ns)
--     stimulus    : aplica estimulos y verifica con assert
--
--   Nota sobre velocidad de simulacion:
--     SW_tb = "11" selecciona el limite mas pequeno en el
--     divisor de frecuencia, lo que hace que el reloj lento
--     cambie cada pocos ciclos de CLOCK_50. Esto acelera la
--     simulacion sin necesitar tiempos de espera muy largos.
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_memory_system is
end entity tb_memory_system;

architecture sim of tb_memory_system is

  -- Periodo del reloj principal: 20 ns equivale a 50 MHz,
  -- igual que el reloj de la FPGA DE0.
  constant CLK_PERIOD : time := 20 ns;

  -- Senales conectadas al sistema bajo prueba (DUT).
  signal CLOCK_50_tb : std_logic := '0';
  signal KEY_tb      : std_logic_vector(0 downto 0) := "1";
  signal SW_tb       : std_logic_vector(1 downto 0) := "11";
  signal HEX0_tb     : std_logic_vector(6 downto 0);
  signal HEX1_tb     : std_logic_vector(6 downto 0);

  -- Tabla de patrones esperados del decodificador 7 segmentos.
  -- Cada posicion corresponde a un digito hexadecimal (0 a F).
  -- Patron activo en bajo, orden de bits: gfedcba.
  -- Se usa para comparar con HEX0_tb y HEX1_tb en las aserciones.
  type seg_array is array (0 to 15) of std_logic_vector(6 downto 0);
  constant SEG_PATTERNS : seg_array := (
    0  => "1000000", -- digito 0
    1  => "1111001", -- digito 1
    2  => "0100100", -- digito 2
    3  => "0110000", -- digito 3
    4  => "0011001", -- digito 4
    5  => "0010010", -- digito 5
    6  => "0000010", -- digito 6
    7  => "1111000", -- digito 7
    8  => "0000000", -- digito 8
    9  => "0010000", -- digito 9
    10 => "0001000", -- digito A
    11 => "0000011", -- digito B
    12 => "1000110", -- digito C
    13 => "0100001", -- digito D
    14 => "0000110", -- digito E
    15 => "0001110"  -- digito F
  );

  -- Indices para verificar el primer dato de la ROM: 0xAA.
  -- 0xAA = 1010 1010 -> nibble bajo = A (10), nibble alto = A (10).
  -- Ambos displays deben mostrar el patron de la letra A.
  constant ROM_DATO_0_LOW  : integer := 10;
  constant ROM_DATO_0_HIGH : integer := 10;

  -- Procedimiento auxiliar para esperar N flancos de subida.
  -- Simplifica el codigo del proceso stimulus evitando
  -- repeticion de la instruccion wait until rising_edge.
  procedure wait_cycles(n : integer; signal clk : in std_logic) is
  begin
    for i in 1 to n loop
      wait until rising_edge(clk);
    end loop;
  end procedure;

begin

  -- Instancia del sistema completo bajo prueba.
  -- Se conectan las senales del testbench a los puertos
  -- del top-level memory_system_top.
  DUT : entity work.memory_system_top
    port map (
      CLOCK_50 => CLOCK_50_tb,
      KEY      => KEY_tb,
      SW       => SW_tb,
      HEX0     => HEX0_tb,
      HEX1     => HEX1_tb
    );

  -- Generador de reloj de 50 MHz.
  -- Alterna entre 0 y 1 con periodo de 20 ns.
  -- Corre indefinidamente hasta que la simulacion termina.
  clk_process : process
  begin
    CLOCK_50_tb <= '0'; wait for CLK_PERIOD / 2;
    CLOCK_50_tb <= '1'; wait for CLK_PERIOD / 2;
  end process;

  -- Proceso principal de estimulos y verificacion.
  -- Aplica las cuatro validaciones del microproyecto
  -- usando aserciones automaticas con severity error.
  stimulus : process
  begin

    -- =========================================================
    -- D. Reset inicial del sistema.
    -- KEY0 es activo en bajo en la DE0: poner a '0' activa rst.
    -- Se mantiene 5 ciclos para garantizar el reset completo.
    -- Al liberar KEY0, la FSM arranca desde S_IDLE.
    -- SW_tb = "11" selecciona la frecuencia mas alta del divisor
    -- para que la simulacion complete rapido.
    -- =========================================================
    report "=== D. Reset inicial ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);
    KEY_tb(0) <= '1';
    SW_tb <= "11";
    report "=== Reset liberado ===" severity note;

    -- =========================================================
    -- A. Lectura desde ROM: copia automatica hacia RAM.
    -- Se esperan 3000 ciclos de CLOCK_50 para que el divisor
    -- genere suficientes ciclos lentos y la FSM complete
    -- las 16 posiciones del ciclo ROM -> RAM -> Display.
    -- =========================================================
    report "=== A. Esperando copia ROM->RAM ===" severity note;
    wait_cycles(3000, CLOCK_50_tb);
    report "=== A. Copia ROM->RAM completa ===" severity note;

    -- =========================================================
    -- B. Verificacion de dato real en display.
    -- El primer dato de la ROM es 0xAA.
    -- Se verifica primero que el display no este apagado
    -- y luego que el patron coincida exactamente con el
    -- valor esperado para la letra A en 7 segmentos.
    -- =========================================================
    report "=== B. Verificando dato real en display ===" severity note;

    assert HEX0_tb /= "1111111"
      report "FALLO B: HEX0 apagado"
      severity error;

    assert HEX1_tb /= "1111111"
      report "FALLO B: HEX1 apagado"
      severity error;

    assert HEX0_tb = SEG_PATTERNS(ROM_DATO_0_LOW)
      report "FALLO B: HEX0 no muestra nibble bajo de 0xAA"
      severity error;

    assert HEX1_tb = SEG_PATTERNS(ROM_DATO_0_HIGH)
      report "FALLO B: HEX1 no muestra nibble alto de 0xAA"
      severity error;

    report "=== B. Display muestra dato correcto ===" severity note;

    -- =========================================================
    -- C. Persistencia de datos tras reset.
    -- Se aplica reset y se espera que el sistema vuelva a
    -- mostrar el mismo dato. La RAM no se borra con el reset:
    -- solo la FSM vuelve a S_IDLE y repite el ciclo de copia.
    -- El resultado debe ser identico al anterior.
    -- =========================================================
    report "=== C. Verificando persistencia tras reset ===" severity note;
    KEY_tb(0) <= '0';
    wait_cycles(5, CLOCK_50_tb);
    KEY_tb(0) <= '1';
    wait_cycles(3000, CLOCK_50_tb);

    assert HEX0_tb /= "1111111"
      report "FALLO C: display apagado tras reset"
      severity error;

    assert HEX0_tb = SEG_PATTERNS(ROM_DATO_0_LOW)
      report "FALLO C: dato incorrecto tras reset"
      severity error;

    report "=== C. Datos correctos tras reset ===" severity note;

    -- =========================================================
    -- D. Resets multiples consecutivos.
    -- Se aplican 3 resets rapidos para verificar que la FSM
    -- no queda atrapada en un estado invalido y que el sistema
    -- recupera su funcionamiento normal despues de cada uno.
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