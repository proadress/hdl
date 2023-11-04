library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_freq_mux is
	port(
			clk:in std_logic;
			S:in std_logic_vector(1 downto 0);
			F:out std_logic
	);
end div_freq_mux;

architecture div_freq_mux of div_freq_mux is
signal p0,p1,p2,p3:std_logic;

		component div_freq_4 is
			port(
					clk:in std_logic;
					F:out std_logic
			);
		end component;

		component div_freq_5 is
			port(
					clk:in std_logic;
					F:out std_logic
			);
		end component;

		component div_freq_6 is
			port(
					clk:in std_logic;
					F:out std_logic
			);
		end component;

		component div_freq_7 is
			port(
					clk:in std_logic;
					F:out std_logic
			);
		end component;

		component mux_4_1 is
			port(
					P:in std_logic_vector(0 to 3);
					S:in std_logic_vector(1 downto 0);
					F:out std_logic
			);
		end component;




begin

U1:div_freq_4 port map(
								clk => clk,
								F => p0
							);
U2:div_freq_5 port map(
								clk => clk,
								F => p1
							);
				
U3:div_freq_6 port map(
								clk => clk,
								F => p2
							);
U4:div_freq_7 port map(
								clk => clk,
								F => p3
							);				
				
U5:mux_4_1 port map(
								P(0) => p0,
								P(1) => p1,
								P(2) => p2,
								P(3) => p3,	
								S => S,		
								F => F
							);							
	
	


end div_freq_mux;	