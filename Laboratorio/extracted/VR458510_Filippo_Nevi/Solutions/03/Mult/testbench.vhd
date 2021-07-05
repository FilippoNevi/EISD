LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.math_real.uniform;
USE IEEE.math_real.floor;

ENTITY testbench IS
END testbench;

ARCHITECTURE behaviour OF testbench IS
SIGNAL clk, rst : BIT;
SIGNAL din_1, din_2, din_3, din_4 : UNSIGNED(7 DOWNTO 0);
SIGNAL dout_1, dout_2, dout_3, dout_4 : UNSIGNED(7 DOWNTO 0);
SIGNAL din_rdy : BIT;
SIGNAL dout_rdy : BIT;

CONSTANT ClockPeriod : TIME := 10 ns;

COMPONENT mult IS
PORT (
	clk : IN BIT;
	rst : IN BIT;
	din_rdy : IN BIT;
	din_1 : IN UNSIGNED(7 DOWNTO 0);
	din_2 : IN UNSIGNED(7 DOWNTO 0);
	din_3 : IN UNSIGNED(7 DOWNTO 0);
	din_4 : IN UNSIGNED(7 DOWNTO 0);
	dout_rdy : OUT BIT;
	dout_1 : OUT UNSIGNED(7 DOWNTO 0);
	dout_2 : OUT UNSIGNED(7 DOWNTO 0);
	dout_3 : OUT UNSIGNED(7 DOWNTO 0);
	dout_4 : OUT UNSIGNED(7 DOWNTO 0)
);
END COMPONENT mult;

BEGIN
	clk <= not clk AFTER ClockPeriod/2;

	PROCESS
	   VARIABLE i : INTEGER := 1;
	BEGIN
	   WHILE i < 128 LOOP
            rst <= '1';
            
            -- Number_A
            din_1 <= TO_UNSIGNED(i, 8);
            din_2 <= TO_UNSIGNED(i, 8);
            
            -- Number_B
            din_3 <= TO_UNSIGNED(i, 8);
            din_4 <= TO_UNSIGNED(i, 8);
            
            din_rdy <= '1';
            WAIT FOR ClockPeriod;
    
            WHILE dout_rdy /= '1' LOOP
                WAIT FOR ClockPeriod;
            END LOOP;
            
            
            rst <= '0';
            din_rdy <= '0';
            din_1 <= (others => '0');
            din_2 <= (others => '0');
            din_3 <= (others => '0');
            din_4 <= (others => '0');
            
            i := i + 1;
    
            WAIT FOR ClockPeriod;
        END LOOP;
	END PROCESS;

dut : mult PORT MAP(
	clk => clk,
	rst => rst,
	din_rdy => din_rdy,
	din_1 => din_1,
	din_2 => din_2,
	din_3 => din_3,
	din_4 => din_4,
	dout_rdy => dout_rdy,
	dout_1 => dout_1,
	dout_2 => dout_2,
	dout_3 => dout_3,
	dout_4 => dout_4
);

END ARCHITECTURE;