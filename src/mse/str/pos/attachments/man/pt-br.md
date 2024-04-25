# Synopsis

Identifica a posição da primeira ocorrencia de um dado caracter em uma string.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String onde a pesquisa será feita.


&nbsp;

## char char

- aka       : -c --char
- hint      :  
  Caracter que está sendo procurado.

&nbsp;


# Example

``` shell
  mse_str_pos "text" "x"
  2
```


&nbsp;

# Returns int

Retorna a posição em foi encontrado o primeiro caracter alvo dentro da string.
Se não for encontrado, o valor `-1` será retornado.