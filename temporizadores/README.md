# Temporizadores T5 e T20

Este projeto contém dois temporizadores em VHDL, `T5` e `T20`, que contam 5 segundos e 20 segundos, respectivamente, usando um clock de 1 Hz.

## Estrutura dos Arquivos

- `temporizador5.vhd`: Implementação do temporizador `T5` que conta 5 segundos.
- `temporizador20.vhd`: Implementação do temporizador `T20` que conta 20 segundos.
- `temp.do`: Script de simulação para ModelSim que executa e visualiza os temporizadores `T5` e `T20`.

## Descrição dos Temporizadores

### T5

O temporizador `T5` conta 5 segundos quando habilitado (`enable = '1'`). Ele possui os seguintes sinais:

- `clk`: Sinal de clock de entrada (1 Hz).
- `reset`: Sinal de reset de entrada.
- `enable`: Sinal de habilitação de entrada.
- `timeout`: Sinal de saída que indica quando o temporizador atinge 5 segundos.

### T20

O temporizador `T20` conta 20 segundos quando habilitado (`enable = '1'`). Ele possui os seguintes sinais:

- `clk`: Sinal de clock de entrada (1 Hz).
- `reset`: Sinal de reset de entrada.
- `enable`: Sinal de habilitação de entrada.
- `timeout`: Sinal de saída que indica quando o temporizador atinge 20 segundos.

## Como Executar a Simulação

1. Abra o ModelSim.
2. Compile os arquivos VHDL:

    ```tcl
    vcom temporizador5.vhd
    vcom temporizador20.vhd
    ```

3. Execute o script de simulação:

    ```tcl
    do temp.do
    ```
