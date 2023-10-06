LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY demux IS
	PORT (
		D : IN STD_LOGIC;
		S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		EN : STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END demux;

ARCHITECTURE demux OF demux IS

BEGIN

	F <= "111" & D WHEN S = "00" AND En = '1' ELSE
		"11" & D & '1' WHEN S = "01" AND En = '1' ELSE
		'1' & D & "11" WHEN S = "10" AND En = '1' ELSE
		D & "111" WHEN S = "11" AND En = '1' ELSE
		"1111";
END demux;