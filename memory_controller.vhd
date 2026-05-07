-- =============================================================
-- Archivo      : memory_controller.vhd
-- Proyecto     : Sistema con Memorias ROM y RAM
-- Universidad  : Universidad del Cauca
-- Autor        : Camilo Andres Luna
-- Fecha        : Mayo 2026
--
-- Descripcion:
--   Controlador principal del sistema ROM-RAM.
--   Implementa una maquina de estados finita (FSM) tipo Moore
--   que coordina automaticamente el ciclo completo:
--
--      ROM -> RAM -> Display
--
--   La FSM recorre las 16 posiciones de memoria, copia cada
--   dato desde la ROM hacia la RAM, lo lee de vuelta y lo
--   envia al display para visualizacion. El ciclo se repite
--   continuamente sin intervencion externa.
--
--   Tipo Moore:
--   Las salidas (rom_re, ram_we, ram_re) dependen unicamente
--   del estado actual, no de las entradas. Esto hace el diseno
--   predecible y facil de verificar.
--
--   Manejo de latencia:
--   Tanto la ROM como la RAM son sincronas. El dato no aparece
--   en la salida en el mismo ciclo que se activa la lectura,
--   sino en el ciclo siguiente. Por esto la FSM incluye estados
--   de espera adicionales:
--     - S_WAIT_ROM y S_WAIT_ROM2 para la ROM (2 ciclos)
--     - S_READ_RAM_WAIT para la RAM (1 ciclo adicional)
--
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity memory_controller is
  port (
    clk          : in  std_logic;   -- Reloj lento generado por divisor_frecuencia
    rst          : in  std_logic;   -- Reset sincrono activo en alto: vuelve a S_IDLE

    -- Interfaz con ROM (solo lectura)
    rom_re       : out std_logic;   -- Habilita lectura de ROM: activo en S_READ_ROM y S_WAIT_ROM
    rom_addr     : out addr_word;   -- Direccion de 4 bits hacia la ROM: viene de addr_counter
    rom_data     : in  data_word;   -- Dato de 8 bits entregado por la ROM un ciclo despues

    -- Interfaz con RAM (lectura y escritura)
    ram_we       : out std_logic;   -- Habilita escritura en RAM: activo solo en S_WRITE_RAM
    ram_re       : out std_logic;   -- Habilita lectura de RAM: activo en S_READ_RAM y S_READ_RAM_WAIT
    ram_addr     : out addr_word;   -- Direccion de 4 bits hacia la RAM: misma que rom_addr
    ram_data_in  : out data_word;   -- Dato a escribir en RAM: proviene de rom_data_reg
    ram_data_out : in  data_word;   -- Dato leido desde RAM: se captura en S_SHOW

    -- Salida hacia el display
    display_data : out data_word    -- Dato final de 8 bits que se muestra en HEX0 y HEX1
  );
end entity memory_controller;

architecture rtl of memory_controller is

  -- Definicion de los 9 estados de la FSM.
  -- Se usa un tipo enumerado para mayor legibilidad
  -- y para que las herramientas de sintesis optimicen
  -- la codificacion de estados automaticamente.
  type state_type is (
     S_IDLE,          -- Estado inicial tras reset
     S_READ_ROM,      -- Activa rom_re, presenta direccion a ROM
     S_WAIT_ROM ,     -- Espera primer ciclo de latencia ROM
     S_WAIT_ROM2,     -- Captura dato valido desde ROM
     S_WRITE_RAM,     -- Escribe dato capturado en RAM
     S_READ_RAM,      -- Activa ram_re, presenta direccion a RAM
     S_READ_RAM_WAIT, -- Espera ciclo de latencia RAM
     S_SHOW,          -- Captura dato desde RAM para display
     S_NEXT           --Avanza addr_counter a la siguiente posicion
    
  );

  -- Registro que almacena el estado actual de la FSM.
  -- Se inicializa en S_IDLE para arrancar limpio.
  signal state : state_type := S_IDLE;

  -- Contador que selecciona la posicion de memoria activa.
  -- Recorre de 0 a MEM_DEPTH-1 (0 a 15).
  -- Se incrementa en S_NEXT y se reinicia al llegar a 15.
  signal addr_counter : integer range 0 to MEM_DEPTH-1 := 0;

  -- Registro intermedio que retiene el dato leido de la ROM.
  -- Es necesario porque la ROM tarda dos ciclos en entregar
  -- el dato valido. Se captura en S_WAIT_ROM2 y se usa
  -- en S_WRITE_RAM para escribirlo en la RAM.
  signal rom_data_reg : data_word := (others => '0');

  -- Registro que contiene el dato final para el display.
  -- Se actualiza en S_SHOW con el dato leido desde la RAM.
  -- Permanece estable entre actualizaciones para que el
  -- display muestre el valor sin parpadeos.
  signal display_reg  : data_word := (others => '0');

  -- Senales internas que separan la logica combinacional
  -- de la asignacion directa a los puertos de salida.
  -- Esto evita lectura de puertos de salida y simplifica
  -- el proceso combinacional de la FSM Moore.
  signal s_rom_re : std_logic := '0';
  signal s_ram_we : std_logic := '0';
  signal s_ram_re : std_logic := '0';

