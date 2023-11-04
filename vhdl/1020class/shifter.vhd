library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shifter is
	port(
			clk:in std_logic;
			reset:in std_logic;
			fun:in std_logic;
			L:in std_logic;
			R:in std_logic;
			Q:out std_logic_vector(7 downto 0)
			);
end shifter;

architecture shifter of shifter is
signal tmp:std_logic_vector(7 downto 0);

begin
	process(clk,reset)
	begin
			if reset = '0' then
				tmp <= (others => '0');
			elsif clk'event and clk = '1' then	
				if fun = '0' then
					tmp <= L & tmp(7 downto 1);
				else
					tmp <= tmp(6 downto 0) & R;
				end if;
			end if;
		end process;
	
		Q <= tmp;

end shifter;
