library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_check_tst is
    port(
        alarm           : in     vl_logic;
        q               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end vhdl_vlg_check_tst;
