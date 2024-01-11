-- ram1.vhd --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.commonConstants.ALL;

ENTITY ram1 IS PORT (
  reset, en, r_w : IN STD_LOGIC;
  aBus : IN STD_LOGIC_VECTOR(adrLength - 1 DOWNTO 0);
  dBus : INOUT STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0)
);
END ram1;

ARCHITECTURE ram1Arch OF ram1 IS
  CONSTANT resAdrLength : INTEGER := 6; -- address length restricted within architecture
  CONSTANT memSize : INTEGER := 2 ** resAdrLength;
  TYPE ram_typ IS ARRAY(0 TO memSize - 1) OF STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0);
  SIGNAL ram : ram_typ;
BEGIN
  PROCESS (reset, en, r_w)
  BEGIN
    IF reset = '0' THEN
      -- basic instruction check
      ram(0) <= x"1000"; -- t = 0
      ram(1) <= x"4030"; -- M30 = t-主要計數器歸零

      -- loop i = 60  M[60]記憶體的loop
      ram(2) <= x"100c"; -- i = 12
      ram(3) <= x"4060";
      -- ***延遲區域***
      -- loop j = 61  M[61]記憶體的loop
      ram(4) <= x"c000"; -- j = sw
      ram(5) <= x"4061";
      -- loop k = 62  M[62]記憶體的loop
      ram(6) <= x"1999"; -- k = 999
      ram(7) <= x"4062";

      ram(8) <= x"1001";-- acc = 1
      ram(9) <= x"0001";-- acc = -1
      ram(10) <= x"a062"; -- acc = m62-1
      ram(11) <= x"700d"; -- 成功出回圈跳next
      ram(12) <= x"6007"; -- 不成功繼續回到head

      ram(13) <= x"1001"; -- 
      ram(14) <= x"0001"; -- 
      ram(15) <= x"a061"; -- j
      ram(16) <= x"7012"; -- 成功出回圈跳next
      ram(17) <= x"6005"; -- 不成功繼續回到head
      -- ***延遲區域結束***
      -- ***主程式*** m30+=5
      ram(18) <= x"b030"; -- print M30	 
      ram(19) <= x"1001"; -- t = 1
      ram(20) <= x"4031"; -- m31 = t
      ram(21) <= x"2030"; -- t = m30
      ram(22) <= x"a031"; -- t += m31
      ram(23) <= x"4030"; -- m30 = t

      ram(24) <= x"1001";
      ram(25) <= x"0001";
      ram(26) <= x"a060"; -- i
      ram(27) <= x"7000"; -- 成功出回圈重複start
      ram(28) <= x"6003"; -- 不成功繼續回到head

      ram(29) <= x"0000"; -- halt
    ELSIF en = '1' AND r_w = '0' THEN
      ram(conv_integer(unsigned(aBus(resAdrLength - 1 DOWNTO 0)))) <= dBus;
    END IF;
  END PROCESS;
  dBus <= ram(conv_integer(unsigned(aBus(resAdrLength - 1 DOWNTO 0))))
    WHEN reset = '1' AND en = '1' AND r_w = '1' ELSE
    (dbus'RANGE => 'Z');
END ram1Arch;