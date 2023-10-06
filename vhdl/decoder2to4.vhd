LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder2to4 IS
	PORT (
		a : IN STD_LOGIC;
		b : IN STD_LOGIC;
		en : IN STD_LOGIC;
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END decoder2to4;

ARCHITECTURE decoder2to4 OF decoder2to4 IS
BEGIN
	f(0) <= '1' WHEN en = '0' AND a = '0' AND b = '0' ELSE
		'0';
	f(1) <= '1' WHEN en = '0' AND a = '0' AND b = '1' ELSE
		'0';
	f(2) <= '1' WHEN en = '0' AND a = '1' AND b = '0' ELSE
		'0';
	f(3) <= '1' WHEN en = '0' AND a = '1' AND b = '1' ELSE
		'0';

END decoder2to4;