LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY down_counter IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END down_counter;

ARCHITECTURE down_counter OF down_counter IS
	SIGNAL cnt : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
	PROCESS (clk, reset)
	BEGIN
		IF reset = '0' THEN
			cnt <= "111";
		ELSIF clk'event AND clk = '1' THEN
			cnt <= cnt + 1;
		END IF;
	END PROCESS;

	Q <= cnt;
END down_counter;