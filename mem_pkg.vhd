-- ============================================================
-- mem_pkg.vhd
-- Paquete central del sistema con memorias ROM y RAM
-- Universidad del Cauca 
-- Andre Luna
-- ============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package mem_pkg is

  -- ----------------------------------------------------------
  -- Constantes del sistema
  -- DATA_WIDTH: ancho del dato en bits
  -- ADDR_WIDTH: ancho de la direccion en bits
  -- ----------------------------------------------------------
  constant DATA_WIDTH : integer := 8;
  constant ADDR_WIDTH : integer := 4;

  -- ----------------------------------------------------------
  -- Tipos basicos
  -- word_t: dato de 8 bits
  -- addr_t: direccion de 4 bits
  -- mem_t : arreglo de 16 palabras de 8 bits
  -- ----------------------------------------------------------
  subtype word_t is std_logic_vector(DATA_WIDTH-1 downto 0);
  subtype addr_t is std_logic_vector(ADDR_WIDTH-1 downto 0);
  type    mem_t  is array (0 to 2**ADDR_WIDTH-1) of word_t;

  -- ----------------------------------------------------------
  -- Componente ROM sincrona
  -- Memoria de solo lectura inicializada con datos fijos
  -- ----------------------------------------------------------
  component rom_sync is
    port (
      clk      : in  std_logic;
      re       : in  std_logic;
      addr     : in  addr_t;
      data_out : out word_t
    );
  end component;

  -- ----------------------------------------------------------
  -- Componente RAM sincrona
  -- Memoria de lectura y escritura
  -- ----------------------------------------------------------
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
      addr     : in  addr_t;
      data_in  : in  word_t;
      data_out : out word_t
    );
  end component;

  -- ----------------------------------------------------------
  -- Componente controlador FSM
  -- Coordina la copia ROM->RAM y el acceso externo
  -- ----------------------------------------------------------
  component memory_controller is
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
  end component;

  -- ----------------------------------------------------------
  -- Componente decodificador 7 segmentos
  -- Convierte un byte en señales para el display fisico
  -- ----------------------------------------------------------
  component dec_7seg is
  port (
    bcd : in  integer range 0 to 9;  -- integer, no std_logic_vector
    seg : out std_logic_vector(6 downto 0)
  );
end component;

end package mem_pkg;

package body mem_pkg is
end package body mem_pkg;