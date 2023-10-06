library verilog;
use verilog.vl_types.all;
entity vhdl is
    port(
        d               : in     vl_logic;
        s               : in     vl_logic_vector(3 downto 0);
        en              : in     vl_logic;
        f               : out    vl_logic_vector(15 downto 0);
        p               : out    vl_logic_vector(3 downto 0)
    );
end vhdl;
