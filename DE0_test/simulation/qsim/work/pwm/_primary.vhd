library verilog;
use verilog.vl_types.all;
entity pwm is
    port(
        clk             : in     vl_logic;
        sw              : in     vl_logic_vector(9 downto 0);
        led             : out    vl_logic_vector(9 downto 0)
    );
end pwm;
