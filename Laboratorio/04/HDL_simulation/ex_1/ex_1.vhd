entity ex_1 is
  port( x, clk: in bit;
	    z: out bit );
end ex_1;

architecture fsm of ex_1 is
  signal state, nextstate: integer := 0;
begin
  process(state,x) -- Combinational Network
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
  end process;

  process(clk) -- state Register
  begin
	if clk='1' then -- rising edge of clock
	  state <= nextstate;
	end if;
  end process;
end fsm;
