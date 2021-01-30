entity ex_2 is   
    port( x, clk: in bit;
          z: out bit );
end ex_2;

architecture fsm of ex_2 is   
    signal state : integer := 0;
    signal nextstate: integer := 0;
begin   
    process   
    begin   
	case state is      
            when 0 =>         
                if x='0' then z<='1'; nextstate<=1; end if;
                if x='1' then z<='0'; nextstate<=2; end if;
            when 1 =>
                if x='0' then z<='1'; nextstate<=3; end if;
                if x='1' then z<='0'; nextstate<=4; end if;
            when 2 =>
                if x='0' then z<='0'; nextstate<=4; end if;
                if x='1' then z<='1'; nextstate<=4; end if;
            when 3 =>
                if x='0' then z<='0'; nextstate<=5; end if;
                if x='1' then z<='1'; nextstate<=5; end if;
            when 4 =>
                if x='0' then z<='1'; nextstate<=5; end if;
                if x='1' then z<='0'; nextstate<=6; end if;
            when 5 =>
                if x='0' then z<='0'; nextstate<=0; end if;
                if x='1' then z<='1'; nextstate<=0; end if;
            when 6 =>
                if x='0' then z<='1'; nextstate<=0; end if;
            when others => null; -- should not occur
	end case;   
	wait on clk, x;
	if (clk'event and clk = '1') then    
            state <= nextstate;   
            wait for 0 ns;       -- wait for state to be updated
	end if;
    end process;
end fsm;	
