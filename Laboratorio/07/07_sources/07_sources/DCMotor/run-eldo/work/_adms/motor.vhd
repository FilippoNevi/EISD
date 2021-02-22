LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY STD;
USE STD.ALL;

ENTITY motor IS
  GENERIC (
   km :   real :=  4.500000e+00;
   kf :   real :=  6.200000e+00;
   j :   real :=  1.200000e+00;
   d :   real :=  1.000000e-01;
   r :   real :=  5.000000e+00;
   l :   real :=  2.000000e-02 );
  PORT (
    SIGNAL shaft : INOUT STD_LOGIC;
    SIGNAL p : INOUT STD_LOGIC;
    SIGNAL n : INOUT STD_LOGIC);
END ENTITY motor;

