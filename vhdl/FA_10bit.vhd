LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FA_10bit IS
	PORT (
		A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		C : IN STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		Co : OUT STD_LOGIC
	);
END FA_10bit;

ARCHITECTURE FA_10bit OF FA_10bit IS

	COMPONENT FA_1bit IS
		PORT (
			A : IN STD_LOGIC;
			B : IN STD_LOGIC;
			C : IN STD_LOGIC;
			S : OUT STD_LOGIC;
			Co : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT FA_4bit IS
		PORT (
			A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			C : IN STD_LOGIC;
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Co : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL c1, c2, c3 : STD_LOGIC;

BEGIN

	U1 : FA_4bit PORT MAP(
		A => A(3 DOWNTO 0),
		B => B(3 DOWNTO 0),
		C => C,
		S => S(3 DOWNTO 0),
		Co => c1
	);

	U2 : FA_4bit PORT MAP(
		A => A(7 DOWNTO 4),
		B => B(7 DOWNTO 4),
		C => c1,
		S => S(7 DOWNTO 4),
		Co => c2
	);

	U3 : FA_1bit PORT MAP(
		A => A(8),
		B => B(8),
		C => c2,
		S => S(8),
		Co => c3
	);

	U4 : FA_1bit PORT MAP(
		A => A(9),
		B => B(9),
		C => c3,
		S => S(9),
		Co => Co
	);

END FA_10bit;