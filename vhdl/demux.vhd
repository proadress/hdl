LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY demux IS
	PORT (
		d : IN STD_LOGIC;
		s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		en : STD_LOGIC;
		f : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END demux;

ARCHITECTURE demux_a OF demux IS

BEGIN

	f <= "1111" WHEN en = '1'ELSE
		"111" & d WHEN s = "00" ELSE
		"11" & d & '1' WHEN s = "01" ELSE
		'1' & d & "11" WHEN s = "10" ELSE
		d & "111";
END demux_a;