LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder_7seg IS
    PORT (
        BCD : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        HEX : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ENTITY decoder_7seg;

ARCHITECTURE decoder_7seg OF decoder_7seg IS
BEGIN
    PROCESS (BCD)
    BEGIN
        CASE BCD IS
            WHEN "0000" => HEX <= "1000000";
            WHEN "0001" => HEX <= "1111001";
            WHEN "0010" => HEX <= "0100100";
            WHEN "0011" => HEX <= "0110000";
            WHEN "0100" => HEX <= "0011001";
            WHEN "0101" => HEX <= "0010010";
            WHEN "0110" => HEX <= "0000010";
            WHEN "0111" => HEX <= "1111000";
            WHEN "1000" => HEX <= "0000000";
            WHEN "1001" => HEX <= "0010000";
            WHEN OTHERS => HEX <= "1111111";
        END CASE;
    END PROCESS;
END ARCHITECTURE decoder_7seg;