-- ============================================================
-- memory_controller.vhd
-- FSM Moore: copia ROM->RAM y permite acceso externo
-- Estados: IDLE, READ_ROM, WAIT_ROM, WAIT_ROM2,
--          WRITE_RAM, READ_RAM, DONE
-- Universidad del Cauca
-- Andre Luna
-- ============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_controller is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    addr     : in  addr_t;
    data_in  : in  word_t;
    we       : in  std_logic;
    re       : in  std_logic;
    data_out : out word_t;
    done     : out std_logic
  );
end entity memory_controller;

architecture rtl of memory_controller is

  -- Estados de la FSM
  type state_t is (IDLE, READ_ROM, WAIT_ROM, WAIT_ROM2,
                   WRITE_RAM, READ_RAM, ST_DONE);
  signal state : state_t := IDLE;

  -- Contador de direccion interno
  signal addr_cnt : integer range 0 to 2**ADDR_WIDTH-1 := 0;

  -- Señales internas ROM
  signal rom_re   : std_logic := '0';
  signal rom_addr : addr_t    := (others => '0');
  signal rom_data : word_t;

  -- Señales internas RAM
  signal ram_we   : std_logic := '0';
  signal ram_re   : std_logic := '0';
  signal ram_addr : addr_t    := (others => '0');
  signal ram_din  : word_t    := (others => '0');
  signal ram_dout : word_t;

  -- Registro para capturar dato ROM
  signal rom_data_reg : word_t    := (others => '0');
  signal done_reg     : std_logic := '0';

begin

  -- Instancia ROM
  u_rom : rom_sync
    port map (
      clk      => clk,
      re       => rom_re,
      addr     => rom_addr,
      data_out => rom_data
    );

  -- Instancia RAM
  u_ram : ram_sincrona
    generic map (
      DATA_WIDTH => 8,
      ADDR_WIDTH => 4,
      RDW_MODE   => "READ_FIRST"
    )
    port map (
      clk      => clk,
      rd_en    => ram_re,
      wr_en    => ram_we,
      addr     => ram_addr,
      data_in  => ram_din,
      data_out => ram_dout
    );

  -- FSM
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        state    <= IDLE;
        addr_cnt <= 0;
        done_reg <= '0';
        rom_re   <= '0';
        ram_we   <= '0';
        ram_re   <= '0';
        rom_addr <= (others => '0');
        ram_addr <= (others => '0');
        ram_din  <= (others => '0');

      else
        case state is

          when IDLE =>
            rom_re   <= '0';
            ram_we   <= '0';
            ram_re   <= '0';
            addr_cnt <= 0;
            done_reg <= '0';
            state    <= READ_ROM;

          -- Ciclo 1: presenta direccion a ROM
          when READ_ROM =>
            rom_re   <= '1';
            ram_we   <= '0';
            ram_re   <= '0';
            rom_addr <= std_logic_vector(
                          to_unsigned(addr_cnt, ADDR_WIDTH));
            state    <= WAIT_ROM;

          -- Ciclo 2: ROM registra direccion
          when WAIT_ROM =>
            rom_re   <= '1';
            ram_we   <= '0';
            ram_re   <= '0';
            state    <= WAIT_ROM2;

          -- Ciclo 3: dato ROM valido, capturar
          when WAIT_ROM2 =>
            rom_re       <= '0';
            ram_we       <= '0';
            ram_re       <= '0';
            rom_data_reg <= rom_data;
            state        <= WRITE_RAM;

          -- Ciclo 4: escribir dato ROM en RAM
          when WRITE_RAM =>
            rom_re   <= '0';
            ram_we   <= '1';
            ram_re   <= '0';
            ram_addr <= std_logic_vector(
                          to_unsigned(addr_cnt, ADDR_WIDTH));
            ram_din  <= rom_data_reg;
            state    <= READ_RAM;

          -- Ciclo 5: verificar, avanzar o terminar
          when READ_RAM =>
            rom_re   <= '0';
            ram_we   <= '0';
            ram_re   <= '1';
            ram_addr <= std_logic_vector(
                          to_unsigned(addr_cnt, ADDR_WIDTH));
            if addr_cnt = 2**ADDR_WIDTH - 1 then
              state <= ST_DONE;
            else
              addr_cnt <= addr_cnt + 1;
              state    <= READ_ROM;
            end if;

          -- Copia completa, acceso externo habilitado
          when ST_DONE =>
            done_reg <= '1';
            ram_we   <= we;
            ram_re   <= re;
            ram_addr <= addr;
            ram_din  <= data_in;
            rom_re   <= '0';

          when others =>
            state <= IDLE;

        end case;
      end if;
    end if;
  end process;

  done     <= done_reg;
  data_out <= ram_dout;

end architecture rtl;