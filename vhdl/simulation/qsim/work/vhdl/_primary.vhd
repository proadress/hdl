library verilog;
use verilog.vl_types.all;
entity vhdl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        updown          : in     vl_logic;
        s               : out    vl_logic_vector(7 downto 0);
        co1             : out    vl_logic;
        co2             : out    vl_logic
    );
end vhdl;
