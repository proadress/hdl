library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
	port(
			A,B:in std_logic_vector(7 downto 0);
			C:in std_logic;
			S:out std_logic_vector(7 downto 0);
			Co:out std_logic
			);
end adder;

architecture adder of adder is		
signal temp:std_logic_vector(8 downto 0);

begin

	temp <= ('0'&A)+B+C;
	S <= temp(7 downto 0);
	Co <= temp(8);

end adder;	