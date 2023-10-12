library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity add_suber is
	port(
			A,B:in std_logic_vector(7 downto 0);
			C:in std_logic;
			M:in std_logic; --M=0:+, M=1:-
			S:out std_logic_vector(7 downto 0);
			Co:out std_logic
			);
end add_suber;

architecture add_suber of add_suber is		
signal temp:std_logic_vector(8 downto 0);

begin


	temp <= ('0'&A)+B+C when M ='0' else
			  ('0'&A)-B-C;
			  
	S <= temp(7 downto 0);
	Co <= temp(8);

end add_suber;	