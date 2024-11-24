library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T20 is
    Port ( clkT20 : in STD_LOGIC;
           resetT20 : in STD_LOGIC;
           enableT20 : in STD_LOGIC;
           timeoutT20 : out STD_LOGIC);
end T20;

architecture ckt of T20 is
    signal countT20 : INTEGER := 0;
    constant max_countT20 : INTEGER := 20; -- 20 segundos para um clock de 1 Hz
begin
    timeoutT20 <= '1' when countT20 = max_countT20 else '0';

    countT20 <= 0 when resetT20 = '1' else
             countT20 + 1 when rising_edge(clkT20) and enableT20 = '1' and countT20 < max_countT20 else
             0 when rising_edge(clkT20) and enableT20 = '1' and countT20 = max_countT20 else
             countT20;
end ckt;
