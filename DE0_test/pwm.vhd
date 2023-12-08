LIBRARY IEEE;
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

    TYPE CC IS ARRAY(0 TO 9) OF STD_LOGIC_VECTOR(9 DOWNTO 0);


    SIGNAL sww : CC;
    SIGNAL r : STD_LOGIC;

    SIGNAL breath_enable : BOOLEAN := FALSE;
    SIGNAL breath_direction : BOOLEAN := TRUE; -- TRUE for increasing, FALSE for decreasing

    SIGNAL cnt : STD_LOGIC_VECTOR(22 DOWNTO 0);
    SIGNAL cnt1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL clk1 : STD_LOGIC;
    SIGNAL clk2 : STD_LOGIC;
    SIGNAL clk3 : STD_LOGIC;
    SIGNAL sw2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL up : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL play : STD_LOGIC_VECTOR(9 DOWNTO 0);
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
            FOR i IN 0 TO 9 LOOP
                IF up(i) = '1' AND sww(i) /= "1111111111" THEN
                    sww(i) <= sww(i) + 1;
                ELSIF sww(i) /= "0000000000" THEN
                    sww(i) <= sww(i) - 1;
                END IF;
            END LOOP;
        END IF;
    END PROCESS;

    clk3 <= cnt(20);
    PROCESS (clk3)
    BEGIN
        IF rising_edge(clk3) THEN
            IF up = "1111111111" THEN
                up <= "0000000000";
                r <= '1' XOR r;
            ELSIF r = '1' THEN
                up <= '1' & up(9 DOWNTO 1);
            ELSE
                up <= up(8 DOWNTO 0) & '1';
            END IF;
        END IF;
        
    END PROCESS;
    led(0) <= '1' WHEN cnt1 < sww(0) ELSE
    '0';
    led(1) <= '1' WHEN cnt1 < sww(1) ELSE
    '0';
    led(2) <= '1' WHEN cnt1 < sww(2) ELSE
    '0';
    led(3) <= '1' WHEN cnt1 < sww(3) ELSE
    '0';
    led(4) <= '1' WHEN cnt1 < sww(4) ELSE
    '0';
    led(5) <= '1' WHEN cnt1 < sww(5) ELSE
    '0';
    led(6) <= '1' WHEN cnt1 < sww(6) ELSE
    '0';
    led(7) <= '1' WHEN cnt1 < sww(7) ELSE
    '0';
    led(8) <= '1' WHEN cnt1 < sww(8) ELSE
    '0';
    led(9) <= '1' WHEN cnt1 < sww(9) ELSE
    '0';

END pwm;