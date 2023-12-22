-- cpu.vhd --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.commonConstants.all;

entity cpu is port (
    clk, reset     : in  std_logic;
    m_en, m_rw    : out std_logic;        
    aBus        : out std_logic_vector(adrLength-1 downto 0);
    dBus        : inout std_logic_vector(wordSize-1 downto 0);
	ledBus        : out std_logic_vector(wordSize-1 downto 0);
	swin        : in std_logic_vector(5 downto 0)
		 );
end cpu;

architecture cpuArch of cpu is
type state_type is (
    reset_state, fetch, halt, negate, mload, dload, iload,
    dstore, istore, branch, brZero, brPos, brNeg, add,outp,sw
);
signal state: state_type;

type tick_type is (t0, t1, t2, t3, t4, t5, t6, t7);
signal tick: tick_type;

signal pc:     std_logic_vector(adrLength-1 downto 0); -- program counter
signal iReg:     std_logic_vector(wordSize-1 downto 0); -- instruction register
signal iar:     std_logic_vector(adrLength-1 downto 0); -- indirect address register
signal acc:     std_logic_vector(wordSize-1 downto 0); -- accumulator
signal alu:     std_logic_vector(wordSize-1 downto 0); -- alu output

begin
    alu <=     (not acc) + x"0001" when state = negate else
                acc + dbus when state = add else
                (alu'range => '0');
					 
			 

    process(clk) -- perform actions that occur on rising clock edges

			 function nextTick(tick: tick_type) return tick_type is begin
				  -- return next logical value for tick
				  case tick is
				  when t0 => return t1; when t1 => return t2; when t2 => return t3;
				  when t3 => return t4; when t4 => return t5; when t5 => return t6;
				  when t6 => return t7; when others => return t0;
				  end case;
			 end function nextTick;

			 procedure decode is begin
				  -- Instruction decoding.
				  case iReg(15 downto 12) is
				  when x"0" =>
						if iReg(11 downto 0) = x"000" then 
							 state <= halt;
						elsif iReg(11 downto 0) = x"001" then 
							 state <= negate;
						end if;
				  when x"1" =>     state <= mload;
				  when x"2" =>     state <= dload;
				  when x"3" =>     state <= iload;
				  when x"4" =>     state <= dstore;
				  when x"5" =>     state <= istore;
				  when x"6" =>     state <= branch;
				  when x"7" =>     state <= brZero;    
				  when x"8" =>     state <= brPos;
				  when x"9" =>     state <= brNeg;
				  when x"a" =>     state <= add;
				  when x"b" =>     state <= outp;
				  when x"c" =>     state <= sw;
				  when others => state <= halt;
				  end case;
			 end procedure decode;

			 procedure wrapup is begin
				  -- Do this at end of every instruction
				  state <= fetch; tick <= t0;
			 end procedure wrapup;

    begin
          if clk'event and clk = '1' then
              if reset = '0' then 
                state <= reset_state; tick <= t0;
                pc <= (pc'range => '0'); iReg <= (iReg'range => '0');
                acc <= (acc'range => '0'); iar <= (iar'range => '0');
              else
                tick <= nextTick(tick) ; -- advance time by default
                case state is
						when reset_state => state <= fetch; tick <= t0;

						when fetch =>     if tick = t1 then iReg <= dBus; end if;
												if tick = t2 then 
														decode; pc <= pc + '1'; tick <= t0;
												end if;
						when halt => tick <= t0; -- do nothing

						when negate => acc <= alu;    wrapup;

						-- load instructions
						when mload => 
							if iReg(11) = '0' then -- sign extension
								acc <= x"0" & ireg(11 downto 0); 
							else
								acc <= x"f" & ireg(11 downto 0);
							end if;
							wrapup;

						when dload =>
							if tick = t1 then acc <= dBus; end if;
							if tick = t2 then wrapup; end if;

						when iload =>
							if tick = t1 then iar <= dBus; end if;
							if tick = t4 then acc <= dBus; end if;
							if tick = t5 then wrapup; end if;

						-- store instructions                  
						when dstore =>
							if tick = t4 then wrapup; end if;

						when istore =>
							if tick = t1 then iar <= dBus; end if;
							if tick = t7 then wrapup; end if;

						-- branch instructions
						when branch => 
							pc <= x"0" & iReg(11 downto 0);
							wrapup;
						when brZero => 
							if acc = x"0000" then pc <= x"0" & iReg(11 downto 0);    end if;
							wrapup;
						when brPos => 
							if acc(15) = '0' and acc /= x"0000" then 
								pc <= x"0" & iReg(11 downto 0);
							end if;
							wrapup;
						when brNeg => 
							if acc(15) = '1' then pc <= x"0" & iReg(11 downto 0);    end if;
							wrapup;

						-- arithmetic instructions
						when add =>
							if tick = t1 then acc <= alu; end if;
							if tick = t2 then wrapup; end if;
						
						when outp =>
							if tick = t1 then ledBus <= dBus; end if;
							if tick = t2 then wrapup; end if;

						when sw => 
							acc <= "00000000" & swin & "01"; 
							wrapup;
						 
						when others => state <= halt;
                end case;
            end if;
          end if;
    end process;

    process(clk) begin -- perform actions that occur on falling clock edges
        if clk'event and clk ='0' then
            if reset = '0' then
                m_en <= '0'; m_rw <= '1';
                aBus <= (aBus'range => '0'); dBus <= (dBus'range => 'Z');
            else
                case state is

						when fetch =>
							if tick = t0 then m_en <= '1'; aBus <= pc; end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;

						when dload =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;

						when iload =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;
							if tick = t3 then m_en <= '1'; aBus <= iar; end if;
							if tick = t5 then m_en <= '0'; aBus <= (abus'range => '0'); end if;

						when dstore =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t1 then m_rw <= '0'; dBus <= acc; end if;
							if tick = t3 then m_rw <= '1'; end if;
							if tick = t4 then 
								m_en <= '0'; aBus <= (abus'range => '0'); dBus <= (dBus'range => 'Z'); 
							end if;

						when istore =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;
							if tick = t3 then m_en <= '1'; aBus <= iar; end if;
							if tick = t4 then m_rw <= '0'; dBus <= acc; end if;
							if tick = t6 then m_rw <= '1'; end if;
							if tick = t7 then 
								m_en <= '0'; aBus <= (abus'range => '0'); dBus <= (dBus'range => 'Z'); 
							end if;

						when add =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;
						
						when outp =>
							if tick = t0 then m_en <= '1'; aBus <= x"0" & iReg(11 downto 0); end if;
							if tick = t2 then m_en <= '0'; aBus <= (aBus'range => '0'); end if;


						when others => -- do nothing
					end case;
            end if;    
        end if;                    
    end process;
end cpuArch;