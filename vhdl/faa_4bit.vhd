LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY faa_4bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ci : IN STD_LOGIC;
		subtract : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		co : BUFFER STD_LOGIC;
		overflow : OUT STD_LOGIC
	);
END faa_4bit;

ARCHITECTURE faa_4bit_a OF faa_4bit IS
	SIGNAL c1, c2, c3 : STD_LOGIC;

BEGIN
	s(0) <= a(0) XOR (subtract XOR b(0)) XOR ci;
	c1 <= (a(0) AND (subtract XOR b(0))) OR ((subtract XOR b(0)) AND ci) OR (ci AND a(0));

	s(1) <= a(1) XOR (subtract XOR b(1)) XOR c1;
	c2 <= (a(1) AND (subtract XOR b(1))) OR ((subtract XOR b(1)) AND c1) OR (c1 AND a(1));

	s(2) <= a(2) XOR (subtract XOR b(2)) XOR c2;
	c3 <= (a(2) AND (subtract XOR b(2))) OR ((subtract XOR b(2)) AND c2) OR (c2 AND a(2));

	s(3) <= a(3) XOR (subtract XOR b(3)) XOR c3;
	co <= (a(3) AND (subtract XOR b(3))) OR ((subtract XOR b(3)) AND c3) OR (c3 AND a(3));

	overflow <= c3 XOR co;

END faa_4bit_a;