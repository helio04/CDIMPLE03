-- conversor binario para bcd

library ieee;
use ieee.std_logic_1164.all;

entity adder3 is
	port( A: in std_logic_vector(3 downto 0);
	      S: out std_logic_vector(3 downto 0));
end adder3;

architecture log of adder3 is

begin

	S(3) <= A(3) or (A(2) and A(0)) or (A(2) and A(1));
	S(2) <= (A(2) and not(A(1)) and not(A(0))) or (A(3) and A(0));
	S(1) <= (A(3) and not(A(0))) or (not(A(2)) and A(1)) or (A(1) and A(0));
	S(0) <= (A(3) and not(A(0))) or (not(A(3)) and not(A(2)) and A(0)) or (A(2) and A(1) and not(A(0)));

end log;

-- conversor bcd para decimal

library ieee;
use ieee.std_logic_1164.all;

entity Seg7 is
  port( S: in std_logic_vector (3 downto 0);
        D: out std_logic_vector (6 downto 0));
end Seg7;

architecture display_Seg7_ckt of Seg7 is
begin 
   D(0) <= not(not(S(3) or (S(1) and not(S(2))) or (S(1) and not(S(0))) or (not(S(1)) and S(2))));
   D(1) <= not(not((not(S(0)) and not(S(1))) or S(3) or (not(S(1)) and S(2)) or (not(S(0)) and not(S(3)) and S(2))));
   D(2) <= not(not((not(S(1)) and not(S(0)) and not(S(2))) or (S(1) and not(S(0)) and not(S(3)))));
   D(3) <= not(not(S(3) or (not(S(2)) and not(S(0))) or (S(1) and S(0) and not(S(2))) or (S(1) and not(S(0))) or (not(S(1)) and S(0) and S(2))));
   D(4) <= not(not(not(S(1)) or S(0) or S(2) or S(3)));
   D(5) <= not(not(S(3) or not(S(2)) or (S(1) and S(0)) or (not(S(1)) and not(S(0)))));
   D(6) <= not(not(S(1) or S(3) or (S(0) and S(2)) or (not(S(0)) and not(S(2)))));
end display_Seg7_ckt;

-- entidade top-level

library ieee;
use ieee.std_logic_1164.all;

entity conversor is 
	port( R: in std_logic_vector (5 downto 0);
	      M1: out std_logic_vector (6 downto 0);
	      M0: out std_logic_vector (6 downto 0));
end conversor;

architecture main of conversor is

	component adder3 is
		port( A: in std_logic_vector(3 downto 0);
			  S: out std_logic_vector(3 downto 0));
	end component adder3;

	component Seg7 is
	port( S: in std_logic_vector (3 downto 0);
		  D: out std_logic_vector (6 downto 0));
	end component Seg7;

	signal add0_S: std_logic_vector (3 downto 0);
	signal add1_S: std_logic_vector (3 downto 0);
	signal add2_S: std_logic_vector (3 downto 0);

begin

	add0 : adder3 port map ( A(2 downto 0) => R(5 downto 3), A(3) => '0',
							 S => add0_S);

	add1 : adder3 port map ( A(3 downto 1) => add0_S(2 downto 0), A(0) => R(2),
							 S => add1_S);

	add2 : adder3 port map ( A(3 downto 1) => add1_S(2 downto 0), A(0) => R(1),
							 S => add2_S);

	Seg7_0 : Seg7 port map ( S(3 downto 1) => add2_S(2 downto 0), S(0) => R(0),
							 D => M0);
	
	Seg7_1 : Seg7 port map ( S(3) => '0', S(2) => add0_S(3), S(1) => add1_S(3), S(0) => add2_S(3),
							 D => M1);

end main;
