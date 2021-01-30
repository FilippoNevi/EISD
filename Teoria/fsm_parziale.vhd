PACKAGE fms_pack IS
	TYPE states IS (s0, s1, s2, s3);
END PACKAGE;

ENTITY my_fsm IS
	PORT(
		input, clk, res: IN BIT;
		output: OUT BIT
		);
END ENTITY;

ARCHITECTURE fms of my_fsm IS
	SIGNAL state : states := s0;
	SIGNAL next_state : states := s0;
BEGIN
	StateEvolution: PROCESS(clk, res)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			IF (res='0') THEN
				state <= s0;
			ELSE
				state <= next_state;
			END IF;
		END IF;
	END PROCESS StateEvolution;

	NextStateLogic: PROCESS(state, input)
	BEGIN
		CASE state IS
			WHEN 's0' =>	IF input = '0' THEN
											next_state <= s2;
										ELSE
											next_state <= s1;
										END IF;
			WHEN 's1' =>	IF input = '0' THEN
											next_state <= s2;
										ELSE
											next_state <= s3;
										END IF;
			WHEN 's2' => 	IF input = '0' THEN
											next_state <= s3;
										ELSE
											next_state <= s2;
										END IF;
			WHEN 's3' => 	IF input = '0' THEN
											next_state <= s2;
										ELSE
											next_state <= s1;
										END IF;
			WHEN OTHERS => next_state <= s0;
		END CASE;
	END PROCESS;

	OutputLogic: PROCESS(state)
	BEGIN
		IF (state = 's3') THEN
			output <= '1';
		ELSE
			output <= '0';
		END IF;
	END PROCESS;
END ARCHITECTURE;