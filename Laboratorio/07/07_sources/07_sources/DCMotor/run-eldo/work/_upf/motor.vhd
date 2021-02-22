library ieee;
use ieee.std_logic_1164.all;

use ieee.upf.all;

entity motor is
  generic (
   km :   real :=  4.500000e+00;
   kf :   real :=  6.200000e+00;
   j :   real :=  1.200000e+00;
   d :   real :=  1.000000e-01;
   r :   real :=  5.000000e+00;
   l :   real :=  2.000000e-02 );
  PORT (
    signal shaft : INOUT std_logic;
    signal p : INOUT std_logic;
    signal n : INOUT std_logic);
end entity motor;

