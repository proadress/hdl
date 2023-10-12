library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity up_down_counter_0_12 is
	port(
			clk:in std_logic;
			reset:in std_logic;
			up_down:in std_logic;
			Q:out std_logic_vector(3 downto 0)
	);
end up_down_counter_0_12;
architecture up_down_counter_0_12 of up_down_counter_0_12 is
	signal cnt:std_logic_vector(3 downto 0);
begin

   Q <= cnt;	
	
	process(clk,reset)
	begin	
			if reset = '0' then
				cnt <= (others => '0');
			elsif clk'event and clk = '1' then
				if up_down = '0' then
					if cnt = "1100" then
						cnt <= "0000";
					else	
						cnt <= cnt + 1;
					end if;	
				else
					if cnt = "0000" then 
						cnt <= "1100";
					else	
						cnt <= cnt - 1;
					end if;	
				end if;
			end if;
		end process;
	
	

end up_down_counter_0_12;