begin

  -- ===========================================================
  -- Proceso secuencial: transiciones de estado y registros.
  -- Se ejecuta en cada flanco de subida del reloj lento.
  -- El reset es asincrono activo en alto: vuelve a S_IDLE
  -- sin importar el estado actual ni el reloj.
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

        -- Punto de partida del ciclo. Ningun registro cambia aqui,
        -- solo se avanza al primer estado de lectura.
        when S_IDLE =>
          state <= S_READ_ROM;

        -- La logica combinacional activa rom_re en este estado.
        -- La ROM registra la direccion en este flanco de reloj.
        -- El dato NO es valido todavia.
        when S_READ_ROM =>
          state <= S_WAIT_ROM;

        -- rom_re sigue activo. La ROM procesa internamente.
        -- El dato en rom_data todavia NO es confiable.
        when S_WAIT_ROM =>
          state <= S_WAIT_ROM2;

        -- En este ciclo el dato de la ROM ya es valido.
        -- Se guarda en rom_data_reg para usarlo en S_WRITE_RAM.
        when S_WAIT_ROM2 =>
          rom_data_reg <= rom_data;
          state <= S_WRITE_RAM;

        -- La logica combinacional activa ram_we.
        -- La RAM escribe rom_data_reg en la posicion addr_counter.
        when S_WRITE_RAM =>
          state <= S_READ_RAM;

        -- La logica combinacional activa ram_re.
        -- La RAM registra la direccion en este flanco.
        -- El dato en ram_data_out todavia NO es valido.
        when S_READ_RAM =>
          state <= S_READ_RAM_WAIT;

        -- ram_re sigue activo. La RAM entrega el dato
        -- en el proximo flanco. Se espera un ciclo mas.
        when S_READ_RAM_WAIT =>
          state <= S_SHOW;

        -- El dato de la RAM ya es valido en ram_data_out.
        -- Se captura en display_reg para enviarlo al display.
        when S_SHOW =>
          display_reg <= ram_data_out;
          state <= S_NEXT;

        -- Fin del ciclo para la posicion actual.
        -- Si addr_counter llego a 15 (ultima posicion), vuelve a 0.
        -- Si no, incrementa para procesar la siguiente posicion.
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
  -- Proceso combinacional: logica de salidas de la FSM Moore.
  -- Las senales de control se activan segun el estado actual.
  -- Los valores por defecto son cero para evitar latches.
  -- Cada senal se activa durante los ciclos necesarios para
  -- cubrir la latencia de las memorias sincronas.
  -- ===========================================================
  process(state)
  begin
    s_rom_re <= '0';
    s_ram_we <= '0';
    s_ram_re <= '0';

    case state is

      -- rom_re activo en dos estados consecutivos para dar
      -- tiempo a que la ROM registre la direccion y entregue
      -- el dato valido en el segundo ciclo (S_WAIT_ROM2).
      when S_READ_ROM      => s_rom_re <= '1';
      when S_WAIT_ROM      => s_rom_re <= '1';

      -- ram_we activo un solo ciclo: la escritura en RAM
      -- ocurre en un unico flanco de reloj.
      when S_WRITE_RAM     => s_ram_we <= '1';

      -- ram_re activo en dos estados consecutivos para dar
      -- tiempo a que la RAM entregue el dato valido en S_SHOW.
      when S_READ_RAM      => s_ram_re <= '1';
      when S_READ_RAM_WAIT => s_ram_re <= '1';

      when others => null;

    end case;
  end process;

  -- ===========================================================
  -- Asignaciones de salida.
  -- Conectan las senales internas a los puertos del modulo.
  -- ===========================================================

  -- Senales de control: vienen del proceso combinacional.
  rom_re <= s_rom_re;
  ram_we <= s_ram_we;
  ram_re <= s_ram_re;

  -- La misma direccion se usa para ROM y RAM porque ambas
  -- almacenan los datos en posiciones equivalentes.
  rom_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));
  ram_addr <= std_logic_vector(to_unsigned(addr_counter, ADDR_WIDTH));

  -- El dato escrito en RAM es el que se capturo de la ROM
  -- en S_WAIT_ROM2 y se guardo en el registro intermedio.
  ram_data_in <= rom_data_reg;

  -- El dato para el display es el ultimo capturado en S_SHOW.
  -- Se mantiene estable hasta que el proximo ciclo lo actualice.
  display_data <= display_reg;

end architecture rtl;