library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_BIT.all;


entity tb is 
end tb;

architecture bh of tb is 
signal clk,rst: bit;
signal din: unsigned (31 downto 0);
signal addr: unsigned (31 downto 0);
signal db_mode: bit;
signal dout : unsigned (17 downto 0);
signal din_rdy: bit;
signal dout_rdy: bit;
constant ClockPeriod    : time    := 20 ns;

component dist is
    
    port (
    	clk		    : in  bit;
        rst			: in bit;
        din_rdy     : in  bit;
        din         : in  UNSIGNED (31 downto 0);
        dout_rdy    : out  bit;
        dout        : out UNSIGNED (17 downto 0);
        addr        : in UNSIGNED(31 downto 0);
        db_mode     : in bit
        );

end component dist;


begin

clk <= not clk after ClockPeriod/2;

process 

variable data       : unsigned(31 downto 0);
variable dout_data  : unsigned(17 downto 0);
variable recognized : bit;

begin
    
    -- Reset phase 
    rst <= '1';
    wait for ClockPeriod*2;
    rst <= '0';
    wait for ClockPeriod;
    
    -- Phase 1: Store the image
    for i in 0 to 120 loop
        
        data := to_unsigned(i,32) sll 24;
        data := data + (to_unsigned(i,32) sll 16); 
        data := data + (to_unsigned(i,32) sll 8);
        data := data + to_unsigned(i,32);
        din <= data;
        addr <= to_unsigned((i*4),32);
        
        db_mode <= '1';
        din_rdy <= '1';
        wait for ClockPeriod;

        while dout_rdy /= '1' loop
        wait for ClockPeriod;
        end loop;

       

    end loop;

    -- Phase 2:

    for i in 0 to 120 loop
        
        data := to_unsigned(i,32) sll 24;
        data := data + (to_unsigned(i+2,32) sll 16); 
        data := data + (to_unsigned(i+2,32) sll 8);
        data := data + to_unsigned(i+2,32);
        din <= data;
        addr <= to_unsigned((i*4),32);

        db_mode <= '0';
        din_rdy <= '1';
        wait for ClockPeriod;

        while dout_rdy /= '1' loop
        wait for ClockPeriod;
        end loop;

    end loop;    

    dout_data := dout;
    wait for ClockPeriod;

    recognized:='0';
    
    if (dout_data*dout_data) < 25000 then
        -- the two images represent the same persons 
        report "Recognized";
        recognized:='1';
    else
        -- the images represent two different persons
        report "WRONG: Not Recognized";
        recognized:='0';

    end if;

end process;

  dut : dist port map (clk=>clk,
  					 rst=>rst,
                     din=>din,
                     din_rdy=>din_rdy,
                     dout_rdy=>dout_rdy,
                     dout=>dout,
                     db_mode => db_mode,
                     addr=> addr);
  
  
end architecture;