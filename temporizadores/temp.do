# Simulação das entidades T5 e T20
vsim work.T5(ckt) work.T20(ckt)

# Forçar sinais iniciais para T5
force -freeze sim:/T5/clkT5 0 0, 1 500000000 -repeat 1000000000
force -freeze sim:/T5/resetT5 1 0, 0 100
force -freeze sim:/T5/enableT5 1

# Forçar sinais iniciais para T20
force -freeze sim:/T20/clkT20 0 0, 1 500000000 -repeat 1000000000
force -freeze sim:/T20/resetT20 1 0, 0 100
force -freeze sim:/T20/enableT20 1

# Abrir a janela de waveform para T5
add wave sim:/T5/clkT5
add wave sim:/T5/resetT5
add wave sim:/T5/enableT5
add wave sim:/T5/countT5
add wave sim:/T5/timeoutT5

# Abrir a janela de waveform para T20
add wave sim:/T20/clkT20
add wave sim:/T20/resetT20
add wave sim:/T20/enableT20
add wave sim:/T20/countT20
add wave sim:/T20/timeoutT20

# Executar simulação por 21 segundos (21000 ms) para observar os temporizadores de 5 e 20 segundos
run 21000ms
