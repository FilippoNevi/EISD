library IEEE;
use IEEE.std_logic_1164.all;

entity nor_gate is
	generic (delay: time := 5 ns);
	port (a,b: in bit;
		c: out bit);
end nor_gate;

architecture dataflow of nor_gate is
begin
	c <= a nor b after delay;
end dataflow;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
entity rsflop is
	port (set,reset: in bit;
		q,qbar: inout bit);
end rsflop;

architecture netlist of rsflop is
component nor2
	generic(delay: time);
	port(a,b: in bit; c: out bit);
end component;
SIGNAL z_bus: bit_vector(3 DOWNTO 0);
SIGNAL a_bit, b_bit, c_bit, d_bit: bit;
begin
z_bus <= (2 => b_bit, 3 => a_bit, 0 => d_bit, 1 => c_bit);
end netlist;

-- Guarded block example
g_sig_es: block (clk = '1')
	sig_out <= guarded sig_in;
end block g_sig_es;

--------------------------------------------------------------------------------
-- Behavioural VHDL ------------------------------------------------------------
--------------------------------------------------------------------------------

entity prova is
	generic(delay:time:=10 ns);
end prova;

architecture prova_arch of prova is

-- Signal declaration
SIGNAL num, sum:INTEGER:=0;
sig_ex: PROCESS
BEGIN
	WAIT FOR 20 ns;
	num <= num + 1;
	sum <= sum + num;
END PROCESS sig_ex;

-- Variable declaration
var_ex: PROCESS
	VARIABLE num,sum:INTEGER:=0;
begin
	WAIT FOR 20 ns;
	num := num + 1;
	sum := sum + num;
end PROCESS var_ex;

begin
end architecture prova_arch;


-- PROCESSES
sensitivity_list_style_proc:
PROCESS (alarm_t, current_t)
	IF (alarm_t = current_t) THEN
		sound <= '1';
	ELSE
		sound <= '0';
	END IF;
END PROCESS;

wait_style_proc:
PROCESS
	IF (alarm_t = current_t) THEN
		sound <= '1';
	ELSE
		sound <= '0';
	END IF;
	WAIT ON alarm_t, current_t;
END PROCESS wait_style_proc;

-- BRANCHES
CASE int_a IS
	WHEN 0			=> z <= a;
	WHEN 1 TO 3		=> z <= b;
	WHEN 4 | 6 | 8	=> z <= c;
	WHEN OTHERS		=> z <= 'X';
END CASE;


-- PROCEDURES
PROCEDURE find_min (variable values: in int_array;
		variable min_val: inout integer;
		variable old_min: out integer) is
BEGIN
	temp := old_min := min_val;

	for i in values'range loop
		if values(i) < temp THEN
			temp := values(i)
		end if;
	end loop;

	min_val := temp;
end find_min;

--other stuff...
find_min(my_array, minimu, old_value);


-- FUNCTIONS
FUNCTION bit_to_boolean (bit_in: in bit) RETURN boolean IS
BEGIN
	IF bit_in = '1' THEN RETURN true;
	ELSE RETURN FALSE;
	END IF;
END bit_to_boolean;

