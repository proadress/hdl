LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bcd_0to9 IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        start : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        load : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        co : OUT STD_LOGIC
    );
END bcd_0to9;

ARCHITECTURE bcd_0to9_a OF bcd_0to9 IS
BEGIN
    PROCESS (clk, rst)
        VARIABLE reg : STD_LOGIC_VECTOR(3 DOWNTO 0);
        VARIABLE c : STD_LOGIC;
    BEGIN
        IF rst = '0' THEN
            reg := start;
            c := '0';
        ELSIF clk'event AND clk = '1'AND load = '1' THEN
            reg := reg + 1;
            IF reg = x"A" THEN
                reg := x"0";
                c := '1';
            ELSE
                c := '0';
            END IF;
        END IF;
        s <= reg;
        co <= c;
    END PROCESS;
END bcd_0to9_a;