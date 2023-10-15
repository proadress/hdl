LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_decoder IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END counter_decoder;
ARCHITECTURE counter_decoder OF counter_decoder IS

	COMPONENT down_counter IS
		PORT (
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT decoder_3to8 IS
		PORT (
			A : IN STD_LOGIC;
			B : IN STD_LOGIC;
			C : STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL ABC : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

	U1 : down_counter PORT MAP(
		clk => clk,
		reset => reset,
		Q => ABC);
	U2 : decoder_3to8 PORT MAP(
		A => ABC(2),
		B => ABC(1),
		C => ABC(0),
		F => F);
END counter_decoder;