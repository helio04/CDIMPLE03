library ieee;
use ieee.std_logic_1164.all; 

-- filtro de estados

entity filtro_de_estados is
  port( N: in std_logic_vector(2 downto 0);
        F: out std_logic_vector (1 downto 0));
end filtro_de_estados;

architecture main of filtro_de_estados is
begin 
   F(1) <= (not(N(2)) and N(1) and N(0)) or (N(2) and not(N(1)) and not(N(0)));
   F(0) <= (not(N(2)) and N(1) and not(N(0))) or (N(2) and not(N(1)));
end architecture;

library ieee;
use ieee.std_logic_1164.all; 

-- mux 4x1 com os canais C e os seletores F
 
entity mux_4x1 is
 port( C3, C2, C1, C0: in std_logic_vector(6 downto 0);
       N: in std_logic_vector (2 downto 0);
       Z: out std_logic_vector (6 downto 0));
end mux_4x1;
 
architecture main of mux_4x1 is
signal F1: std_logic;
signal F0: std_logic;

component filtro_de_estados is
  port( N: in std_logic_vector (2 downto 0);
        F: out std_logic_vector (1 downto 0));
end component;

begin

seletor: filtro_de_estados port map(F(1) => F1, F(0) => F0, N => N);
 
	muxx: for k in 0 to 6 generate
		Z(k) <= (C3(k) and not(F1) and not(F0)) or
			     (C2(k) and not(F1) and F0) or
			     (C1(k) and F1 and not(F0)) or
			     (C0(k) and F1 and F0);
	end generate muxx;
  
end architecture;
