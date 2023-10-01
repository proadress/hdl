library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_sample_tst is
    port(
        aa              : in     vl_logic_vector(3 downto 0);
        bb              : in     vl_logic_vector(3 downto 0);
        cii             : in     vl_logic;
        mm              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end vhdl_vlg_sample_tst;
