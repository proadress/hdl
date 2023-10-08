LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY alu IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        c : IN STD_LOGIC;
        fun : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        co : OUT STD_LOGIC
    );
END alu;

ARCHITECTURE alu_a OF alu IS

    SIGNAL temp : STD_LOGIC_VECTOR(8 DOWNTO 0);

BEGIN
    temp <= ('0' & a) + b + c WHEN fun = "00"ELSE
        ('0' & a) - b - c WHEN fun = "01"ELSE
        '0' & (a AND b) WHEN fun = "10"ELSE
        '0' & (a OR b);
    s <= temp (7 DOWNTO 0);
    co <= temp(8);
END alu_a;