library verilog;
use verilog.vl_types.all;
entity DE0_test_vlg_check_tst is
    port(
        HEX             : in     vl_logic_vector(6 downto 0);
        LED             : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end DE0_test_vlg_check_tst;
