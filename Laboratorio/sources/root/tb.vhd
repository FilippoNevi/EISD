library IEEE;
use IEEE.std_logic_1164.all;
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

component root is
    port (
    	clk		    : in  bit;
        rst			: in bit;
        din_rdy     : in  bit;
        din         : in  UNSIGNED (31 downto 0);
        dout_rdy    : out  bit;
        dout        : out UNSIGNED (31 downto 0)
        );
end component root;


begin

clk <= not clk after ClockPeriod/2;

process
variable i: integer :=1;
begin

    while i <128 loop 

    rst<='1';
    din <= to_unsigned(i*i,32);
    din_rdy<='1'; 
    wait for ClockPeriod;

    while dout_rdy /= '1' loop
        wait for ClockPeriod;
    end loop;

    rst<='0';
    din_rdy<='0'; 
    din <= (others=> '0');
    i := i + 1;
    wait for ClockPeriod;

end loop;
end process;



  dut : root port map (clk=>clk,
  					 rst=>rst,
                     din=>din,
                     din_rdy=>din_rdy,
                     dout_rdy=>dout_rdy,
                     dout=>dout);
  
  
end architecture;