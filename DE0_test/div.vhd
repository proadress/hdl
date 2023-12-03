LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY diveclk IS
    PORT (
        tozero : IN STD_LOGIC;
        clk : OUT STD_LOGIC;
        speed : IN STD_LOGIC;
        second : OUT STD_LOGIC
    );
END ENTITY diveclk;

ARCHITECTURE diveclk_arch OF diveclk IS
BEGIN
END ARCHITECTURE diveclk_arch;