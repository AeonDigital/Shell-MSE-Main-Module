# Synopsis

Substitui todas as ocorrências da substring antiga pela nova substring na 
string original.



&nbsp;

# Parameters

## string old

- aka       : -o --old
- hint      :  
  String antiga (que será substituída).

&nbsp;


## string new

- aka       : -n --new
- hint      :  
  Nova string (que será adicionada no lugar da antiga).

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  String original.

&nbsp;



# Example

``` shell
  mse_str_replace "22" "20" "2022-12-22"
  2020-12-20
```


&nbsp;

# Returns string

Imprime o resultado da substituição realizada.