library verilog;
use verilog.vl_types.all;
entity vhdl_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        gray_input      : in     vl_logic_vector(3 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end vhdl_vlg_sample_tst;
