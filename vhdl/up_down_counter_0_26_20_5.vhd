LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY up_down_counter_0_26_20_5 IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		up_down : IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END up_down_counter_0_26_20_5;
ARCHITECTURE up_down_counter_0_26_20_5_a OF up_down_counter_0_26_20_5 IS
	SIGNAL cnt : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN

	Q <= cnt;

	PROCESS (clk, reset)
	BEGIN
		IF reset = '0' THEN
			cnt <= (OTHERS => '0');
		ELSIF clk'event AND clk = '1' THEN
			IF up_down = '0' THEN
				IF cnt = "11010" THEN
					cnt <= "00000";
				ELSE
					cnt <= cnt + 1;
				END IF;
			ELSE
				IF cnt = "00000" THEN
					cnt <= "10100";
				ELSE
					cnt <= cnt - 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;

END up_down_counter_0_26_20_5_a;