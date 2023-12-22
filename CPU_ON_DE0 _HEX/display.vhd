LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE work.commonConstants.ALL;

ENTITY display IS PORT (
	tick : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	toseg : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	seg0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	seg1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	seg2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	seg3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	led : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END display;

ARCHITECTURE display OF display IS
	COMPONENT seg_decoder IS PORT (
		segin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		segout : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
BEGIN

	led <= "0000000001" WHEN tick = "000" ELSE
		"0000000010" WHEN tick = "001" ELSE
		"0000000100" WHEN tick = "010" ELSE
		"0000001000" WHEN tick = "011" ELSE
		"0000010000" WHEN tick = "100" ELSE
		"0000100000" WHEN tick = "101" ELSE
		"0001000000" WHEN tick = "110" ELSE
		"0010000000";

	u1 : seg_decoder PORT MAP(toseg(3 DOWNTO 0), seg0);
	u2 : seg_decoder PORT MAP(toseg(7 DOWNTO 4), seg1);
	u3 : seg_decoder PORT MAP(toseg(11 DOWNTO 8), seg2);
	u4 : seg_decoder PORT MAP(toseg(15 DOWNTO 12), seg3);

END display;