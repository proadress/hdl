LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY pwm IS
    PORT (
        clk : IN STD_LOGIC;
        sw : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        led : out STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END pwm;

ARCHITECTURE pwm OF pwm IS
    SIGNAL cnt :STD_LOGIC_VECTOR(20 DOWNTO 0);
    SIGNAL cnt1 :STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL clk1 :STD_LOGIC;

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

    led <= "1111111111"WHEN cnt1 < sw ELSE
        "0000000000";

END pwm;