
entity ex_3 is
  port ( 
         D: inout bit
       );
end ex_3;


architecture behav of ex_3 is
  signal A : bit := '0';
  signal B : bit := '0';
  signal C : bit := '0';
  signal E : bit := '0';
  signal F : bit := '0';
begin

  C <= A;
  A <= B or D;

  P1: process (A)
  begin
	B <= A;
  end process P1;

  P2: process
  begin
	wait until A = '1';
	wait for 0 ns;
	E <= B;
	D <= '0';
	F <= E;
  end process P2;

end architecture behav;

