LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY random_counter IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END random_counter;
ARCHITECTURE random_counter_a OF random_counter IS
    SIGNAL reg : STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '0' THEN
            reg <= o"0" & o"1";
        ELSIF clk'event AND clk = '1' THEN
            CASE reg IS
                WHEN o"0" & o"1" => reg <= o"0" & o"2";
                WHEN o"0" & o"2" => reg <= o"1" & o"1";
                WHEN o"1" & o"1" => reg <= o"0" & o"3";
                WHEN o"0" & o"3" => reg <= o"2" & o"1";
                WHEN o"2" & o"1" => reg <= o"0" & o"4";
                WHEN o"0" & o"4" => reg <= o"3" & o"1";
                WHEN o"3" & o"1" => reg <= o"1" & o"4";
                WHEN o"1" & o"4" => reg <= o"4" & o"1";
                WHEN o"4" & o"1" => reg <= o"1" & o"3";
                WHEN o"1" & o"3" => reg <= o"5" & o"1";
                WHEN o"5" & o"1" => reg <= o"1" & o"2";
                WHEN o"1" & o"2" => reg <= o"6" & o"1";
                WHEN o"6" & o"1" => reg <= o"2" & o"4";
                WHEN o"2" & o"4" => reg <= o"0" & o"1";
                WHEN OTHERS => reg <= o"0" & o"1";
            END CASE;
        END IF;
    END PROCESS;

    q <= reg(2 DOWNTO 0);

END random_counter_a;