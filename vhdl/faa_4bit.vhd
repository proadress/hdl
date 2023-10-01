LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY faa_4bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		m : IN STD_LOGIC;
		ci : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		co : OUT STD_LOGIC
	);
END faa_4bit;

ARCHITECTURE faa_4bit_a OF faa_4bit IS
	SIGNAL c1, c2, c3 : STD_LOGIC;

BEGIN

	s(0) <= a(0) XOR (b(0) xor m) XOR ci;
	c1 <= (a(0) AND (b(0) xor m)) OR ((b(0) xor m) AND ci) OR (ci AND a(0));

	s(1) <= a(1) XOR (b(1) xor m) XOR c1;
	c2 <= (a(1) AND (b(1) xor m)) OR ((b(1) xor m) AND c1) OR (c1 AND a(1));

	s(2) <= a(2) XOR (b(2) xor m) XOR c2;
	c3 <= (a(2) AND (b(2) xor m)) OR ((b(2) xor m) AND c2) OR (c2 AND a(2));

	s(3) <= a(3) XOR (b(3) xor m) XOR c3;
	co <= (a(3) AND (b(3) xor m)) OR ((b(3) xor m) AND c3) OR (c3 AND a(3));
END faa_4bit_a;