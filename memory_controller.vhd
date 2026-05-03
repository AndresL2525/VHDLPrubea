-- =============================================================
-- Archivo : memory_controller.vhd
-- Descripción:
--   Controlador principal del sistema ROM-RAM.
--
--   Este módulo implementa una FSM que realiza el ciclo:
--
--      1. Leer un dato desde la ROM
--      2. Esperar la salida de la ROM
--      3. Escribir ese dato en la RAM
--      4. Leer el dato desde la RAM
--      5. Guardar el dato para mostrarlo en display
--      6. Pasar a la siguiente dirección
--
--   La FSM controla internamente:
--      - rom_re
--      - rom_addr
--      - ram_we
--      - ram_re
--      - ram_addr
--      - ram_data_in
--
--   El usuario no controla la RAM manualmente.
--   Todo el proceso ROM -> RAM -> Display lo hace la FSM.
-- =============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_controller is
  port (
    clk          : in  std_logic;   -- Reloj lento del sistema
    rst          : in  std_logic;   -- Reset activo en alto

    -- =========================================================
    -- Interfaz con ROM
    -- =========================================================
    rom_re       : out std_logic;   -- Habilitación de lectura ROM
    rom_addr     : out addr_word;   -- Dirección enviada a ROM
    rom_data     : in  data_word;   -- Dato leído desde ROM

    -- =========================================================
    -- Interfaz con RAM
    -- =========================================================
    ram_we       : out std_logic;   -- Habilitación de escritura RAM
    ram_re       : out std_logic;   -- Habilitación de lectura RAM
    ram_addr     : out addr_word;   -- Dirección enviada a RAM
    ram_data_in  : out data_word;   -- Dato escrito en RAM
    ram_data_out : in  data_word;   -- Dato leído desde RAM

    -- =========================================================
    -- Dato final para visualización
    -- =========================================================
    display_data : out data_word    -- Dato que se mostrará en HEX0/HEX1
  );
end entity memory_controller;

architecture rtl of memory_controller is

  -- =========================================================
  -- Estados de la FSM
  -- =========================================================
  -- S_IDLE:
  --   Estado inicial.
  --
  -- S_READ_ROM:
  --   Activa lectura de ROM.
  --
  -- S_WAIT_ROM:
  --   Espera un ciclo para que la ROM entregue el dato.
  --
  -- S_WRITE_RAM:
  --   Escribe en RAM el dato leído desde ROM.
  --
  -- S_READ_RAM:
  --   Activa lectura de RAM.
  --
  -- S_SHOW:
  --   Guarda el dato leído de RAM para visualizarlo.
  --
  -- S_NEXT:
  --   Avanza a la siguiente dirección.
  type state_type is (
    S_IDLE,
    S_READ_ROM,
    S_WAIT_ROM,
    S_WRITE_RAM,
    S_READ_RAM,
    S_SHOW,
    S_NEXT
  );

  -- Estado actual de la FSM
  signal state : state_type := S_IDLE;

  -- Contador de dirección.
  -- Recorre las posiciones de memoria de 0 a 15.
  signal addr_counter : integer range 0 to MEM_DEPTH-1 := 0;

  -- Registro para guardar temporalmente el dato leído de ROM.
  signal rom_data_reg : data_word := (others => '0');

  -- Registro que almacena el dato que se mostrará en displays.
  signal display_reg : data_word := (others => '0');

  -- Señales internas de control.
  signal s_rom_re : std_logic := '0';
  signal s_ram_we : std_logic := '0';
  signal s_ram_re : std_logic := '0';

begin

  -- =========================================================
  -- Proceso secuencial de la FSM
  -- =========================================================
  -- Este proceso:
  --   - Guarda el estado actual
  --   - Avanza entre estados
  --   - Actualiza registros internos
  --
  -- Se ejecuta con flanco de subida de clk.
  process(clk, rst)
  begin
    if rst = '1' then

      -- Reset general del controlador
      state        <= S_IDLE;
      addr_counter <= 0;
      rom_data_reg <= (others => '0');
      display_reg  <= (others => '0');

    elsif rising_edge(clk) then

      case state is

        -- =====================================================
        -- Estado inicial
        -- =====================================================
        when S_IDLE =>
          state <= S_READ_ROM;

        -- =====================================================
        -- Leer ROM
        -- =====================================================
        -- En este estado se activa rom_re mediante la lógica
        -- combinacional de salida.
        when S_READ_ROM =>
          state <= S_WAIT_ROM;

        -- =====================================================
        -- Esperar dato de ROM
        -- =====================================================
        -- Como la ROM es síncrona, se espera un ciclo.
        -- Luego se guarda rom_data en rom_data_reg.
        when S_WAIT_ROM =>
          rom_data_reg <= rom_data;
          state <= S_WRITE_RAM;

        -- =====================================================
        -- Escribir RAM
        -- =====================================================
        -- En este estado la lógica de salida activa ram_we.
        -- El dato escrito será rom_data_reg.
        when S_WRITE_RAM =>
          state <= S_READ_RAM;

        -- =====================================================
        -- Leer RAM
        -- =====================================================
        -- En este estado la lógica de salida activa ram_re.
        when S_READ_RAM =>
          state <= S_SHOW;

        -- =====================================================
        -- Mostrar dato
        -- =====================================================
        -- Se guarda el dato leído desde RAM en display_reg.
        when S_SHOW =>
          display_reg <= ram_data_out;
          state <= S_NEXT;

        -- =====================================================
        -- Siguiente dirección
        -- =====================================================
        -- Si se llega a la última posición, vuelve a 0.
        -- Si no, incrementa la dirección.
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

  -- =========================================================
  -- Lógica de salidas de la FSM
  -- =========================================================
  -- Esta parte define qué señales se activan en cada estado.
  --
  -- Es una FSM tipo Moore porque las salidas dependen del
  -- estado actual.
  process(state)
  begin

    -- Valores por defecto:
    -- ninguna operación activa.
    s_rom_re <= '0';
    s_ram_we <= '0';
    s_ram_re <= '0';

    case state is

      -- Durante S_READ_ROM se habilita lectura de ROM.
      when S_READ_ROM =>
        s_rom_re <= '1';

      -- Durante S_WRITE_RAM se habilita escritura en RAM.
      when S_WRITE_RAM =>
        s_ram_we <= '1';

      -- Durante S_READ_RAM se habilita lectura de RAM.
      when S_READ_RAM =>
        s_ram_re <= '1';

      -- En los demás estados no se activa ninguna señal.
      when others =>
        null;

    end case;
  end process;

  -- =========================================================
  -- Asignaciones hacia ROM y RAM
  -- =========================================================

  -- Señales de control
  rom_re <= s_rom_re;
  ram_we <= s_ram_we;
  ram_re <= s_ram_re;

  -- La misma dirección se usa para ROM y RAM.
  rom_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
  ram_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));

  -- El dato escrito en RAM es el dato previamente leído de ROM.
  ram_data_in <= rom_data_reg;

  -- Dato final para visualización.
  display_data <= display_reg;

end architecture rtl;