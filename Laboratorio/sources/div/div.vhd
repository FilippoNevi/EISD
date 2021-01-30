
package div_pack is
  constant  SIZE : INTEGER := 32;
  constant COLOR_SIZE: INTEGER :=16;
  constant Reset_ST : INTEGER := 0; 
  constant ST_0 : INTEGER := 1;
  constant ST_1 : INTEGER := 2;
  constant ST_2 : INTEGER := 3;
  constant ST_3 : INTEGER := 4;
  constant ST_4 : INTEGER := 5;
end div_pack;

library IEEE;
use IEEE.std_logic_1164.all;
use WORK.div_pack.all;
use IEEE.NUMERIC_BIT.all;

entity div is
    port (  clk, rst   : in  bit;
        din_rdy     : in  bit;
        din         : in  UNSIGNED (SIZE-1 downto 0);
        dout_rdy    : out  bit;
        dout        : out UNSIGNED (SIZE-1 downto 0)
    ) ;
end div;

architecture behav of div is 

subtype status_t is integer range 0 to 5;
signal STATE,NEXT_STATE: status_t;
signal  tmp_dout: unsigned(SIZE-1 downto 0);
signal tmp_value: unsigned(SIZE-1 downto 0); 
signal r, g, b,prova: unsigned(COLOR_SIZE-1 downto 0);

begin 
--FSM
process(din_rdy, din, STATE)
begin 
    NEXT_STATE<=STATE;

    case STATE is

        when Reset_ST =>
            NEXT_STATE <= ST_0;

        when ST_0 =>
            if din_rdy = '1' then
                NEXT_STATE <= ST_1;
            else 
                NEXT_STATE <= ST_0;
            end if;

        when ST_1 =>
            NEXT_STATE <= ST_2;

        when ST_2 =>
            NEXT_STATE <= ST_3;

        when ST_3 =>
            NEXT_STATE <= ST_4;
            
        when ST_4 =>
            NEXT_STATE <= ST_0;
    end case;  

end process;



-- datapath
process(clk,rst)
begin
    if rst = '1' then
        STATE <= Reset_ST;

    elsif clk'event and clk='1' then

        STATE <= NEXT_STATE;

        case STATE is
            when Reset_ST =>
                dout_rdy<='0';
                tmp_value <= (others => '0');
                tmp_dout <= (others => '0');
                r <= (others => '0');
                g <= (others => '0');
                b <= (others => '0');
                
            when ST_0 =>
                dout_rdy<='0'; 
                tmp_value <= din;
                
            when ST_1 =>
                r(7 downto 0) <= tmp_value(7 downto 0);
                g(7 downto 0) <= tmp_value(15 downto 8);
                b(7 downto 0) <= tmp_value(23 downto 16);
                
                r(15 downto 8) <=(others => '0');
                g(15 downto 8) <=(others => '0');
                b(15 downto 8) <=(others => '0');
                
            when ST_2 => 
                r <= (r sll 10)/(r+g+b);
                g <= (g sll 10)/(r+g+b);
                
            when ST_3 =>
                tmp_dout(23 downto 16) <= r(7 downto 0);
                tmp_dout(15 downto  0) <= g(15 downto 0);
                
            when ST_4 =>
                dout_rdy<='1';
                dout<=tmp_dout;
        end case;
    end if;
end process;


end architecture;