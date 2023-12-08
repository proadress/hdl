library verilog;
use verilog.vl_types.all;
entity CPU_ON_DE0_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ex_mem_addr     : in     vl_logic_vector(15 downto 0);
        ex_mem_en       : in     vl_logic;
        mem_mux_sw      : in     vl_logic;
        reg_sel         : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_ON_DE0_vlg_sample_tst;
