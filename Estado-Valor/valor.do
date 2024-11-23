vsim work.valor_state
add wave *
force -freeze sim:/valor_state/input_values_valor_state 000001
run 50ns
force -freeze sim:/valor_state/input_values_valor_state 111111
run 50ns