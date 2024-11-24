vsim work.estado_senha

# Gerar estímulos para o DUT
force /estado_senha/reset 1 0 , 0 20
force /estado_senha/clk 0 0 , 1 10 -repeat 20  

# Testar sequência de valores digitados
force /estado_senha/Senha_Correta "000001001010110011" 0   

# Primeira tentativa (valor correto)
force /estado_senha/Valor_Digitado "000001" 40  
force /estado_senha/T5 0 0 , 1 10 -repeat 20           

# Segunda tentativa (valor correto)
force /estado_senha/Valor_Digitado "101010" 80  
force /estado_senha/T5 0 0 , 1 10 -repeat 20        

# Terceira tentativa (valor correto)
force /estado_senha/Valor_Digitado "110011" 120 
force /estado_senha/T5 0 0 , 1 10 -repeat 20 

# Teste de falha (valor incorreto)
force /estado_senha/reset 1 200 , 0 220       
force /estado_senha/Valor_Digitado "000010" 240  
force /estado_senha/T5 0 0 , 1 10 -repeat 20           

add wave -position insertpoint \
    /estado_senha/clk \
    /estado_senha/reset \
    /estado_senha/Valor_Digitado \
    /estado_senha/Senha_Correta \
    /estado_senha/T5 \
    /estado_senha/Tentativa_Atual \
    /estado_senha/Proximo_Estado \
    /estado_senha/Senha_Valida \
    /estado_senha/SAMA_Internal \
    /estado_senha/Tentativa_Count \
    /estado_senha/Comparacao \
    /estado_senha/Segmento_Senha

# Rodar a simulação por 300 ns
run 300 ns