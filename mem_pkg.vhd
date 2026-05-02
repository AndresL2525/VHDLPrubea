-- =============================================================
-- mem_pkg.vhd
-- Package del sistema con memorias ROM Y RAM 
-- Universidad del Cauca 
--Camilo Andres Luna 
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mem_pkg is

  constant DATA_WIDTH : integer := 8;
  constant ADDR_WIDTH : integer := 4;

  subtype data_word is std_logic_vector(DATA_WIDTH-1 downto 0);
  subtype addr_word is std_logic_vector(ADDR_WIDTH-1 downto 0);
  constant MEM_DEPTH  : integer := 2**ADDR_WIDTH;

  type mem_t is array (0 to 2**ADDR_WIDTH-1) of data_word;

  function addr_to_integer(addr : addr_word) return integer;

  procedure clear_control_signals(
    signal rom_re : out std_logic;
    signal ram_we : out std_logic;
    signal ram_re : out std_logic
  );

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

  component memory_controller is
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
  end component;

  component dec_7seg is
    port (
      bcd : in  std_logic_vector(7 downto 0);
      seg  : out std_logic_vector(6 downto 0)
    );
  end component;

end package mem_pkg;

package body mem_pkg is

  function addr_to_integer(addr : addr_word) return integer is
  begin
    return to_integer(unsigned(addr));
  end function;

  procedure clear_control_signals(
    signal rom_re : out std_logic;
    signal ram_we : out std_logic;
    signal ram_re : out std_logic
  ) is
  begin
    rom_re <= '0';
    ram_we <= '0';
    ram_re <= '0';
  end procedure;

end package body mem_pkg;
