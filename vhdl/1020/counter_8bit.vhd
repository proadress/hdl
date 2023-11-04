LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_8bit IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        updown : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        co1 : BUFFER STD_LOGIC;
        co2 : BUFFER STD_LOGIC
    );
END counter_8bit;

ARCHITECTURE counter_8bit_a OF counter_8bit IS
    SIGNAL count4bit1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL count4bit2 : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    counter_4bit_inst1 : ENTITY work.counter_4bit
        PORT MAP(
            clk => clk,
            rst => rst,
            updown => updown,
            max => "1111",
            s => count4bit1,
            co => co1
        );
    counter_4bit_inst2 : ENTITY work.counter_4bit
        PORT MAP(
            clk => co1,
            rst => rst,
            updown => updown,
            max => "1111",
            s => count4bit2,
            co => co2
        );

    -- 輸出訊號賦值
    s <= count4bit2 & count4bit1; -- 將兩個4位元計數器的輸出連接成一個8位元計數器
END counter_8bit_a;