-- ram1.vhd --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.commonConstants.all;

entity ram1 is port (
        reset, en, r_w: in STD_LOGIC;
        aBus: in STD_LOGIC_VECTOR(adrLength-1 downto 0);
        dBus: inout STD_LOGIC_VECTOR(wordSize-1 downto 0)
		  );
end ram1;

architecture ram1Arch of ram1 is
constant resAdrLength: integer := 6; -- address length restricted within architecture
constant memSize: integer := 2**resAdrLength;
type ram_typ is array(0 to memSize-1) of STD_LOGIC_VECTOR(wordSize-1 downto 0);
signal ram: ram_typ;
begin


    process(reset, en, r_w)
	 begin
          if reset = '0' then
                  -- basic instruction check
                ram(0)  <= x"1000"; -- immediate load, load #0
                ram(1)  <= x"4030"; -- direct store, dstore M[30]
                ram(2)  <= x"100a"; -- immediate load, load #a
                ram(3)  <= x"4031"; -- direct store, dstore M[31] 
                ram(4)  <= x"2030"; -- direct load,  dload M[30]
                ram(5)  <= x"a031"; -- add,  add M[31]
                ram(6)  <= x"4030"; -- direct store, dstore M[30]
                ram(7)  <= x"1001"; -- immediate load, load #1
                ram(8)  <= x"0001"; -- negate,    acc = -acc
                ram(9)  <= x"a031"; -- add, add M31]
                ram(10)  <= x"700c"; -- branch zero, brZero M[c]
                ram(11)  <= x"6003"; -- branch, br M[3]					 
                ram(12)  <= x"0000"; -- halt
                ram(13)  <= x"b030"; -- print M[30]
	
                
         elsif en = '1' and r_w = '0' then
              ram(conv_integer(unsigned(aBus(resAdrLength-1 downto 0)))) <= dBus;
        end if;
    end process;
    dBus <= ram(conv_integer(unsigned(aBus(resAdrLength-1 downto 0))))
              when reset = '1' and en = '1' and r_w = '1' else
            (dbus'range => 'Z');
end ram1Arch;