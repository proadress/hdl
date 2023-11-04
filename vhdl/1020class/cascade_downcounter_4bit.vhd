library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cascade_downcounter_4bit is
	port(
			clk:in std_logic;
			reset:in std_logic;
			casin:in std_logic;
			casout:out std_logic;
			Q:out std_logic_vector(3 downto 0)
			);
end cascade_downcounter_4bit;

architecture cascade_downcounter_4bit of cascade_downcounter_4bit is
signal cnt:std_logic_vector(3 downto 0);
begin
	process(clk,reset)
	begin
		if reset = '0' then 
			cnt <= "0000";
		elsif clk'event and clk = '1' then
			if casin ='1' then
				cnt <= cnt - 1;
			end if;	
		end if;
	end process;
	
	Q <= cnt;
	
	casout <= '1' when casin ='1' and cnt = "0000" else
				 '0';

	



end cascade_downcounter_4bit;