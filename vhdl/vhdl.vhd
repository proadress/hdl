LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.random_counter
		PORT MAP(clk => clk, reset => reset, q => q);

END vhdl_a;