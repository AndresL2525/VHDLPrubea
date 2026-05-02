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

  constant rom_expected : mem_array := (
    0  => x"AA", 1  => x"55", 2  => x"F0", 3  => x"0F",
    4  => x"FF", 5  => x"00", 6  => x"A5", 7  => x"5A",
    8  => x"12", 9  => x"34", 10 => x"56", 11 => x"78",
    12 => x"9A", 13 => x"BC", 14 => x"DE", 15 => x"EF"
  );

  procedure wait_cycles(n : integer) is
  begin
    for i in 1 to n loop
      wait until rising_edge(clk_tb);
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
  begin

    -- D. Reset inicial
    report "=== D. Reset inicial ===" severity note;
    rst_tb <= '1';
    wait_cycles(3);
    rst_tb <= '0';
    report "=== Reset liberado ===" severity note;

    -- A. Esperar copia automatica ROM -> RAM
    report "=== A. Esperando copia ROM->RAM ===" severity note;
    wait until done_tb = '1';
    wait_cycles(2);
    report "=== Copia completa. done=1 ===" severity note;

    -- C. Lectura desde RAM y verificacion
    report "=== C. Verificando datos en RAM ===" severity note;
    re_tb <= '1';
    we_tb <= '0';

    for i in 0 to MEM_DEPTH-1 loop
      addr_tb <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
      wait_cycles(2);
      assert data_out_tb = rom_expected(i)
        report "FALLO RAM pos " & integer'image(i)
        severity error;
    end loop;

    re_tb <= '0';
    report "=== Lectura RAM OK ===" severity note;

    -- B. Escritura externa manual en RAM[0]
    report "=== B. Escritura externa RAM[0] <- 0xC3 ===" severity note;
    addr_tb    <= x"0";
    data_in_tb <= x"C3";
    we_tb      <= '1';
    wait_cycles(1);
    we_tb      <= '0';
    wait_cycles(1);

    re_tb   <= '1';
    addr_tb <= x"0";
    wait_cycles(2);
    assert data_out_tb = x"C3"
      report "FALLO escritura manual RAM[0]"
      severity error;
    re_tb <= '0';
    report "=== Escritura/lectura manual OK ===" severity note;

    -- D. Reset en caliente
    report "=== D. Reset en caliente ===" severity note;
    rst_tb <= '1';
    wait_cycles(2);
    rst_tb <= '0';
    wait_cycles(1);
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