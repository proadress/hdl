library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_check_tst is
    port(
        co1             : in     vl_logic;
        co2             : in     vl_logic;
        s               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end vhdl_vlg_check_tst;
