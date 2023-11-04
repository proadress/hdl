LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY div_freq_mux_1 IS
	PORT (
		clk : IN STD_LOGIC;
		S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		F : OUT STD_LOGIC
	);
END div_freq_mux_1;

ARCHITECTURE div_freq_mux_1 OF div_freq_mux_1 IS
	SIGNAL p0, p1, p2, p3 : STD_LOGIC;

	COMPONENT div_freq_4 IS
		PORT (
			clk : IN STD_LOGIC;
			F : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT div_freq_5 IS
		PORT (
			clk : IN STD_LOGIC;
			F : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT div_freq_6 IS
		PORT (
			clk : IN STD_LOGIC;
			F : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT div_freq_7 IS
		PORT (
			clk : IN STD_LOGIC;
			F : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT mux_4_1 IS
		PORT (
			P : IN STD_LOGIC_VECTOR(0 TO 3);
			S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			F : OUT STD_LOGIC
		);
	END COMPONENT;
BEGIN

	U1 : div_freq_4 PORT MAP(clk, p0);
	U2 : div_freq_5 PORT MAP(clk, p1);
	U3 : div_freq_6 PORT MAP(clk, p2);
	U4 : div_freq_7 PORT MAP(clk, p3);
	U5 : mux_4_1 PORT MAP(p0 & p1 & p2 & p3, S => S, F => F);
END div_freq_mux_1;