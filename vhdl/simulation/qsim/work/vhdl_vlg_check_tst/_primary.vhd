library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_check_tst is
    port(
        q               : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end vhdl_vlg_check_tst;
