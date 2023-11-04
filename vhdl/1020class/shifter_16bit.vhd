library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shifter_16bit is
	port(
			clk:in std_logic;
			reset:in std_logic;
			fun:in std_logic;
			L:in std_logic;
			R:in std_logic;
			Q:out std_logic_vector(15 downto 0)
			);
end shifter_16bit;

architecture shifter_16bit of shifter_16bit is

signal tmp:std_logic_vector(15 downto 0);


		component shifter is
			port(
					clk:in std_logic;
					reset:in std_logic;
					fun:in std_logic;
					L:in std_logic;
					R:in std_logic;
					Q:out std_logic_vector(7 downto 0)
					);
		end component;

begin


U1:shifter port map(clk,reset,fun,L,tmp(7),tmp(15 downto 8));
U2:shifter port map(clk,reset,fun,tmp(8),R,tmp(7 downto 0));

Q <= tmp;



end shifter_16bit;