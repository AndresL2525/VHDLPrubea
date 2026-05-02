-- =============================================================
-- tb_memory_system.vhd 
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity tb_memory_system is
end entity tb_memory_system;

architecture sim of tb_memory_system is

  constant CLK_PERIOD : time := 20 ns;

  signal clk_tb      : std_logic := '0';
  signal rst_tb      : std_logic := '1';
  signal addr_tb     : addr_word := (others => '0');
  signal data_in_tb  : data_word := (others => '0');
  signal we_tb       : std_logic := '0';
  signal re_tb       : std_logic := '0';
  signal data_out_tb : data_word;
  signal done_tb     : std_logic;

  constant rom_expected : mem_t := (
    0  => x"AA", 1  => x"55", 2  => x"F0", 3  => x"0F",
    4  => x"FF", 5  => x"00", 6  => x"A5", 7  => x"5A",
    8  => x"12", 9  => x"34", 10 => x"56", 11 => x"78",
    12 => x"9A", 13 => x"BC", 14 => x"DE", 15 => x"EF"
  );

  procedure wait_cycles(n : integer; signal clk : in std_logic) is
  begin
    for i in 1 to n loop
      wait until rising_edge(clk);
    end loop;
  end procedure;

begin

  DUT : entity work.memory_system_top
    port map (
      clk      => clk_tb,
      rst      => rst_tb,
      addr     => addr_tb,
      data_in  => data_in_tb,
      we       => we_tb,
      re       => re_tb,
      data_out => data_out_tb,
      done     => done_tb
    );

  clk_process : process
  begin
    clk_tb <= '0'; wait for CLK_PERIOD / 2;
    clk_tb <= '1'; wait for CLK_PERIOD / 2;
  end process;

  stimulus : process

    -- Lee una posicion de RAM y devuelve el dato observado
    -- Espera 3 ciclos para cubrir latencia de RAM + controlador
    procedure leer_ram(addr_val : in integer) is
    begin
      addr_tb <= std_logic_vector(to_unsigned(addr_val, ADDR_WIDTH));
      re_tb   <= '1';
      wait_cycles(1, clk_tb);  -- ciclo para que addr llegue a RAM
      wait_cycles(1, clk_tb);  -- ciclo de latencia RAM (dato capturado)
      wait_cycles(1, clk_tb);  -- ciclo extra de estabilizacion
      re_tb <= '0';
    end procedure;

  begin

    -- D. Reset inicial
    report "=== D. Reset inicial ===" severity note;
    rst_tb <= '1';
    wait_cycles(3, clk_tb);
    rst_tb <= '0';
    report "=== Reset liberado ===" severity note;

    -- A. Esperar copia automatica ROM -> RAM
    report "=== A. Esperando copia ROM->RAM ===" severity note;
    wait until done_tb = '1';
    wait_cycles(3, clk_tb);  -- estabilizacion post-done
    report "=== Copia completa. done=1 ===" severity note;

    -- C. Verificar datos copiados en RAM
    report "=== C. Verificando datos en RAM ===" severity note;

    for i in 0 to MEM_DEPTH-1 loop
      leer_ram(i);
      assert data_out_tb = rom_expected(i)
        report "FALLO RAM pos " & integer'image(i)
        severity error;
    end loop;

    report "=== Lectura RAM OK ===" severity note;

    -- B. Escritura externa manual en RAM[0]
    report "=== B. Escritura externa RAM[0] <- 0xC3 ===" severity note;
    addr_tb    <= x"0";
    data_in_tb <= x"C3";
    we_tb      <= '1';
    wait_cycles(2, clk_tb);  -- 2 ciclos para asegurar escritura
    we_tb <= '0';
    wait_cycles(1, clk_tb);

    -- Leer de vuelta RAM[0]
    leer_ram(0);
    assert data_out_tb = x"C3"
      report "FALLO escritura manual RAM[0]"
      severity error;
    report "=== Escritura/lectura manual OK ===" severity note;

    -- D. Reset en caliente
    report "=== D. Reset en caliente ===" severity note;
    rst_tb <= '1';
    wait_cycles(2, clk_tb);
    rst_tb <= '0';
    wait_cycles(1, clk_tb);
    assert done_tb = '0'
      report "FALLO: done debe ser 0 tras reset"
      severity error;

    -- Esperar segunda copia completa
    wait until done_tb = '1';
    report "=== Segunda copia completa tras reset ===" severity note;

    report "=== SIMULACION FINALIZADA ===" severity note;
    wait;

  end process stimulus;

end architecture sim;