LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY GrayToBinaryConverter IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        gray_input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        binary_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        binary_outputp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY GrayToBinaryConverter;

ARCHITECTURE Behavioral OF GrayToBinaryConverter IS
    -- 定义格雷码到二进制码的转换函数
    FUNCTION GrayToBinary(gray : STD_LOGIC_VECTOR(3 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
        VARIABLE binary : STD_LOGIC_VECTOR(3 DOWNTO 0);
    BEGIN
        FOR i IN gray'right TO gray'left - 1 LOOP
            binary(i) := gray(i + 1) XOR gray(i);
        END LOOP;

        RETURN binary;
    END FUNCTION GrayToBinary;

    PROCEDURE ConvertGrayToBinary(gray : IN STD_LOGIC_VECTOR(3 DOWNTO 0);binary : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) )IS
    BEGIN
        FOR i IN gray'right TO gray'left - 1 LOOP
            binary(i) := gray(i + 1) XOR gray(i);
        END LOOP;
    END PROCEDURE ConvertGrayToBinary;

BEGIN
    PROCESS (clk)
        VARIABLE binary : STD_LOGIC_VECTOR(3 DOWNTO 0);
        VARIABLE binaryp : STD_LOGIC_VECTOR(3 DOWNTO 0);
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                binary := (OTHERS => '0'); -- 重設暫存器
                binaryp := (OTHERS => '0'); -- 重設暫存器
            ELSE
                binary := GrayToBinary(gray_input);
                ConvertGrayToBinary(gray_input, binaryp);
            END IF;
        END IF;
        binary_output <= binary;
        binary_outputp <= binaryp;
    END PROCESS;
END ARCHITECTURE Behavioral;