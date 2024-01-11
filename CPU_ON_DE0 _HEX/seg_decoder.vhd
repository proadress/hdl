LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE work.commonConstants.ALL;

ENTITY seg_decoder IS PORT (
	segin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	segout : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END seg_decoder;

ARCHITECTURE seg_decoder OF seg_decoder IS
BEGIN

	segout <= "1000000" WHEN segin = X"0" ELSE
		"1111001" WHEN segin = X"1" ELSE
		"0100100" WHEN segin = X"2" ELSE
		"0110000" WHEN segin = X"3" ELSE
		"0011001" WHEN segin = X"4" ELSE
		"0010010" WHEN segin = X"5" ELSE
		"0000010" WHEN segin = X"6" ELSE
		"1111000" WHEN segin = X"7" ELSE
		"0000000" WHEN segin = X"8" ELSE
		"0010000" WHEN segin = X"9" ELSE
		"0001000" WHEN segin = X"a" ELSE
		"0000011" WHEN segin = X"b" ELSE
		"0100111" WHEN segin = X"c" ELSE
		"0100001" WHEN segin = X"d" ELSE
		"0000110" WHEN segin = X"e" ELSE
		"0001110" WHEN segin = X"f" ELSE
		"1111111";
END seg_decoder;