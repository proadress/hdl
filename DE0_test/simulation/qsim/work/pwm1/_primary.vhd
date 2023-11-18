library verilog;
use verilog.vl_types.all;
entity pwm1 is
    port(
        clk             : in     vl_logic;
        sw              : out    vl_logic_vector(9 downto 0);
        led             : out    vl_logic_vector(9 downto 0)
    );
end pwm1;
