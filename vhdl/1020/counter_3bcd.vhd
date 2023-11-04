LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_3bcd IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        updown : IN STD_LOGIC;
        s1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        s2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        s3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        co1 : BUFFER STD_LOGIC;
        co2 : BUFFER STD_LOGIC;
        co3 : BUFFER STD_LOGIC
    );
END counter_3bcd;

ARCHITECTURE counter_3bcd_a OF counter_3bcd IS
    SIGNAL c1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL c2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL c3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    -- 連接兩個4位元計數器，注意引腳對應關係
    counter_4bit_inst1 : ENTITY work.counter_4bit
        PORT MAP(
            clk => clk,
            rst => rst,
            updown => updown,
            max => "1001",
            s => c1,
            co => co1
        );
    counter_4bit_inst2 : ENTITY work.counter_4bit
        PORT MAP(
            clk => co1,
            rst => rst,
            updown => updown,
            max => "1001",
            s => c2,
            co => co2
        );
    counter_4bit_inst3 : ENTITY work.counter_4bit
        PORT MAP(
            clk => co2,
            rst => rst,
            updown => updown,
            max => "1001",
            s => c3,
            co => co3
        );

    -- 輸出訊號賦值
    s1 <= c1;
    s2 <= c2;
    s3 <= c3;
END counter_3bcd_a;