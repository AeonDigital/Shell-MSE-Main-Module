# Synopsis

Manual para testes da função `mse_man`.



&nbsp;

# Description

Na sequencia vários parâmetros serão definidos apenas para fins de teste e não
devem ser observados do ponto de vista lógico.



&nbsp;
    
# Parameters

Descrição prévia sobre os parâmetros a serem usados.
Eventualmente esta descrição pode ser maior que o comum.

Isto comumente não terá qualquer conteúdo pois na imensa parte das funções não 
é preciso expor alguma informação extra aqui que não possa estar na descrição
da própria função, relacionada diretamente a algum parâmetro ou em uma seção 
própria para o mesmo.


## !bool alpha

- aka       : -a --alpha
- default   : MSE_NULL
- hint      :  
  Definição simples de um parametro booleano que também é `nullable`.


&nbsp;

## int beta

- aka       : -b --beta
- default   : 0
- min       : -10
- max       : 10
- hint      :
  Parametro que recebe um valor inteiro entre -10 e 10.

Em caso de valor vazio ou inválido, usará `0` como o valor padrão.


&nbsp;

## int gama

- aka       : -g --gama
- options   : 
  - 0 : c c++
  - 1 : rust
  - 2 : cobol
  - 3 : clipper
- hint      :
  Parametro que possui uma lista fechada de opções válidas.

Internamente apenas o valor `chave` será usado mas quando usar o autocomplete 
do MSE o usuário pode selecionar o valor correspondente usando um dos labels
associados ao mesmo.

Neste caso a lista é avaliada de forma case-insensitive, ou seja:
- C = c
- Rust = rust = RUST


&nbsp;

## char delta

- aka       : -d --delta
- options cs:
  - o: output
  - O: open
- hint      :
  Outra lista fechada de opções válidas.

Neste caso ocorre avaliação case-sensitive dos valores digitados pelo usuário e
ele precisa digitar um valor que case precisamente com um valor `chave` ou com 
um dos `labels` correspondentes.



&nbsp;

## string epsilon

- aka       : -e --epsilon
- default   : synopsis
- list      :
  - synopsis
  - description
  - parameters
  - returns
  - example
  - dependencies
- hint      :
  Define uma lista fechada de opções dentre as quais o usuário pode selecionar 
  um ou mais itens (separados por espaços).

Se desejar, o usuário pode selecionar todos os itens passando como valor o 
caracter `.`.



&nbsp;

## string zeta

- aka       : -z --zeta
- list op   :
  - add
  - sub
  - mul
  - div
- hint      :
  Define uma lista aberta de opções dentre as quais o usuário pode selecionar 
  um ou mais itens, ou ainda incluir opções próprias.

Se desejar, o usuário pode selecionar todos os itens oferecidos pela lista e 
ainda adicionar o seu próprio usando por exemplo: `. mod sqrt`



&nbsp;

# Examples

Nesta seção podemos definir uma demonstração do uso de nossa função. É 
interessante para casos complexos ou explicações que a demonstração prática é 
mais rápida que a leitura do próprio manual.

``` sh
  # Example 01
  > mse_my_function -b 5 --gama RUST --delta output --zeta ". sqrt"
  # Returns :
  > I like RUST especially to do the operations : add sub mul div and sqrt.
```



&nbsp;

# Returns string|assoc

Normalmente apenas definir o tipo de retorno é suficiente mas se necessário é 
possível agregar informações neste espaço explicando o que é esperado de 
retorno conforme o tipo de processamento definido nos parametros.

É especialmente útil para casos de retornos múltiplos ou quando `void` efetua 
uma ação que não é `printavel`.



&nbsp;

# Dependencies

- printf
- sed
- awk



&nbsp;

# Extra section

Caso as seções anteriores não sejam suficientes para expressar tudo o que você 
precisa expor sobre sua função é possível definir seções extras para adicionar 
conteúdo que julgar necessário.