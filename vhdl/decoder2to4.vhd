library ieee;
use ieee.std_logic_1164.all;

entity decoder2to4 is
	port(
			A:in std_logic;
			B:in std_logic;
			en:in std_logic;
			F0,F1,F2,F3:out std_logic
	);
end decoder2to4;

architecture decoder2to4 of decoder2to4 is
begin
	F0 <= '1' when en = '0' and A = '0' and B = '0' else
			'0';
	F1 <= '1' when en = '0' and A = '0' and B = '1' else
			'0';
	F2 <= '1' when en = '0' and A = '1' and B = '0' else
			'0';
	F3 <= '1' when en = '0' and A = '1' and B = '1' else
			'0';			

end decoder2to4;	