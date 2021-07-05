library ieee;
use ieee.std_logic_1164.all;

use ieee.upf.all;

entity circuit is
  generic (
   r :   real :=  1.000000e+03;
   \is\ :   real :=  1.000000e-14 );
  PORT (
    signal res : INOUT std_logic;
    signal p : INOUT std_logic;
    signal n : INOUT std_logic);
end entity circuit;

