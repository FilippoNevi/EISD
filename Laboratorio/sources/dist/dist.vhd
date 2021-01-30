
package div_pack is
  constant  SIZE : INTEGER := 32;
  constant COLOR_SIZE: INTEGER :=16;

end div_pack;

library IEEE;
use IEEE.std_logic_1164.all;
use WORK.div_pack.all;
use IEEE.NUMERIC_BIT.all;

entity dist is
    port (  clk, rst   : in  bit;
        din_rdy     : in  bit;
        din         : in  UNSIGNED (SIZE-1 downto 0);
        addr        : in UNSIGNED (SIZE-1 downto 0);
        db_mode     : in  bit;
        dout_rdy    : out  bit;
        dout        : out UNSIGNED (17 downto 0)
    ) ;
end dist;

architecture behav of dist is 
  constant Reset_ST : INTEGER := 0; 
  constant ST_0 : INTEGER := 1;
  constant ST_1 : INTEGER := 2;
  constant ST_2 : INTEGER := 3;
  constant ST_3 : INTEGER := 4;
  constant ST_4 : INTEGER := 5;
  constant ST_5 : INTEGER := 6;
  constant ST_6 : INTEGER := 7;
subtype status_t is integer range 0 to 7;
type image_array_t is array (0 to 512) of unsigned(7 downto 0);
signal tmp1,tmp2,tmp3,tmp4: unsigned(7 downto 0);
signal p1, p2, p3, p4: unsigned (17 downto 0);
signal STATE: status_t;
signal addr_reg, din_reg: unsigned (31 downto 0);
signal db_mode_reg: bit;
signal image_segment: image_array_t;

begin 

process(clk)



variable middleres1, middleres2, middleres3, middleres4: unsigned(7 downto 0);

begin
if clk'event and clk = '1' then
    if rst = '1' then
    
        STATE <= Reset_ST;
        dout_rdy <='0';
        dout <= (others =>'0');
        
    else 
        case STATE is
        
        when Reset_ST =>
            --operation
            dout_rdy <= '0';
            dout <= (others =>'0');
            
            --transition
            STATE <= ST_0;
            
        when ST_0 =>
            --operation
            dout_rdy<= '0';
            dout<= (others=>'0');
            tmp1<= (others =>'0');
            tmp2<= (others =>'0');
            tmp3<= (others =>'0');
            tmp4<= (others =>'0');
            
            --transition
            if din_rdy='1' then
                STATE <= ST_1;
            end if;
        
        when ST_1 =>
            --operation
            tmp1 <= din(7 downto 0);
            tmp2 <= din(15 downto 8);
            tmp3 <= din(23 downto 16);
            tmp4 <= din(31 downto 24);               
            addr_reg <= addr;
            db_mode_reg <= db_mode;

            --transition
            if(db_mode = '1') then
                STATE <= ST_2;
            else
                STATE <= ST_3;
            end if;    
            
        --db mode = '1'    
        when ST_2 =>
            --operation
            image_segment(to_integer(addr_reg))     <= tmp4;
            image_segment(to_integer(addr_reg+1))   <= tmp3;
            image_segment(to_integer(addr_reg+2))   <= tmp2;
            image_segment(to_integer(addr_reg+3))   <= tmp1;    
            
            --transition
            STATE<= ST_6; 
            
            
        -- db_mode = '0'
        when ST_3 =>
            --operation
            middleres1:= tmp4 - image_segment(to_integer(addr_reg));
            middleres2 := tmp3 - image_segment(to_integer(addr_reg+1));
            middleres3 := tmp2 - image_segment(to_integer(addr_reg+2));
            middleres4 := tmp1 - image_segment(to_integer(addr_reg+3));
            
            --transition
            STATE <= ST_4;
            
        when ST_4 =>
            --operation
            p1 <="00"& middleres1 * middleres1;
            p2 <="00"& middleres2 * middleres2;
            p3 <="00"& middleres3 * middleres3;
            p4 <="00"& middleres4 * middleres4;

            
            --transition
            STATE <= ST_5;
            
        when ST_5 =>
            --operation
            dout <= p1 + p2 + p3 + p4;
            
            --transition
            STATE <= ST_6;
            
        when ST_6 =>
            --operation
            dout_rdy<='1';
            
            --transition
            STATE <= ST_0;
        end case;   
                 
    end if;

end if; 
end process;

end architecture;