library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.commonConstants.all;

entity display is port(
	tick:in std_logic_vector(2 downto 0);
	toseg:in std_logic_vector(15 downto 0);
	seg0:out std_logic_vector(6 downto 0);
	seg1:out std_logic_vector(6 downto 0);
	seg2:out std_logic_vector(6 downto 0);
	seg3:out std_logic_vector(6 downto 0);
	led:out std_logic_vector(9 downto 0)
	);
end display;	

architecture display of display is


component seg_decoder is port(
	segin:in std_logic_vector(3 downto 0);
	segout:out std_logic_vector(6 downto 0)
	);
end component;


begin

led <= "0000000001" when tick = "000" else
		 "0000000010" when tick = "001" else
		 "0000000100" when tick = "010" else
		 "0000001000" when tick = "011" else
		 "0000010000" when tick = "100" else
		 "0000100000" when tick = "101" else
		 "0001000000" when tick = "110" else
		 "0010000000"; 		
		 
u1:seg_decoder	port map(toseg(3 downto 0),seg0);
u2:seg_decoder	port map(toseg(7 downto 4),seg1);
u3:seg_decoder	port map(toseg(11 downto 8),seg2);
u4:seg_decoder	port map(toseg(15 downto 12),seg3);

end display;		
	
	
