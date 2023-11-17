library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_check_tst is
    port(
        binary_output   : in     vl_logic_vector(3 downto 0);
        binary_outputp  : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end vhdl_vlg_check_tst;
