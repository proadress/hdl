LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY BCD IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        hf : IN STD_LOGIC;
        tozero : IN STD_LOGIC;
        casin : IN STD_LOGIC;
        casout : OUT STD_LOGIC;
        speed : IN STD_LOGIC;
        second : OUT std logic;
        HEXO : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        HEX1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        HEX3 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
END BCD;

ARCHITECTURE BCD OF BCD IS
    SIGNAL BCD1, BCD2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BCD34 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL clk, c1, c2, c3 : STD_LOGIC;

BEGIN
    Ul : diveclk PORT MAP(tozero, clk, speed, second, clklOO);
    U2 : cascade_BCD_l PORT MAP(clk100, reset, hf, tozero, casin, cl, BCD1);
    U3 : cascade_BCD_2 PORT MAP(clk100, reset, hf, tozero, cl, c2, BCD2);
    U4 : cascade_BCD_34 PORT MAP(clk100, reset, hf, tozero, c2, c3, BCD34);
    U5 : decoder_7seg PORT MAP(BCD1, HEXO);
    U6 : decoder_7seg PORT MAP(BCD2, HEX1);
    U7 : decoder_7seg PORT MAP(BCD34(3 DOWNTO 0), HEX2);
    U8 : decoder_7seg PORT MAP(BCD34(7 DOWNTO 4), HEX3);
END;