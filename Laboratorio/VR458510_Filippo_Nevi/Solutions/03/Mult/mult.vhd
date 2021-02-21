PACKAGE mult_pack IS
	CONSTANT BYTE : INTEGER := 8;
	CONSTANT SIZE : INTEGER := 32;
	CONSTANT Reset_ST : INTEGER := 0;
	CONSTANT ST_0 : INTEGER := 1;
	CONSTANT ST_1 : INTEGER := 2;
	CONSTANT ST_2 : INTEGER := 3;
	CONSTANT ST_3 : INTEGER := 4;
	CONSTANT ST_4 : INTEGER := 5;
	CONSTANT ST_5 : INTEGER := 6;
END mult_pack;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE WORK.mult_pack.ALL;
USE IEEE.NUMERIC_BIT.ALL;

ENTITY mult IS
	PORT (clk, rst : IN BIT;
		din_1 : IN UNSIGNED (BYTE-1 DOWNTO 0);
		din_2 : IN UNSIGNED (BYTE-1 DOWNTO 0);
		din_3 : IN UNSIGNED (BYTE-1 DOWNTO 0);
		din_4 : IN UNSIGNED (BYTE-1 DOWNTO 0);
		din_rdy : IN BIT;
		dout_1 : OUT UNSIGNED (BYTE-1 DOWNTO 0);
		dout_2 : OUT UNSIGNED (BYTE-1 DOWNTO 0);
		dout_3 : OUT UNSIGNED (BYTE-1 DOWNTO 0);
		dout_4 : OUT UNSIGNED (BYTE-1 DOWNTO 0);
		dout_rdy : OUT BIT
	);
END mult;

ARCHITECTURE mult_arch OF mult IS
	SUBTYPE status_t IS INTEGER RANGE 0 to 6;
	SUBTYPE internal_t IS UNSIGNED (31 DOWNTO 0);
	SIGNAL STATUS : status_t;
	SIGNAL NEXT_STATUS : status_t;
	SIGNAL Product : internal_t;
	SIGNAL Number_A : internal_t;
	SIGNAL Number_B : internal_t;
	SIGNAL Counter : internal_t;
BEGIN

FSM : PROCESS (STATUS, din_rdy, Counter)
BEGIN
	CASE STATUS IS
		WHEN Reset_ST  =>
			NEXT_STATUS <= ST_0;
		WHEN ST_0 => 
			IF din_rdy = '1' THEN
				NEXT_STATUS <= ST_1;
			ELSE
				NEXT_STATUS <= ST_0;
			END IF;
		WHEN ST_1 => 
			NEXT_STATUS <= ST_2;
		WHEN ST_2 =>
			IF Number_B(0) = '1'  THEN
				NEXT_STATUS <= ST_3;
			ELSE
				NEXT_STATUS <= ST_4;
			END IF;
		WHEN ST_3 => 
			NEXT_STATUS <= ST_4;
		WHEN ST_4 => 
			IF Counter > 0 THEN
				NEXT_STATUS <= ST_2;
			ELSE
				NEXT_STATUS <= ST_5;
			END IF;
		WHEN ST_5 => 
			NEXT_STATUS <= ST_0;
		WHEN others => 
			NEXT_STATUS <= STATUS;
	END CASE;
END PROCESS;

DATAPATH : PROCESS(clk, rst)
BEGIN
	IF rst = '0' THEN
		STATUS <= Reset_ST;
	ELSIF clk'EVENT AND clk='1' THEN
		STATUS <= NEXT_STATUS;
		CASE NEXT_STATUS IS
			WHEN Reset_ST => 
				dout_1 <= (others => '0');
				dout_2 <= (others => '0');
				dout_3 <= (others => '0');
				dout_4 <= (others => '0');
				dout_rdy <= '0';
				Number_A <= (others => '0');
				Number_B <= (others => '0');
				Product <= (others => '0');
				Counter <= (others => '0');
			WHEN ST_0 => 
				dout_1 <= (others => '0');
				dout_2 <= (others => '0');
				dout_3 <= (others => '0');
				dout_4 <= (others => '0');
				dout_rdy <= '0';
				Number_A <= (others => '0');
				Number_B <= (others => '0');
				Product <= (others => '0');
				Counter <= (others => '0');
			WHEN ST_1 => 
			    Number_A(15 DOWNTO 8) <= din_1;
				Number_A(7 DOWNTO 0) <= din_2;
				Counter(15 DOWNTO 8) <= din_1;
				Counter(7 DOWNTO 0) <= din_2;
				Number_B(15 DOWNTO 8) <= din_3;
				Number_B(7 DOWNTO 0) <= din_4;
			WHEN ST_2 =>
			WHEN ST_3 => 
				Product <= Product + Number_A;
			WHEN ST_4 => 
				Number_A <= Number_A sll 1;
				Number_B <= Number_B srl 1;
				Counter <= Counter srl 1;
			WHEN ST_5 =>
				dout_1 <= Product(31 DOWNTO 24);
				dout_2 <= Product(23 DOWNTO 16);
				dout_3 <= Product(15 DOWNTO 8);
				dout_4 <= Product(7 DOWNTO 0);
				dout_rdy <= '1';
			WHEN others =>
		END CASE;
	END IF;
END PROCESS;

END ARCHITECTURE;