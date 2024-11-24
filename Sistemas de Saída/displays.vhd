library ieee;
use ieee.std_logic_1164.all;

entity displays is
    port ( R: in std_logic_vector (5 downto 0);
           N: in std_logic_vector (2 downto 0);
           D1: out std_logic_vector (6 downto 0);
           D0: out std_logic_vector (6 downto 0));
end displays;

architecture main of displays is
    
    component conversor is
        port( R: in std_logic_vector (5 downto 0);
	          M1: out std_logic_vector (6 downto 0);
	          M0: out std_logic_vector (6 downto 0));
    end component conversor;

    component mux_4x1 is
        port( C3, C2, C1, C0: in std_logic_vector(6 downto 0);
              N: in std_logic_vector (2 downto 0);
              Z: out std_logic_vector (6 downto 0));
    end component mux_4x1;

    signal conv_M1, conv_M0 : std_logic_vector(6 downto 0);

begin
    
    conv : conversor port map( R => R,
                               M1 => conv_M1,
                               M0 => conv_M0);

    mux1 : mux_4x1 port map( C3 => "0000000", C2 => conv_M1, C1 => "1000000", C0 => "1001001",
                             N => N,
                             Z => D1);

    mux0 : mux_4x1 port map( C3 => "0000000", C2 => conv_M0, C1 => "1000000", C0 => "1001001",
                             N => N,
                             Z => D0);
    
end architecture main;
