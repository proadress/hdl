LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		aa, bb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		mm : IN STD_LOGIC;
		cii : IN STD_LOGIC;
		ss : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		coo : OUT STD_LOGIC
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
	SIGNAL temp_a : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL co2 : STD_LOGIC;
BEGIN
	u0 : ENTITY work.faa_4bit
		PORT MAP(a => aa, b => bb, m => mm, ci => cii, s => temp_a, co => coo);
	u1 : ENTITY work.fa_4bit
		PORT MAP(a => temp_a, b => "0000", ci => mm, s => ss, co => co2);
	
END vhdl_a;