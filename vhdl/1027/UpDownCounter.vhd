LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY UpDownCounter IS
    GENERIC (
        N : INTEGER := 5 -- 設定計數器的位數，預設為8位
    );
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        en_up : IN STD_LOGIC;
        count : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
    );
END ENTITY UpDownCounter;

ARCHITECTURE Behavioral OF UpDownCounter IS
    SIGNAL counter_reg : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            counter_reg <= (OTHERS => '0'); -- 重設計數器
        ELSIF rising_edge(clk) THEN
            IF en_up = '1' THEN
                counter_reg <= counter_reg + 1; -- 向上計數
            ELSE
                counter_reg <= counter_reg - 1; -- 向下計數
            END IF;
        END IF;
    END PROCESS;

    count <= counter_reg; -- 輸出計數器的目前值
END ARCHITECTURE Behavioral;