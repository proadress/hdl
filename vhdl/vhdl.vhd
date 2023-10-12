LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		up_down : IN STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		alarm : OUT STD_LOGIC
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.up_down_counter_0_26_20_5
		PORT MAP(clk => clk, reset => reset, up_down => up_down, q => q, alarm => alarm);

END vhdl_a;