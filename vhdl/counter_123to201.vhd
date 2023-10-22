LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_123to201 IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        s1, s2, s3 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END counter_123to201;

ARCHITECTURE counter_123to201_a OF counter_123to201 IS

    COMPONENT bcd_0to9 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            start : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            load : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            co : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL c1, c2, c3, l : STD_LOGIC;

BEGIN

    u1 : bcd_0to9 PORT MAP(clk => clk, rst => rst, start => x"3", load => l, s => s1, co => c1);
    u2 : bcd_0to9 PORT MAP(clk => c1, rst => rst, start => x"2", load => l, s => s2, co => c2);
    u3 : bcd_0to9 PORT MAP(clk => c2, rst => rst, start => x"1", load => l, s => s3, co => c3);

    PROCESS (clk, rst)
        VARIABLE load : STD_LOGIC;
    BEGIN
        IF rst = '0' THEN
            load := '1';
        ELSIF clk'event AND clk = '1' THEN
            IF s1 = x"0" AND s2 = x"0" AND s3 = x"2" THEN
                load := '0';
            END IF;
        END IF;
        l <= load;
    END PROCESS;

END counter_123to201_a;