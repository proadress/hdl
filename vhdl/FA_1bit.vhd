LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FA_1bit IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		C : IN STD_LOGIC;
		S : OUT STD_LOGIC;
		Co : OUT STD_LOGIC
	);
END FA_1bit;

ARCHITECTURE FA_1bit OF FA_1bit IS

BEGIN

	S <= A XOR B XOR C;
	Co <= (A AND B) OR (B AND C) OR (C AND A);

END FA_1bit;