library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_freq_5 is
	port(
			clk:in std_logic;
			F:out std_logic
	);
end div_freq_5;

architecture div_freq_5 of div_freq_5 is
signal cnt:std_logic_vector(2 downto 0);
begin

	process(clk)
	begin
		if clk'event and clk = '1' then
			if cnt = "100" then
				cnt <= "000";
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;

	F <= '1' when cnt >= 0 and cnt < 2 else
			clk when cnt = 2 else
			'0';


end div_freq_5;	