# Synopsis

Escreve uma ou mais linhas de dados no arquivo alvo na posição indicada.



&nbsp;

# Parameters

## file file

- aka       : -f --file
- hint      :  
  Caminho até o arquivo alvo.


&nbsp;

## array newLines

- aka       : -n --newLines
- hint      :  
  Nome do array contendo as novas linhas de dados.


&nbsp;

## char mode

- aka       : -m --mode
- default   : a
- options   :
  - p: p prepend
  - a: a append
  - r: r replace
  - d: d delete
- hint      :  
  Modo de escrita que será efetuada.

Permite definir o modo em que a escrita será feita.

- prepend : Adiciona as novas linhas no início do arquivo.
- append  : Adiciona as novas linhas no final do arquivo.
- replace : Adiciona as novas linhas em substituição a uma linha existente.
- delete  : Exclui a linha ou linhas indicadas.


&nbsp;

## int|string|function targetLine

- aka       : -t --targetLine
- hint      :  
  Número da linha alvo desta ação.
  Intervalos (de linhas) em que o conteúdo será escrito.
  Função responsável por retornar o número da linha alvo ou os intervalos em 
  que a escrita será feita.

Se este parametro não for definido o modo selecionado irá configurá-lo conforme 
as indicações abaixo:

- prepend : equivalente a definir o valor `1`.
- append  : equivalente a definir o número da última linha do arquivo.
- replace : nada será feito.
- delete  : nada será feito.

[int]
A escrita se dará na linha de número indicado.  


[string]
Neste caso, o conteúdo da string deve ser de 2 numerais inteiros separados por 
um espaço (tal qual o resultado de mse_file_get_boundaryLineNumbers).

**exemplo**  
Recebendo os valores `10 15` substituirá totalmente o conteúdo das linhas 10, 
11, 12, 13, 14 e 15 pelo conteúdo novo a ser adicionado.


[function]
Deve ser o nome de uma função capaz de retornar um valor **int** ou **string** 
conforme as regras definidas acima.


Em qualquer dos casos, se não receber valores inteiros válidos (entre 1 e o
número da última linha do arquivo conforme ele está atualmente salvo) a ação 
não será feita nada será feito.




&nbsp;

# Returns bool+

Print `0` se ocorrer alguma falha ou `1` se a escrita ocorreu sem falhas.