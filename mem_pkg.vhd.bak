-- =============================================================
-- mem_pkg.vhd
-- Package central del sistema ROM/RAM
-- Universidad del Cauca 
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mem_pkg is

  -- ---------------------------------------------------------
  -- Constantes globales del sistema
  -- ---------------------------------------------------------
  constant DATA_WIDTH : positive := 8;
  constant ADDR_WIDTH : positive := 4;
  constant MEM_DEPTH  : positive := 16;  -- 2**ADDR_WIDTH

  -- ---------------------------------------------------------
  -- Tipos definidos
  -- ---------------------------------------------------------
  subtype data_word is std_logic_vector(DATA_WIDTH-1 downto 0);
  subtype addr_word is std_logic_vector(ADDR_WIDTH-1 downto 0);
  type    mem_array  is array (0 to MEM_DEPTH-1) of data_word;

  -- ---------------------------------------------------------
  -- Función: convierte addr_word a integer
  -- Centraliza la conversión para todos los módulos
  -- ---------------------------------------------------------
  function addr_to_integer(addr : addr_word) return integer;

  -- ---------------------------------------------------------
  -- Procedimiento: limpia señales de control
  -- Evita latch y simplifica reset en la FSM
  -- ---------------------------------------------------------
  procedure clear_control_signals(
    signal rom_re  : out std_logic;
    signal ram_we  : out std_logic;
    signal ram_re  : out std_logic
  );

  -- ---------------------------------------------------------
  -- Declaración de componente: rom_sync
  -- ---------------------------------------------------------
  component rom_sync is
    generic (
      DATA_WIDTH : positive := 8;
      ADDR_WIDTH : positive := 4
    );
    port (
      clk      : in  std_logic;
      re       : in  std_logic;
      addr     : in  addr_word;
      data_out : out data_word
    );
  end component;

  -- ---------------------------------------------------------
  -- Declaración de componente: ram_sincrona
  -- ---------------------------------------------------------
  component ram_sincrona is
    generic (
      DATA_WIDTH : positive := 8;
      ADDR_WIDTH : positive := 4;
      RDW_MODE   : string   := "READ_FIRST"
    );
    port (
      clk      : in  std_logic;
      rd_en    : in  std_logic;
      wr_en    : in  std_logic;
      addr     : in  addr_word;
      data_in  : in  data_word;
      data_out : out data_word
    );
  end component;

  -- ---------------------------------------------------------
  -- Declaración de componente: memory_controller
  -- ---------------------------------------------------------
  component memory_controller is
    port (
      clk          : in  std_logic;
      rst          : in  std_logic;
      -- Interfaz con ROM
      rom_re       : out std_logic;
      rom_addr     : out addr_word;
      rom_data     : in  data_word;
      -- Interfaz con RAM
      ram_we       : out std_logic;
      ram_re       : out std_logic;
      ram_addr     : out addr_word;
      ram_data_in  : out data_word;
      ram_data_out : in  data_word;
      -- Interfaz externa (post-done)
      ext_we       : in  std_logic;
      ext_re       : in  std_logic;
      ext_addr     : in  addr_word;
      ext_data_in  : in  data_word;
      -- Salidas observables
      data_out     : out data_word;
      done         : out std_logic
    );
  end component;

end package mem_pkg;

-- =============================================================
-- Cuerpo del package: implementación de función y procedimiento
-- =============================================================
package body mem_pkg is

  -- Convierte std_logic_vector a integer sin signo
  function addr_to_integer(addr : addr_word) return integer is
  begin
    return to_integer(unsigned(addr));
  end function;

  -- Pone en '0' las tres señales de control principales
  procedure clear_control_signals(
    signal rom_re  : out std_logic;
    signal ram_we  : out std_logic;
    signal ram_re  : out std_logic
  ) is
  begin
    rom_re <= '0';
    ram_we <= '0';
    ram_re <= '0';
  end procedure;

end package body mem_pkg;