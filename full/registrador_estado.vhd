library ieee;
use ieee.std_logic_1164.all;

entity registrador_estado is
	port(
	inR : in std_logic_vector( 2 downto 0);
	clk : in std_logic;
	outR : out std_logic_vector( 2 downto 0)
	);
end registrador_estado;

architecture main of registrador_estado is
component  ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

signal Clear,Setar : std_logic_vector(2 downto 0);
begin

ffd1 : ffd
	port map(
	ck =>clk,
	clr => Clear(0),
	set=>Setar(0),
	d =>inR(0),
	q =>outR(0)
	
	);
	
ffd2 : ffd
	port map(
	ck =>clk,
	clr => Clear(1),
	set=>Setar(1),
	d =>inR(1),
	q =>outR(1)
	
	);

ffd3 : ffd
	port map(
	ck =>clk,
	clr => Clear(2),
	set=>Setar(2),
	d =>inR(2),
	q =>outR(2)
	
	);
	



end main;