LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		updown : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		co1 : OUT STD_LOGIC;
		co2 : OUT STD_LOGIC
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.counter_8bit
		PORT MAP(
			clk => clk,
			rst => rst,
			updown => updown,
			s => s,
			co1 => co1,
			co2 => co2
		);
END vhdl_a;