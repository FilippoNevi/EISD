library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY root_apb_wrapper IS
    PORT (
        pclk    : in std_logic;
        presetn : in std_logic;
        paddr   : in std_logic_vector(31 downto 0);
        psel    : in std_logic;
        penable : in std_logic;
        pwrite  : in std_logic;
        pwdata  : in std_logic_vector(31 downto 0);
        pready  : out std_logic;
        prdata  : out std_logic_vector(31 downto 0)
    );
END root_apb_wrapper;

ARCHITECTURE root_apb_wrapper OF root_apb_wrapper IS
    COMPONENT root
        PORT (
            clk      : in std_logic;
            rst      : in std_logic;
            din_rdy  : in std_logic;
            din      : in std_logic_vector   (31 downto 0);
            dout     : out std_logic_vector  (31 downto 0);
            dout_rdy : out std_logic
        );
    END COMPONENT root;
    SIGNAL clk      : std_logic;
    SIGNAL rst      : std_logic;
    SIGNAL din_rdy  : std_logic;
    SIGNAL din      : std_logic_vector (31 downto 0);
    SIGNAL dout     : std_logic_vector (31 downto 0);
    SIGNAL dout_rdy : std_logic;

BEGIN
    -- From BUS to Root
    clk     <= pclk;
    rst     <= presetn;
    din_rdy <= penable;
    din     <= pwdata;

    -- From Root to BUS
    prdata  <= dout;
    pready  <= dout_rdy;

    -- Mapping
    root_0 : root
    PORT MAP(
        clk         => clk,
        rst         => rst,
        din_rdy     => din_rdy,
        din         => din,
        dout        => dout,
        dout_rdy    => dout_rdy
    );
END root_apb_wrapper;
