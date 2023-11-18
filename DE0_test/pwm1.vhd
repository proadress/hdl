LIBRARY IEteEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pwm IS
    PORT (
        clk : IN STD_LOGIC;
        sw : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        led : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END pwm;

ARCHITECTURE pwm OF pwm IS
    SIGNAL cnt : STD_LOGIC_VECTOR(20 DOWNTO 0);
    SIGNAL cnt1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL clk1 : STD_LOGIC;
    SIGNAL clk2 : STD_LOGIC;
    SIGNAL sw2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL upp : STD_LOGIC;
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            cnt <= cnt + 1;
        END IF;
    END PROCESS;
    clk1 <= cnt(3);
    PROCESS (clk1)
    BEGIN
        IF rising_edge(clk1) THEN
            cnt1 <= cnt1 + 1;
        END IF;
    END PROCESS;

    clk2 <= cnt(14);
    PROCESS (clk2)
    BEGIN
        IF rising_edge(clk2) THEN
            IF sw2 = "1111111111"THEN
                upp = '1';
            ELSIF sw2 = "0000000000"THEN
                upp = '0';
            ELSE
                IF upp = '1' THEN
                    sw2 <= sw2 + 1;
                ELSE
                    sw2 <= sw2 - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    led <= '1111111111' WHEN cnt1 < sw2 ELSE
        '0000000000';

END pwm;