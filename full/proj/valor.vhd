
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity valor_state is
    port (
        input_values_valor_state : in std_logic_vector(5 downto 0);
        display_system_valor_state : out std_logic_vector(5 downto 0);
        senha_state_valor_state : out std_logic_vector(5 downto 0);
        timer_5s_valor_state : out std_logic
    );
end valor_state;

architecture ckt of valor_state is
begin
    display_system_valor_state <= input_values_valor_state;
    senha_state_valor_state <= input_values_valor_state;
    timer_5s_valor_state <= '0';
end ckt;