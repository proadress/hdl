library verilog;
use verilog.vl_types.all;
entity CPU_ON_DE0_vlg_check_tst is
    port(
        aBusX           : in     vl_logic_vector(15 downto 0);
        accX            : in     vl_logic_vector(15 downto 0);
        aluX            : in     vl_logic_vector(15 downto 0);
        dBusX           : in     vl_logic_vector(15 downto 0);
        iarX            : in     vl_logic_vector(15 downto 0);
        iregX           : in     vl_logic_vector(15 downto 0);
        mem_enX         : in     vl_logic;
        mem_rwX         : in     vl_logic;
        pcX             : in     vl_logic_vector(15 downto 0);
        SEG_reg         : in     vl_logic_vector(15 downto 0);
        tX              : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end CPU_ON_DE0_vlg_check_tst;
