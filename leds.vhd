library ieee;
use ieee.std_logic_1164.all;

-- lógica combinacional dos leds

entity leds is
  port( N: in std_logic_vector (2 downto 0);
        R, G, B: out std_logic);
end leds;

architecture saida_leds of leds is
begin 
   R <= not(N(2)) and not(N(0));
   G <= N(1) and N(0);
   B <=  (N(2)) or (not(N(1)) and N(0)); 
end saida_leds;
