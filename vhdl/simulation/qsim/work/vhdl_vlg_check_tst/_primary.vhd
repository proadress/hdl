library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_check_tst is
    port(
        f               : in     vl_logic_vector(15 downto 0);
        p               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end vhdl_vlg_check_tst;
