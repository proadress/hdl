LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY vhdl IS
	PORT (
		d : IN STD_LOGIC;
		s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		en : STD_LOGIC;
		f : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		p : buffer STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END vhdl;

ARCHITECTURE vhdl_a OF vhdl IS
BEGIN
	u0 : ENTITY work.demux1to16
		PORT MAP(d => d, s => s, en => en, f => f, p => p);

END vhdl_a;