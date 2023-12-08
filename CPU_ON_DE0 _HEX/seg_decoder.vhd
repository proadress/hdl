library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.commonConstants.all;

entity seg_decoder is port(
	segin:in std_logic_vector(3 downto 0);
	segout:out std_logic_vector(6 downto 0)
	);
end seg_decoder;

architecture seg_decoder of seg_decoder is
begin

	segout <= "1000000" when segin = X"0" else
				 "1111001" when segin = X"1" else
				 "0100100" when segin = X"2" else
				 "0110000" when segin = X"3" else
				 "0011001" when segin = X"4" else
				 "0010010" when segin = X"5" else
				 "0000010" when segin = X"6" else
				 "1111000" when segin = X"7" else
				 "0000000" when segin = X"8" else
				 "0010000" when segin = X"9" else
				 "0001000" when segin = X"a" else
				 "0000011" when segin = X"b" else
				 "0100111" when segin = X"c" else
				 "0100001" when segin = X"d" else
				 "0000110" when segin = X"e" else
				 "0001110" when segin = X"f" else
				 "1111111";
end seg_decoder;				 
				 
				 
				 
	