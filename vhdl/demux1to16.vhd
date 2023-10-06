LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY demux1to16 IS
	PORT (
		d : IN STD_LOGIC;
		s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		en : STD_LOGIC;
		f : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		p : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END demux1to16;

ARCHITECTURE demux1to16_a OF demux1to16 IS
	-- SIGNAL p : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
	a : ENTITY work.decoder2to4 PORT MAP(a => s(3), b => s(2), en => en, f => p);
	d0 : ENTITY work.demux PORT MAP(d => d, s => s(1 DOWNTO 0), en => p(0), f => f(3 DOWNTO 0));
	d1 : ENTITY work.demux PORT MAP(d => d, s => s(1 DOWNTO 0), en => p(1), f => f(7 DOWNTO 4));
	d2 : ENTITY work.demux PORT MAP(d => d, s => s(1 DOWNTO 0), en => p(2), f => f(11 DOWNTO 8));
	d3 : ENTITY work.demux PORT MAP(d => d, s => s(1 DOWNTO 0), en => p(3), f => f(15 DOWNTO 12));
END demux1to16_a;