library ieee;
use ieee.std_logic_1164.all;

use ieee.upf.all;

entity vsrc is
  PORT (
    signal p : OUT std_logic;
    signal n : OUT std_logic;
    signal dc : IN std_logic_vector(9 downto 0) );
end entity vsrc;

