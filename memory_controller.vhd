-- =============================================================
-- Archivo      : memory_controller.vhd
-- Descripcion  :
--   Controlador principal del sistema ROM-RAM.
--
--   Implementa una FSM tipo Moore que realiza el ciclo:
--
--      1. S_IDLE          : Estado inicial, limpia señales
--      2. S_READ_ROM      : Activa lectura de ROM
--      3. S_WAIT_ROM      : Espera primer ciclo de latencia ROM
--      4. S_WAIT_ROM2     : Captura dato valido de ROM
--      5. S_WRITE_RAM     : Escribe dato en RAM
--      6. S_READ_RAM      : Activa lectura de RAM
--      7. S_READ_RAM_WAIT : Espera ciclo de latencia RAM
--      8. S_SHOW          : Captura dato RAM para display
--      9. S_NEXT          : Avanza a siguiente direccion
--
--   La FSM es tipo Moore:
--   las salidas dependen unicamente del estado actual.
--
--   El proceso ROM -> RAM -> Display es completamente
--   automatico. No requiere control externo.
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_controller is
  port (
    clk          : in  std_logic;   -- Reloj lento del sistema
    rst          : in  std_logic;   -- Reset activo en alto

    -- Interfaz con ROM
    rom_re       : out std_logic;   -- Habilitacion de lectura ROM
    rom_addr     : out addr_word;   -- Direccion enviada a ROM
    rom_data     : in  data_word;   -- Dato leido desde ROM

    -- Interfaz con RAM
    ram_we       : out std_logic;   -- Habilitacion de escritura RAM
    ram_re       : out std_logic;   -- Habilitacion de lectura RAM
    ram_addr     : out addr_word;   -- Direccion enviada a RAM
    ram_data_in  : out data_word;   -- Dato escrito en RAM
    ram_data_out : in  data_word;   -- Dato leido desde RAM

    -- Dato final para visualizacion
    display_data : out data_word    -- Dato que se muestra en HEX0/HEX1
  );
end entity memory_controller;

architecture rtl of memory_controller is

  -- Estados de la FSM
  -- S_IDLE          : Estado inicial
  -- S_READ_ROM      : Activa lectura de ROM
  -- S_WAIT_ROM      : Primer ciclo de espera ROM
  -- S_WAIT_ROM2     : Segundo ciclo, captura dato ROM valido
  -- S_WRITE_RAM     : Escribe dato ROM en RAM
  -- S_READ_RAM      : Activa lectura de RAM
  -- S_READ_RAM_WAIT : Espera ciclo de latencia de RAM
  -- S_SHOW          : Captura dato RAM para display
  -- S_NEXT          : Avanza contador de direccion
  type state_type is (
    S_IDLE,
    S_READ_ROM,
    S_WAIT_ROM,
    S_WAIT_ROM2,
    S_WRITE_RAM,
    S_READ_RAM,
    S_READ_RAM_WAIT,
    S_SHOW,
    S_NEXT
  );

  signal state : state_type := S_IDLE;

  -- Contador de direccion: recorre posiciones 0 a 15
  signal addr_counter : integer range 0 to MEM_DEPTH-1 := 0;

  -- Registro para guardar dato leido de ROM
  -- Se captura en S_WAIT_ROM2 cuando el dato ya es valido
  signal rom_data_reg : data_word := (others => '0');

  -- Registro del dato que se envia al display
  signal display_reg  : data_word := (others => '0');

  -- Señales internas de control
  signal s_rom_re : std_logic := '0';
  signal s_ram_we : std_logic := '0';
  signal s_ram_re : std_logic := '0';

begin

  -- ===========================================================
  -- Proceso secuencial: transiciones de estado y registros
  -- ===========================================================
  process(clk, rst)
  begin
    if rst = '1' then
      state        <= S_IDLE;
      addr_counter <= 0;
      rom_data_reg <= (others => '0');
      display_reg  <= (others => '0');

    elsif rising_edge(clk) then

      case state is

        -- Estado inicial: arranca el ciclo
        when S_IDLE =>
          state <= S_READ_ROM;

        -- Activa rom_re para iniciar lectura de ROM
        -- La ROM registra la direccion en este flanco
        when S_READ_ROM =>
          state <= S_WAIT_ROM;

        -- Primer ciclo de espera
        -- La ROM aun procesa la direccion
        -- El dato todavia NO es valido
        when S_WAIT_ROM =>
          state <= S_WAIT_ROM2;

        -- Segundo ciclo de espera
        -- El dato de ROM ya es valido
        -- Se captura en rom_data_reg
        when S_WAIT_ROM2 =>
          rom_data_reg <= rom_data;
          state <= S_WRITE_RAM;

        -- Escribe el dato capturado de ROM en la RAM
        when S_WRITE_RAM =>
          state <= S_READ_RAM;

        -- Activa ram_re para iniciar lectura de RAM
        -- La RAM registra la direccion en este flanco
        when S_READ_RAM =>
          state <= S_READ_RAM_WAIT;

        -- Ciclo de espera de RAM
        -- La RAM es sincrona: el dato llega en el
        -- siguiente flanco despues de activar ram_re
        when S_READ_RAM_WAIT =>
          state <= S_SHOW;

        -- El dato de RAM ya es valido
        -- Se captura en display_reg para visualizacion
        when S_SHOW =>
          display_reg <= ram_data_out;
          state <= S_NEXT;

        -- Avanza a la siguiente direccion
        -- Si llego al final (15), vuelve a 0
        when S_NEXT =>
          if addr_counter = MEM_DEPTH-1 then
            addr_counter <= 0;
          else
            addr_counter <= addr_counter + 1;
          end if;
          state <= S_READ_ROM;

      end case;
    end if;
  end process;

  -- ===========================================================
  -- Proceso combinacional: salidas de la FSM (Moore)
  -- Las salidas dependen unicamente del estado actual
  -- ===========================================================
  process(state)
  begin
    -- Valores por defecto: ninguna operacion activa
    s_rom_re <= '0';
    s_ram_we <= '0';
    s_ram_re <= '0';

    case state is

      -- Lectura de ROM activa durante dos ciclos
      -- para cubrir la latencia de la ROM sincrona
      when S_READ_ROM      => s_rom_re <= '1';
      when S_WAIT_ROM      => s_rom_re <= '1';

      -- Escritura en RAM activa
      when S_WRITE_RAM     => s_ram_we <= '1';

      -- Lectura de RAM activa durante dos ciclos
      -- para cubrir la latencia de la RAM sincrona
      when S_READ_RAM      => s_ram_re <= '1';
      when S_READ_RAM_WAIT => s_ram_re <= '1';

      -- En los demas estados no se activa nada
      when others => null;

    end case;
  end process;

  -- ===========================================================
  -- Asignaciones de salida
  -- ===========================================================

  -- Señales de control hacia ROM y RAM
  rom_re <= s_rom_re;
  ram_we <= s_ram_we;
  ram_re <= s_ram_re;

  -- La misma direccion se usa para ROM y RAM
  rom_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
  ram_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));

  -- Dato a escribir en RAM viene del registro de ROM
  ram_data_in <= rom_data_reg;

  -- Dato para visualizacion en display
  display_data <= display_reg;

end architecture rtl;