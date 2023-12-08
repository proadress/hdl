library verilog;
use verilog.vl_types.all;
entity DE0_test_vlg_sample_tst is
    port(
        BOT             : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end DE0_test_vlg_sample_tst;
