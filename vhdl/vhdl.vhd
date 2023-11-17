LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY vhdl IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		gray_input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		binary_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		binary_outputp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.GrayToBinaryConverter
		PORT MAP(
			clk => clk,
			rst => rst,
			gray_input => gray_input,
			binary_output => binary_output,
			binary_outputp => binary_outputp
		);
END vhdl_a;