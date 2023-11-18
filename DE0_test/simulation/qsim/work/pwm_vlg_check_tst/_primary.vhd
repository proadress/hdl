library verilog;
use verilog.vl_types.all;
entity pwm_vlg_check_tst is
    port(
        led             : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end pwm_vlg_check_tst;
