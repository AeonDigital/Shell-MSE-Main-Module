# Synopsis

Manual para testes da função `mse_man`.

Segue um conteúdo **teste** contendo _marcações_ diversas para testar uma função pré formatadora de coloração [link text](http://target.url).


&nbsp;

# Description

Na sequencia vários parâmetros serão definidos apenas para fins de teste e não
devem ser observados do ponto de vista lógico.


&nbsp;
    
# Parameters

Este ___primeiro parágrafo___ de conteúdo é o ***sumário*** relacionado à esta 
seção. No caso, estamos lidando com a definição de __*parâmetros da função*__.  
As linhas acima, ao serem compiladas, serão unidas em uma mesma linha pois não 
há indicativo no **_MarkDown_** que elas devem ficar diferentes. A partir delas 
ocorre uma quebra de linha causada pelos 2 espaços que estão ao final da 
segunda linha.  
Toda esta parte foi também usada para testar a correta identificação da 
marcação dos estilos ***bold e itálico aninhados***.

A partir da primeira linha vazia, o texto que vem abaixo __como o deste 
parágrafo__ será tratado como sendo a parte destinada a uma **descrição** 
referente à respectiva seção.  
A descrição pode contar com _várias linhas_ pois seu objetivo é justamente 
abranger uma quantidade de informações satisfatórias para cobrir tal tópico.

Novos paragrafos podem ser adicionados bastando para isto deixar uma *linha em 
branco* entre cada qual.



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