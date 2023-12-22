-- top.vhd --
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;
USE work.commonConstants.ALL;

ENTITY CPU_ON_DE0 IS PORT (
	clk, reset : IN STD_LOGIC;
	mem_mux_sw : IN STD_LOGIC;
	ex_mem_addr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	led : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)

);
END CPU_ON_DE0;

ARCHITECTURE CPU_ON_DE0 OF CPU_ON_DE0 IS
	COMPONENT ram1 PORT (
		reset, en, r_w : IN STD_LOGIC;
		aBus : IN STD_LOGIC_VECTOR(adrLength - 1 DOWNTO 0);
		dBus : INOUT STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT cpu PORT (
		clk, reset : IN STD_LOGIC;
		m_en, m_rw : OUT STD_LOGIC;
		aBus : OUT STD_LOGIC_VECTOR(adrLength - 1 DOWNTO 0);
		dBus : INOUT STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0);
		ledBus : OUT STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0);
		swin : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT display PORT (
		tick : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		toseg : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		seg0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		seg1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		seg2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		seg3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		led : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL mem_en, mem_en_cpu, mem_rw, mem_rw_cpu : STD_LOGIC;
	SIGNAL abus, abus_cpu : STD_LOGIC_VECTOR(adrLength - 1 DOWNTO 0);
	SIGNAL dbus_cpu : STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0);
	SIGNAL tmp_reg : STD_LOGIC_VECTOR(wordSize - 1 DOWNTO 0);

BEGIN

	abus <= abus_cpu WHEN mem_mux_sw = '0' ELSE
		"0000000000" & ex_mem_addr;
	-- tmp_reg <= dbus_cpu;
	mem_en <= mem_en_cpu WHEN mem_mux_sw = '0' ELSE
		'1';
	mem_rw <= mem_rw_cpu WHEN mem_mux_sw = '0' ELSE
		'1';

	ramC : ram1 PORT MAP(reset, mem_en, mem_rw, abus, dbus_cpu);
	cpuC : cpu PORT MAP(clk, reset, mem_en_cpu, mem_rw_cpu, abus_cpu, dbus_cpu, tmp_reg, ex_mem_addr);

	led <= "0000" & ex_mem_addr;
	-- displayC : display PORT MAP(tmp_reg(2 DOWNTO 0), tmp_reg(15 DOWNTO 0), HEX0, HEX1, HEX2, HEX3, led);
	HEX0 <= "1111110" WHEN tmp_reg(3 DOWNTO 0) = x"0" ELSE
		"1111101" WHEN tmp_reg(3 DOWNTO 0) = x"1" ELSE
		"1111011" WHEN tmp_reg(3 DOWNTO 0) = x"2" ELSE
		"1110111" WHEN tmp_reg(3 DOWNTO 0) = x"3" ELSE
		"1111111";
	HEX1 <=
		"1110111" WHEN tmp_reg(3 DOWNTO 0) = x"4" ELSE
		"1111110" WHEN tmp_reg(3 DOWNTO 0) = x"b" ELSE
		"1111111";

	HEX2 <=
		"1110111" WHEN tmp_reg(3 DOWNTO 0) = x"5" ELSE
		"1111110" WHEN tmp_reg(3 DOWNTO 0) = x"a" ELSE
		"1111111";

	HEX3 <= "1110111" WHEN tmp_reg(3 DOWNTO 0) = x"6" ELSE
		"1101111" WHEN tmp_reg(3 DOWNTO 0) = x"7" ELSE
		"1011111" WHEN tmp_reg(3 DOWNTO 0) = x"8" ELSE
		"1111110" WHEN tmp_reg(3 DOWNTO 0) = x"9" ELSE
		"1111111";
END CPU_ON_DE0;