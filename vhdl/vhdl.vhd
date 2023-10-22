LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.shift_reg_control
		PORT MAP(clk => clk, reset => rst, q => q);

END vhdl_a;