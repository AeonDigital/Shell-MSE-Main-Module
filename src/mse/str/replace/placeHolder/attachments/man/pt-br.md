# Synopsis

Substitui um ou mais `placeholder` em uma string pelos valores indicados.



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



# Example

``` shell
  mse_str_replacePlaceHolder "my name is [[NAME]]" \
    "NAME" "Katze"
  my name is Katze

  mse_str_replacePlaceHolder "my name is [[NAME]] and i living in [[COUNTRY]]" \
    "NAME" "Katze" \
    "COUNTRY" "Brasil"
  my name is Katze and i living in Brasil
```


&nbsp;

# Returns string

Printa a string original com a substituição dos placeholders pelos novos 
conteúdos indicados.