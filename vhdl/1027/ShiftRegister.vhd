LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ShiftRegister IS
  GENERIC (
    N : INTEGER := 8 -- 暫存器的位數，預設為8位
  );
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    func : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
    dout : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
  );
END ENTITY ShiftRegister;

ARCHITECTURE Behavioral OF ShiftRegister IS
BEGIN
  PROCESS (clk)
    VARIABLE reg : STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
  BEGIN
    IF rising_edge(clk) THEN
      IF func = '1' THEN
        -- 左移
        reg(N - 1 DOWNTO 1) := din(N - 2 DOWNTO 0);
        reg(0) := din(N - 1);
      ELSE
        -- 右移
        reg(N - 1) := din(0);
        reg(N - 2 DOWNTO 0) := din(N - 1 DOWNTO 1);
      END IF;

      IF rst = '1' THEN
        reg := (OTHERS => '0'); -- 重設暫存器
      END IF;
    END IF;

    dout <= reg;
  END PROCESS;
END ARCHITECTURE Behavioral;