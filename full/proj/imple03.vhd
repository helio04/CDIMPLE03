
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity imple03 is
	port(senhaentrada : in std_logic_vector(5 downto 0);
	start, addsenha : in std_logic;
	hex0, hex1 : out std_logic_vector(6 downto 0);
	ledr,ledb,ledg, outled : out std_logic);
end entity;

architecture goiaba of imple03 is
component FSM_Cofre is
	port(
	S2,S1,S0 : in std_logic;
	T5,T20 : in std_logic;
	C,S : in std_logic;
	A,L : in std_logic;
	N2,N1,N0,OutP : out std_logic
	);
end component;
component leds is
  port( N: in std_logic_vector (2 downto 0);
        R, G, B: out std_logic);
end component;
	signal entradafsm, saidafsm : std_logic_vector(2 downto 0);
	signal timer5, timer20, senhacompleta, senhaCerta : std_logic;
	signal senhadisplay : std_logic_vector(5 downto 0);
component displays is
    port ( R: in std_logic_vector (5 downto 0);
           N: in std_logic_vector (2 downto 0);
           D1: out std_logic_vector (6 downto 0);
           D0: out std_logic_vector (6 downto 0));
end component;
component T5 is
    Port ( clkT5 : in STD_LOGIC;
           resetT5 : in STD_LOGIC;
           enableT5 : in STD_LOGIC;
           timeoutT5 : out STD_LOGIC);
end component;
component T20 is
    Port ( clkT20 : in STD_LOGIC;
           resetT20 : in STD_LOGIC;
           enableT20 : in STD_LOGIC;
           timeoutT20 : out STD_LOGIC);
end component;

begin
	ledsa : leds port map(saidafsm, ledr,ledg,ledb);
	fsmc : FSM_Cofre port map(entradafsm(2), entradafsm(1), entradafsm(0),timer5, timer20, senhacompleta, senhaCerta,addsenha,start, saidafsm(2), saidafsm(1),saidafsm(0), outled);
	displaysa : displays port map(senhadisplay, saidafsm, hex1, hex0);
	end architecture;