# Simulação das entidades T5 e T20
vsim work.T5(ckt) work.T20(ckt)

# Forçar sinais iniciais para T5
force -freeze sim:/T5/clk 0 0, 1 500000000 -repeat 1000000000
force -freeze sim:/T5/reset 1 0, 0 100
force -freeze sim:/T5/enable 1

# Forçar sinais iniciais para T20
force -freeze sim:/T20/clk 0 0, 1 500000000 -repeat 1000000000
force -freeze sim:/T20/reset 1 0, 0 100
force -freeze sim:/T20/enable 1

# Abrir a janela de waveform para T5
add wave sim:/T5/clk
add wave sim:/T5/reset
add wave sim:/T5/enable
add wave sim:/T5/count
add wave sim:/T5/timeout

# Abrir a janela de waveform para T20
add wave sim:/T20/clk
add wave sim:/T20/reset
add wave sim:/T20/enable
add wave sim:/T20/count
add wave sim:/T20/timeout

# Executar simulação por 21 segundos (21000 ms) para observar os temporizadores de 5 e 20 segundos
run 21000ms
