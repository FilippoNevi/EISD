entity example_1 is
end example_1;

architecture behav of example_1 is
signal A,B: bit;
begin
  
-- P1
P1: process(B)
begin
  A <= '1';
  A <= transport '0' after 5 ns;
end process P1;

-- P2
P2: process(A)
begin
  if A = '1' then B <= not B after 10 ns; end if;
end process P2;

end behav;
