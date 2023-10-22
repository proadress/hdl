LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY shift_reg_control IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END shift_reg_control;

ARCHITECTURE shift_reg_control_a OF shift_reg_control IS
    SIGNAL tmp : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL up : STD_LOGIC;
BEGIN

    PROCESS (clk, reset)
    BEGIN
        IF reset = '0' THEN
            tmp <= "10000000";
            up <= '0';
        ELSIF clk'event AND clk = '1' THEN
            IF tmp = "00000001" THEN
                up <= '1';
                tmp <= tmp(6 DOWNTO 0) & tmp (7);
            ELSIF tmp = "10000000" THEN
                up <= '0';
                tmp <= tmp (0) & tmp(7 DOWNTO 1);
            ELSIF up = '1' THEN
                tmp <= tmp(6 DOWNTO 0) & tmp (7);
            ELSE
                tmp <= tmp (0) & tmp(7 DOWNTO 1);
            END IF;
        END IF;
    END PROCESS;
    q <= tmp;

END shift_reg_control_a;