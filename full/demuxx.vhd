library ieee;
use ieee.std_logic_1164.all;

entity demuxx is
    port(sel_d : in std_logic_vector(2 downto 0);
        saida_d : out std_logic_vector(5 downto 0));
end entity;

architecture papaleguas of demuxx is
signal a,b,c : std_logic;
begin
    a <= sel_d(2);
    b <= sel_d(1);
    c <= sel_d(0);
--Fechado 000 --100000 5
--Iniciando 001 --010000 4
--Valor 010 --001000 3
--Aberto 011 --000100 2
--Cancelando 100 --000010 1
--Senha 101 --000001 0
    saida_d(5) <= (not a) and (not b) and (not c);
    sauda_d(4) <= (not a) and (not b) and c;
    saida_d(3) <= (not a) and b and (not c);
    saida_d(2) <= (not a) and b and c;
    saida_d(1) <= a and (not b) and (not c);
    saida_d(0) <= a and (not b) and c;
end architecture;
     
