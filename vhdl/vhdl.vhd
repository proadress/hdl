LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		s1, s2, s3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.counter_123to201
		PORT MAP(clk => clk, rst => rst, s1 => s1, s2 => s2, s3 => s3);

END vhdl_a;