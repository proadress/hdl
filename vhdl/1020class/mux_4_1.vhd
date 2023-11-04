library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_4_1 is
	port(
			P:in std_logic_vector(0 to 3);
			S:in std_logic_vector(1 downto 0);
			F:out std_logic
	);
end mux_4_1;

architecture mux_4_1 of mux_4_1 is
begin

	F <= 	P(0) when S = "00" else
			P(1) when S = "01" else
			P(2) when S = "10" else
			P(3);

end mux_4_1;	