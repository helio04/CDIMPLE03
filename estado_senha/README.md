# ESTADO  SENHA

## Estrutura dos Arquivos

- **`estado_senha.vhd`**: Implementação do módulo que gerencia o estado "SENHA".
- **`senha_teste.do`**: Script de simulação para testar o módulo `estado_senha` no ModelSim.

---

## Descrição do Módulo `estado_senha`
#### Entradas

| Sinal            | Descrição                                   |
|-------------------|--------------------------------------------|
| `clk`            | Sinal de clock.                           |
| `reset`          | Reseta o sistema.                         |
| `Valor_Digitado` | Valor digitado pelo usuário (6 bits).      |
| `Senha_Correta`  | Senha correta (3 valores de 6 bits).       |
| `T5`             | Sinal do temporizador de 5 segundos.      |
| `T20`            | Sinal do temporizador de 20 segundos.     |

#### Saídas

| Sinal            | Descrição                                   |
|-------------------|--------------------------------------------|
| `timedout`       | Indica timeout global (20 segundos).       |
| `Tentativa_Atual`| Número da tentativa atual (2 bits).        |
| `Proximo_Estado` | Próximo estado do sistema (3 bits).        |
| `Senha_Valida`   | Indica se a senha foi validada corretamente.|

---

## Como Executar a Simulação

### 1. Abra o ModelSim

Certifique-se de que todos os arquivos necessários (`estado_senha.vhd`e `simular_estado_senha.do`) estão no mesmo diretório.

### 2. Compile os Arquivos

Compile o arquivo `estado_senha.vhd`

```tcl
vcom estado_senha.vhd      
```

### 3. Execute o Script de Simulação

Execute o script **`senha_teste.do`** para testar o módulo `estado_senha`:

```tcl
do senha_teste.do
```

### 4. Verifique os Resultados no Waveform

Após a execução, verifique os seguintes sinais no **waveform**:

- **`clk`**: O clock alternando conforme o design.
- **`reset`**: Sinal ativo durante a inicialização do sistema.
- **`T5` e `T20`**: Indicando os limites de tempo das tentativas e do processo total.
- **`Proximo_Estado`**: O estado atual do sistema.
- **`Senha_Valida`**: Indica quando a senha é validada corretamente.
- **`timedout`**: Ativado quando o tempo total excede 20 segundos.
---
## Conclusão

O módulo **`estado_senha`** é responsável por gerenciar o processo de autenticação, utilizando dois temporizadores para controlar o tempo de entrada e o tempo total permitido. A integração com `T5` e `T20` garante um comportamento síncrono e eficiente. 

Utilize o **waveform** gerado pelo ModelSim para validar o funcionamento e verificar as transições de estado, tentativas de senha e timeouts.

---
