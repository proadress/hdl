library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DE0_test is
	port(
			clk:in std_logic;
			SW:in std_logic_vector(9 downto 0);
			BOT:in std_logic_vector(2 downto 0);
			LED:out std_logic_vector(9 downto 0);
			HEX:out std_logic_vector(6 downto 0)
			);
end DE0_test;

architecture DE0_test of DE0_test is
signal cnt:std_logic_vector(25 downto 0);
signal clk1HZ:std_logic;
signal tmp:std_logic_vector(3 downto 0);
begin

	process(clk)
	begin
			if clk'event and clk = '1' then
				if cnt = "10111110101111000001111111" then --49999999
					cnt <= (others => '0');
				else
					cnt <= cnt + 1;
				end if;
			end if;
		end process;	
		
	clk1HZ <= cnt(25);	---1HZ
	
	process(clk1HZ,BOT(0))
	begin
		if BOT(0) = '0' then
			tmp <= "0000";
		elsif clk1HZ'event and clk1HZ = '1' then
			if tmp =  "1001" then
				tmp <= "0000";
			else
				tmp <= tmp + 1;
			end if;
		end if;
	end process;
	
	
	HEX <= "1000000" when tmp = x"0" else
	       "1111001" when tmp = x"1" else
			 "0100100" when tmp = x"2" else
			 "0110000" when tmp = x"3" else
			 "0011001" when tmp = x"4" else
			 "0010010" when tmp = x"5" else
			 "0000010" when tmp = x"6" else
			 "1111000" when tmp = x"7" else
			 "0000000" when tmp = x"8" else
			 "0010000" when tmp = x"9" else
			 "1111111";
			 

	

	LED <= "1111111111" when BOT(0) = '0' else
			 "1010101010" when BOT(1) = '0' else
			 "0101010101" when BOT(2) = '0' else
			SW;	

end DE0_test;

			
	