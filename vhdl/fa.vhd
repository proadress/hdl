LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY fa IS
	PORT (
		a, b, c : IN STD_LOGIC;
		s, co : OUT STD_LOGIC
	);
END fa;

ARCHITECTURE fa_a OF fa IS
BEGIN

	s <= a XOR b XOR c;
	co <= (a AND b) OR (b AND c) OR (c AND a);
END fa_a;