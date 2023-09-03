# Synopsis

Substitui um ou mais `placeholder` em uma string pelos valores indicados
adicionando ao mesmo a cor informada.



&nbsp;

# Description

Os `placeholders` precisam ser definidos usando o seguinte padrão: [[PHNAME]]
Após o terceiro argumento, novos pares de argumentos podem ser passados para 
serem usados em substituição a um novo placeholder dentro da mesma string 
original.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String original que contém os `placeholders` e que será retornada com as 
  devidas substituições.

&nbsp;


## string placeHolderName

- aka       : -phn --placeHolderName
- hint      :  
  Nome de um placeholder a ser substituído (informe o nome sem os colchetes).

&nbsp;


## string placeHolderValue

- aka       : -phv --placeHolderValue
- hint      :  
  Valor a ser usado no lugar do placeholder.

&nbsp;


## string colorCode

- aka       : -c --colorCode
- hint      :  
  Código da cor que será usada.



&nbsp;

# Returns string

Printa a string original com a substituição dos placeholders pelos novos 
conteúdos indicados.