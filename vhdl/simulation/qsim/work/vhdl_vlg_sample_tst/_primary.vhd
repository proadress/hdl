library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_sample_tst is
    port(
        d               : in     vl_logic;
        en              : in     vl_logic;
        s               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end vhdl_vlg_sample_tst;
