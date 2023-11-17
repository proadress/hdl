library verilog;
use verilog.vl_types.all;
entity vhdl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        gray_input      : in     vl_logic_vector(3 downto 0);
        binary_output   : out    vl_logic_vector(3 downto 0);
        binary_outputp  : out    vl_logic_vector(3 downto 0)
    );
end vhdl;
