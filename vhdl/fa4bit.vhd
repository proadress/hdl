LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY fa4bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Ci : IN STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Co : OUT STD_LOGIC
	);
END fa4bit;

ARCHITECTURE fa4bit OF FA4bit IS
	SIGNAL C1, C2, C3 : STD_LOGIC;

BEGIN

	S(0) <= A(0) XOR B(0) XOR Ci;
	C1 <= (A(0) AND B(0)) OR (B(0) AND Ci) OR (Ci AND A(0));

	S(1) <= A(1) XOR B(1) XOR C1;
	C2 <= (A(1) AND B(1)) OR (B(1) AND C1) OR (C1 AND A(1));

	S(2) <= A(2) XOR B(2) XOR C2;
	C3 <= (A(2) AND B(2)) OR (B(2) AND C2) OR (C2 AND A(2));

	S(3) <= A(3) XOR B(3) XOR C3;
	Co <= (A(3) AND B(3)) OR (B(3) AND C3) OR (C3 AND A(3));
END fa4bit;