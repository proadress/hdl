LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_123to201 IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        s1, s2, s3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END counter_123to201;

ARCHITECTURE counter_123to201_a OF counter_123to201 IS

    COMPONENT bcd_0to9 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            co : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL c1, c2, c3 : STD_LOGIC;

BEGIN

    u1 : bcd_0to9 PORT MAP(
        clk <= clk,
        rst <= rst,
        s <= s1,
        co <= c1
    );

    u2 : bcd_0to9 PORT MAP(
        clk <= c1,
        rst <= rst,
        s <= s2,
        co <= c2
    );

    u3 : bcd_0to9 PORT MAP(
        clk <= c2,
        rst <= rst,
        s <= s3,
        co <= c3
    );

END counter_123to201_a;