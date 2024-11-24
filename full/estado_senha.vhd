library ieee;
use ieee.std_logic_1164.all;

entity estado_senha is
    port (
        clk, reset, T5    : in  std_logic;      
        Valor_Digitado    : in  std_logic_vector(5 downto 0);
        Senha_Correta     : in  std_logic_vector(17 downto 0);
        Tentativa_Atual   : out std_logic_vector(1 downto 0); 
        Proximo_Estado    : out std_logic_vector(2 downto 0);
        Senha_Valida      : out std_logic 
    );
end estado_senha;

architecture Behavioral of estado_senha is
    signal SAMA_Internal : std_logic_vector(2 downto 0) := "000"; 
    signal Tentativa_Count : std_logic_vector(1 downto 0) := "00";
    signal Comparacao : std_logic; 
    signal Segmento_Senha : std_logic_vector(5 downto 0); 
begin

    -- Seleção do segmento da senha baseado na tentativa atual
    Segmento_Senha <= Senha_Correta(17 downto 12) when Tentativa_Count = "00" else
                      Senha_Correta(11 downto 6)  when Tentativa_Count = "01" else
                      Senha_Correta(5 downto 0)   when Tentativa_Count = "10" else
                      (others => '0'); -- Evita o latch

    -- Comparação do valor digitado com o segmento atual
    Comparacao <= '1' when Valor_Digitado = Segmento_Senha else '0';

    -- Atualização do registrador SAMA 
    SAMA_Internal <= "000" when reset = '1' else                   
                     SAMA_Internal when T5 = '0' else               
                     (SAMA_Internal(1 downto 0) & Comparacao);      

    -- Atualização do contador de tentativas (sem '+')
    Tentativa_Count <= "00" when reset = '1' else                     
                       Tentativa_Count when T5 = '0' else            
                       "01" when Tentativa_Count = "00" else          
                       "10" when Tentativa_Count = "01" else         
                       "10";                                         

    -- Determinação do próximo estado
    Proximo_Estado <= "000" when reset = '1' else                     
                      "011" when SAMA_Internal = "111" else           
                      "000" when Tentativa_Count = "10" else          
                      "010";                                         

    -- Sinalização de senha válida
    Senha_Valida <= '1' when SAMA_Internal = "111" else '0';

    -- Saída do número da tentativa atual
    Tentativa_Atual <= Tentativa_Count;

end Behavioral;
