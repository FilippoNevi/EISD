library IEEE;
use IEEE.std_logic_1164.all;
use WORK.div_pack.all;
use IEEE.NUMERIC_BIT.all;


entity tb is 
end tb;

architecture bh of tb is 
signal clk,rst: bit;
signal din: unsigned (31 downto 0);
signal dout : unsigned (31 downto 0);
signal din_rdy: bit;
signal dout_rdy: bit;
constant ClockPeriod    : time    := 20 ns;

component div is
    port (
    	clk		    : in  bit;
        rst			: in bit;
        din_rdy     : in  bit;
        din         : in  UNSIGNED (31 downto 0);
        dout_rdy    : out  bit;
        dout        : out UNSIGNED (31 downto 0)
        );
end component div;


begin

clk <= not clk after ClockPeriod/2;

process
variable now: integer:=0;
begin
while now <3000 loop 
din(0) <= '1';
din(7 downto 1) <= (others => '0');
din(8) <= '1';
din(15 downto 9) <= (others => '0');
din(16) <= '1';
din(23 downto 17) <= (others => '0');
din(24) <= '1';
din_rdy<='1'; 
wait for ClockPeriod*2;
din_rdy<='0'; 
while dout_rdy /= '1' loop
wait for ClockPeriod;
end loop;
din_rdy<='0'; 
wait for ClockPeriod;
now := now +1;
end loop;
end process;



  dut : div port map (clk=>clk,
  					 rst=>rst,
                     din=>din,
                     din_rdy=>din_rdy,
                     dout_rdy=>dout_rdy,
                     dout=>dout);
  
  
end architecture;