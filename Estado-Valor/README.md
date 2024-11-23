# Projeto Valor State

Este projeto VHDL simula um sistema simples que recebe um vetor de entrada de 6 bits e o exibe em dois sinais de saída. Além disso, possui um temporizador de 5 segundos.

## Arquivos

- `valor.vhd`: Contém a descrição VHDL da entidade `valor_state`.
- `valor.do`: Script de simulação para ModelSim.

## Simulação

O script `valor.do` realiza a simulação da entidade `valor_state`, forçando o sinal `input_values` a `000001` por 50 nanosegundos e depois a `111111` por mais 50 nanosegundos. As ondas são adicionadas ao visualizador para observação.

## Como usar

1. Abra o ModelSim.
2. Compile o arquivo `valor.vhd` com o comando:

    ```tcl
    vcom valor.vhd
    ```

3. Execute o script `valor.do` com o comando:

    ```tcl
    do valor.do
    ```

## Descrição do Estado Valor

O estado valor é definido como a distribuição dos valores inseridos para o sistema de displays e para o estado senha. Nele também fazemos o clear do timer de 5 segundos para que este não seja efetuado neste estado. O clear está associado ao enable do temporizador.
