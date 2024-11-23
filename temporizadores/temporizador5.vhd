library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T5 is
    Port ( clkT5 : in STD_LOGIC;
           resetT5 : in STD_LOGIC;
           enableT5 : in STD_LOGIC;
           timeoutT5 : out STD_LOGIC);
end T5;

architecture ckt of T5 is
    signal countT5 : INTEGER := 0;
    constant max_countT5 : INTEGER := 5; -- 5 segundos para um clock de 1 Hz
begin
    timeoutT5 <= '1' when countT5 = max_countT5 else '0';

    countT5 <= 0 when resetT5 = '1' else
             countT5 + 1 when rising_edge(clkT5) and enableT5 = '1' and countT5 < max_countT5 else
             0 when rising_edge(clkT5) and enableT5 = '1' and countT5 = max_countT5 else
             countT5;
end ckt;
