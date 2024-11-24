library ieee;
use ieee.std_logic_1164.all;

entity FSM_Cofre is
	port(
	S2,S1,S0 : in std_logic;
	T5,T20 : in std_logic;
	C,S : in std_logic;
	A,L : in std_logic;
	N2,N1,N0,OutP : out std_logic
	);
end FSM_Cofre;

architecture main of FSM_Cofre is


component registrador_estado is
	port(
	inR : in std_logic_vector( 2 downto 0);
	clk : in std_logic;
	outR : out std_logic_vector( 2 downto 0)
	);
end component;

begin 
	N2<= (not S2 AND s1 AND not S0 AND L) OR (not S2 AND S1 AND not S0 AND NOT L AND A) OR (S2 AND not S1 AND not S0 AND NOT T5) OR(S2 AND not S1 AND S0 AND not T5);
	N1<= (not S2 AND not S1 AND S0 AND T5) OR (not S2 AND S1 AND not S0 AND not L AND not A)OR (not S2 AND S1 AND S0 AND not T20) OR (S2 AND not S1 AND S0 AND T5 AND not C) OR (S2 AND not S1 AND S0 AND T5 AND C AND S);
	N0<= (not S2 AND not S1 AND not S0 AND L)OR(not S2 AND not S1 AND S0 AND not T5)OR(not S2 AND S1 AND not S0 AND not L AND A)OR(not S2 AND S1 AND S0 AND not T20)OR(S2 AND not S1 AND S0 AND not T5)OR(S2 AND not S1 AND S0 AND T5 AND C AND S);
	OutP<= (not S2 AND S1 AND S0 AND not T20)OR(S2 AND not S1 AND S0 AND T5 AND C AND S);
	
	

		  
end main;