LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cascade_counter_12bit IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		casin : IN STD_LOGIC;
		casout : OUT STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END cascade_counter_12bit;

ARCHITECTURE cascade_counter_12bit OF cascade_counter_12bit IS

	COMPONENT cascade_counter IS
		PORT (
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			casin : IN STD_LOGIC;
			casout : OUT STD_LOGIC;
			Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL c1, c2 : STD_LOGIC;

BEGIN

	U1 : cascade_counter PORT MAP(clk, reset, casin, c1, Q(3 DOWNTO 0));
	U2 : cascade_counter PORT MAP(clk, reset, c1, c2, Q(7 DOWNTO 4));
	U3 : cascade_counter PORT MAP(clk, reset, c2, casout, Q(11 DOWNTO 8));
END cascade_counter_12bit;