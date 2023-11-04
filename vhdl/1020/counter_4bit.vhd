LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_4bit IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        updown : IN STD_LOGIC;
        max : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        co : OUT STD_LOGIC
    );
END counter_4bit;

ARCHITECTURE counter_4bit_a OF counter_4bit IS
BEGIN
    PROCESS (clk, rst)
        VARIABLE reg : STD_LOGIC_VECTOR(3 DOWNTO 0);
        VARIABLE c : STD_LOGIC;
    BEGIN
        IF rst = '0' THEN
            reg := "0000"; -- 重設時將計數器清除
            c := '0';
        ELSIF rising_edge(clk) THEN -- 使用上升沿觸發時序邏輯
            -- 計數邏輯，每個時鐘週期加1
            IF updown = '1' THEN
                IF reg = max THEN
                    reg := "0000"; -- 若計數到 max，就清除
                    c := '1';
                ELSE
                    reg := reg + 1;
                    c := '0';
                END IF;
            ELSE
                IF reg = "0000" THEN
                    reg := max; -- 若計數到 0，就max
                    c := '1';
                ELSE
                    reg := reg - 1;
                    c := '0';
                END IF;
            END IF;
        END IF;
        -- 輸出訊號賦值
        s <= reg;
        co <= c;
    END PROCESS;
END counter_4bit_a;