# Synopsis

Divide a string passada em um array usando o separador indicado.



&nbsp;

# Parameters

## string separator

- aka       : -sep --separator
- hint      :  
  Separador.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Cadeia de caracteres original (que será "dividida").

&nbsp;


## bool removeEmpty

- aka       : -r --removeEmpty
- default   : 0
- hint      :  
  Indica quando os valores vazios devem ser mantidos no array resultante.

&nbsp;


## bool trim

- aka       : -t --trim
- hint      :  
  indica quando realizar um "trim" em cada um dos valores encontrados.

&nbsp;



# Example

``` shell
  mse_str_split "-" "2022-12-22"
  echo "${MSE_LAST_FUNCTION_RETURN[0]}"
  2022
  echo "${MSE_LAST_FUNCTION_RETURN[1]}"
  12
```


&nbsp;

# Returns array

O resultado será definido na variável "MSE_LAST_FUNCTION_RETURN".