library verilog;
use verilog.vl_types.all;
entity CPU_ON_DE0 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        mem_enX         : out    vl_logic;
        mem_rwX         : out    vl_logic;
        aBusX           : out    vl_logic_vector(15 downto 0);
        dBusX           : out    vl_logic_vector(15 downto 0);
        pcX             : out    vl_logic_vector(15 downto 0);
        iarX            : out    vl_logic_vector(15 downto 0);
        iregX           : out    vl_logic_vector(15 downto 0);
        accX            : out    vl_logic_vector(15 downto 0);
        aluX            : out    vl_logic_vector(15 downto 0);
        tX              : out    vl_logic_vector(2 downto 0);
        mem_mux_sw      : in     vl_logic;
        ex_mem_en       : in     vl_logic;
        ex_mem_addr     : in     vl_logic_vector(15 downto 0);
        reg_sel         : in     vl_logic_vector(1 downto 0);
        SEG_reg         : out    vl_logic_vector(15 downto 0)
    );
end CPU_ON_DE0;
