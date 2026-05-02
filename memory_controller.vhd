-- ============================================================
-- memory_controller.vhd
-- FSM Moore: copia ROM->RAM y permite acceso externo
-- Estados: IDLE, READ_ROM, WAIT_ROM, WAIT_ROM2,
--          WRITE_RAM, READ_RAM, DONE
-- ============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_controller is
  port (
    clk          : in  std_logic;
    rst          : in  std_logic;
    rom_re       : out std_logic;
    rom_addr     : out addr_word;
    rom_data     : in  data_word;
    ram_we       : out std_logic;
    ram_re       : out std_logic;
    ram_addr     : out addr_word;
    ram_data_in  : out data_word;
    ram_data_out : in  data_word;
    ext_we       : in  std_logic;
    ext_re       : in  std_logic;
    ext_addr     : in  addr_word;
    ext_data_in  : in  data_word;
    data_out     : out data_word;
    done         : out std_logic
  );
end entity memory_controller;

architecture rtl of memory_controller is

  type state_type is (S_IDLE, S_READ_ROM, S_WAIT_ROM, S_WAIT_ROM2, S_WRITE_RAM, S_READ_RAM, S_DONE);

  signal state        : state_type := S_IDLE;
  signal addr_counter : integer range 0 to 2**ADDR_WIDTH-1 := 0;

  signal s_rom_re      : std_logic := '0';
  signal s_ram_we      : std_logic := '0';
  signal s_ram_re      : std_logic := '0';
  signal s_rom_addr    : addr_word := (others => '0');
  signal s_ram_addr    : addr_word := (others => '0');
  signal s_ram_data_in : data_word := (others => '0');
  signal done_reg      : std_logic := '0';
  signal rom_data_reg  : data_word := (others => '0');

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        state         <= S_IDLE;
        addr_counter  <= 0;
        done_reg      <= '0';
        clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
        s_rom_addr    <= (others => '0');
        s_ram_addr    <= (others => '0');
        s_ram_data_in <= (others => '0');
        rom_data_reg  <= (others => '0');

      else
        case state is

          when S_IDLE =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            addr_counter <= 0;
            done_reg     <= '0';
            state        <= S_READ_ROM;

          -- Ciclo 1: presenta direccion, activa re
          when S_READ_ROM =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            s_rom_re   <= '1';
            s_rom_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
            state      <= S_WAIT_ROM;

          -- Ciclo 2: ROM registra direccion en flanco, dato aun no valido
          when S_WAIT_ROM =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            s_rom_re   <= '1';
            s_rom_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
            state      <= S_WAIT_ROM2;

          -- Ciclo 3: dato ROM valido en la salida, capturamos
          when S_WAIT_ROM2 =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            rom_data_reg <= rom_data;  -- ahora si es valido
            state        <= S_WRITE_RAM;

          -- Ciclo 4: escribe en RAM
          when S_WRITE_RAM =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            s_ram_we      <= '1';
            s_ram_addr    <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
            s_ram_data_in <= rom_data_reg;
            state         <= S_READ_RAM;

          -- Ciclo 5: lee RAM para verificacion, avanza
          when S_READ_RAM =>
            clear_control_signals(s_rom_re, s_ram_we, s_ram_re);
            s_ram_re   <= '1';
            s_ram_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
            if addr_counter =  2**ADDR_WIDTH - 1 then
              state <= S_DONE;
            else
              addr_counter <= addr_counter + 1;
              state        <= S_READ_ROM;
            end if;

          when S_DONE =>
            done_reg      <= '1';
            s_ram_we      <= ext_we;
            s_ram_re      <= ext_re;
            s_ram_addr    <= ext_addr;
            s_ram_data_in <= ext_data_in;
            s_rom_re      <= '0';
            s_rom_addr    <= (others => '0');

          when others =>
            state <= S_IDLE;

        end case;
      end if;
    end if;
  end process;

  rom_re      <= s_rom_re;
  rom_addr    <= s_rom_addr;
  ram_we      <= s_ram_we;
  ram_re      <= s_ram_re;
  ram_addr    <= s_ram_addr;
  ram_data_in <= s_ram_data_in;
  done        <= done_reg;
  data_out    <= ram_data_out;

end architecture rtl;
