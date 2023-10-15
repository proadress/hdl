LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FA_4bit IS
	PORT (
		A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		C : IN STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Co : OUT STD_LOGIC
	);
END FA_4bit;

ARCHITECTURE FA_4bit OF FA_4bit IS

	COMPONENT FA_1bit IS
		PORT (
			A : IN STD_LOGIC;
			B : IN STD_LOGIC;
			C : IN STD_LOGIC;
			S : OUT STD_LOGIC;
			Co : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL c1, c2, c3 : STD_LOGIC;

BEGIN

	U1 : FA_1bit PORT MAP(
		A => A(0),
		B => B(0),
		C => C,
		S => S(0),
		Co => c1
	);

	U2 : FA_1bit PORT MAP(
		A => A(1),
		B => B(1),
		C => c1,
		S => S(1),
		Co => c2
	);

	U3 : FA_1bit PORT MAP(
		A => A(2),
		B => B(2),
		C => c2,
		S => S(2),
		Co => c3
	);

	U4 : FA_1bit PORT MAP(
		A => A(3),
		B => B(3),
		C => c3,
		S => S(3),
		Co => Co
	);
END FA_4bit;