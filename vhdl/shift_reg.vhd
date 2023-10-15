LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY shift_reg IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		din : IN STD_LOGIC;
		inp : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		control : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END shift_reg;

ARCHITECTURE shift_reg OF shift_reg IS
	SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

	PROCESS (clk, reset)
	BEGIN
		IF reset = '0' THEN
			tmp <= (OTHERS => '0');
		ELSIF clk'event AND clk = '1' THEN
			IF control = "00" THEN
				IF tmp = "01100011" THEN
					tmp <= "00000000";
				ELSE
					tmp <= tmp + 1;
				END IF;
			ELSIF control = "01" THEN
				tmp <= tmp(6 DOWNTO 0) & tmp (7);
			ELSIF control = "10" THEN
				tmp <= din & tmp(7 DOWNTO 1);
			ELSE
				tmp <= inp;
			END IF;
		END IF;
	END PROCESS;

	Q <= tmp;

END shift_reg;