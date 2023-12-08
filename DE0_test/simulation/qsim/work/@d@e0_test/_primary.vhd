library verilog;
use verilog.vl_types.all;
entity DE0_test is
    port(
        clk             : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        BOT             : in     vl_logic_vector(2 downto 0);
        LED             : out    vl_logic_vector(9 downto 0);
        HEX             : out    vl_logic_vector(6 downto 0)
    );
end DE0_test;
