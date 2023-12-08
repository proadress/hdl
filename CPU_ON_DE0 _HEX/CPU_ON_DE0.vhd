-- top.vhd --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use work.commonConstants.all;

entity CPU_ON_DE0 is port(
    clk, reset: in STD_LOGIC;
	 mem_mux_sw:in std_LOGIC;
	 ex_mem_addr:in std_logic_vector(5 downto 0);	 
	 HEX0:out std_logic_vector(6 downto 0);
	 HEX1:out std_logic_vector(6 downto 0);
	 HEX2:out std_logic_vector(6 downto 0);
	 HEX3:out std_logic_vector(6 downto 0);	 
	 led:out std_logic_vector(9 downto 0) 
 
	 );
end CPU_ON_DE0;

architecture CPU_ON_DE0 of CPU_ON_DE0 is


		component ram1 port (
			 reset, en, r_w: in STD_LOGIC;
			 aBus: in STD_LOGIC_VECTOR(adrLength-1 downto 0);
			 dBus: inout STD_LOGIC_VECTOR(wordSize-1 downto 0)
		);
		end component;

		component cpu port (
			 clk, reset:    in  STD_LOGIC;
			 m_en, m_rw: out STD_LOGIC;        
			 aBus:    out STD_LOGIC_VECTOR(adrLength-1 downto 0);
			 dBus:    inout STD_LOGIC_VECTOR(wordSize-1 downto 0);
			 ledBus:    inout STD_LOGIC_VECTOR(wordSize-1 downto 0)
		);
		end component;


		signal 	 mem_en,mem_en_cpu, mem_rw,mem_rw_cpu: STD_LOGIC;
		signal    abus,abus_cpu: STD_LOGIC_VECTOR(adrLength-1 downto 0);
		signal    dbus_cpu: STD_LOGIC_VECTOR(wordSize-1 downto 0);
		signal    led_cpu: STD_LOGIC_VECTOR(wordSize-1 downto 0);

		signal    tmp_reg: STD_LOGIC_VECTOR(wordSize-1 downto 0);

begin
	

	
	 abus <= abus_cpu when mem_mux_sw = '0' else
				"0000000000"&ex_mem_addr;
	 tmp_reg <= dbus_cpu;
	 mem_en <= mem_en_cpu when mem_mux_sw = '0' else
				'1';				
	 mem_rw <= mem_rw_cpu when mem_mux_sw = '0' else
				'1';	
	led <= led_cpu(9 downto 0);

 ramC: ram1 port map(reset, mem_en, mem_rw, abus, dbus_cpu);
 cpuC: cpu port map(clk, reset, mem_en_cpu, mem_rw_cpu, abus_cpu, dbus_cpu,led_cpu);
				

 
	 	HEX0 <=	"1000000" when tmp_reg(3 downto 0) = x"0" else
					"1111001" when tmp_reg(3 downto 0) = x"1" else
					"0100100" when tmp_reg(3 downto 0) = x"2" else
					"0110000" when tmp_reg(3 downto 0) = x"3" else
					"0011001" when tmp_reg(3 downto 0) = x"4" else
					"0010010" when tmp_reg(3 downto 0) = x"5" else
					"0000010" when tmp_reg(3 downto 0) = x"6" else
					"1111000" when tmp_reg(3 downto 0) = x"7" else
					"0000000" when tmp_reg(3 downto 0) = x"8" else
					"0010000" when tmp_reg(3 downto 0) = x"9" else
					"0001000" when tmp_reg(3 downto 0) = x"a" else
					"0000011" when tmp_reg(3 downto 0) = x"b" else
					"1000110" when tmp_reg(3 downto 0) = x"c" else
					"0100001" when tmp_reg(3 downto 0) = x"d" else
					"0000110" when tmp_reg(3 downto 0) = x"e" else			
					"0001110" when tmp_reg(3 downto 0) = x"f" else
					"1111111";
					
					
	 	HEX1 <=	"1000000" when tmp_reg(7 downto 4) = x"0" else
					"1111001" when tmp_reg(7 downto 4) = x"1" else
					"0100100" when tmp_reg(7 downto 4) = x"2" else
					"0110000" when tmp_reg(7 downto 4) = x"3" else
					"0011001" when tmp_reg(7 downto 4) = x"4" else
					"0010010" when tmp_reg(7 downto 4) = x"5" else
					"0000010" when tmp_reg(7 downto 4) = x"6" else
					"1111000" when tmp_reg(7 downto 4) = x"7" else
					"0000000" when tmp_reg(7 downto 4) = x"8" else
					"0010000" when tmp_reg(7 downto 4) = x"9" else
					"0001000" when tmp_reg(7 downto 4) = x"a" else
					"0000011" when tmp_reg(7 downto 4) = x"b" else
					"1000110" when tmp_reg(7 downto 4) = x"c" else
					"0100001" when tmp_reg(7 downto 4) = x"d" else
					"0000110" when tmp_reg(7 downto 4) = x"e" else			
					"0001110" when tmp_reg(7 downto 4) = x"f" else
					"1111111";
					
	 	HEX2 <=	"1000000" when tmp_reg(11 downto 8) = x"0" else
					"1111001" when tmp_reg(11 downto 8) = x"1" else
					"0100100" when tmp_reg(11 downto 8) = x"2" else
					"0110000" when tmp_reg(11 downto 8) = x"3" else
					"0011001" when tmp_reg(11 downto 8) = x"4" else
					"0010010" when tmp_reg(11 downto 8) = x"5" else
					"0000010" when tmp_reg(11 downto 8) = x"6" else
					"1111000" when tmp_reg(11 downto 8) = x"7" else
					"0000000" when tmp_reg(11 downto 8) = x"8" else
					"0010000" when tmp_reg(11 downto 8) = x"9" else
					"0001000" when tmp_reg(11 downto 8) = x"a" else
					"0000011" when tmp_reg(11 downto 8) = x"b" else
					"1000110" when tmp_reg(11 downto 8) = x"c" else
					"0100001" when tmp_reg(11 downto 8) = x"d" else
					"0000110" when tmp_reg(11 downto 8) = x"e" else			
					"0001110" when tmp_reg(11 downto 8) = x"f" else
					"1111111";

	 	HEX3 <=	"1000000" when tmp_reg(15 downto 12) = x"0" else
					"1111001" when tmp_reg(15 downto 12) = x"1" else
					"0100100" when tmp_reg(15 downto 12) = x"2" else
					"0110000" when tmp_reg(15 downto 12) = x"3" else
					"0011001" when tmp_reg(15 downto 12) = x"4" else
					"0010010" when tmp_reg(15 downto 12) = x"5" else
					"0000010" when tmp_reg(15 downto 12) = x"6" else
					"1111000" when tmp_reg(15 downto 12) = x"7" else
					"0000000" when tmp_reg(15 downto 12) = x"8" else
					"0010000" when tmp_reg(15 downto 12) = x"9" else
					"0001000" when tmp_reg(15 downto 12) = x"a" else
					"0000011" when tmp_reg(15 downto 12) = x"b" else
					"1000110" when tmp_reg(15 downto 12) = x"c" else
					"0100001" when tmp_reg(15 downto 12) = x"d" else
					"0000110" when tmp_reg(15 downto 12) = x"e" else			
					"0001110" when tmp_reg(15 downto 12) = x"f" else
					"1111111";					
					

	 

end CPU_ON_DE0;