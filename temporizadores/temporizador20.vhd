library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T20 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           timeout : out STD_LOGIC);
end T20;

architecture ckt of T20 is
    signal count : INTEGER := 0;
    constant max_count : INTEGER := 20; -- 20 segundos para um clock de 1 Hz
begin
    timeout <= '1' when count = max_count else '0';

    count <= 0 when reset = '1' else
             count + 1 when rising_edge(clk) and enable = '1' and count < max_count else
             0 when rising_edge(clk) and enable = '1' and count = max_count else
             count;
end ckt;