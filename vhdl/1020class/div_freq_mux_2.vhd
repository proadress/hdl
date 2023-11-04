library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_freq_mux_2 is
	port(
			clk:in std_logic;
			S:in std_logic_vector(1 downto 0);
			F:out std_logic
	);
end div_freq_mux_2;

architecture div_freq_mux_2 of div_freq_mux_2 is
signal cnt:std_logic_vector(2 downto 0);
signal f4,f5,f6,f7:std_logic;
begin
	process(clk)
	begin
			if clk'event and clk = '1' then
				if S = "00" then  --div 4
						if cnt >= "011" then
							cnt <= "000";
						else
							cnt <= cnt + 1;
						end if;
				elsif S = "01" then  --div 5
						if cnt >= "100" then
							cnt <= "000";
						else
							cnt <= cnt + 1;
						end if;
				elsif S = "10" then  --div 6
						if cnt >= "101" then
							cnt <= "000";
						else
							cnt <= cnt + 1;
						end if;
				else                -- div 7
						if cnt >= "110" then
							cnt <= "000";
						else
							cnt <= cnt + 1;
						end if;	
				end if;
			end if;
		end process;
	
		f4 <= '1' when cnt >=0 and cnt <2 else
				'0';
				
		f5 <= '1' when cnt >=0 and cnt <2 else
				clk when cnt = 2 else	
				'0';
				
		f6 <= '1' when cnt >=0 and cnt <3 else
				'0';
				
		f7 <= '1' when cnt >=0 and cnt <3 else
				clk when cnt = 3 else	
				'0';				
					
	  F <=  f4  when S = "00" else
			  f5  when S = "01" else
			  f6  when S = "10" else
			  f7;
	


end div_freq_mux_2;	