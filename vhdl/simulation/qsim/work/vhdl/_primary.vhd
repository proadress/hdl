library verilog;
use verilog.vl_types.all;
entity vhdl is
    port(
        aa              : in     vl_logic_vector(3 downto 0);
        bb              : in     vl_logic_vector(3 downto 0);
        mm              : in     vl_logic;
        cii             : in     vl_logic;
        ss              : out    vl_logic_vector(3 downto 0);
        coo             : out    vl_logic
    );
end vhdl;
