# Synopsis

Divide a string passada em um array usando o separador indicado.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array que será preenchido com o resultado do processamento.

&nbsp;


## string separator

- aka       : -sep --separator
- hint      :  
  Separador.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Cadeia de caracteres original (que será dividida).

&nbsp;


## bool removeEmpty

- aka       : -r --removeEmpty
- default   : 0
- hint      :  
  Indica quando os valores vazios devem ser mantidos no array resultante.

&nbsp;


## bool trim

- aka       : -t --trim
- default   : 0
- hint      :  
  indica quando realizar um `trim` em cada um dos valores encontrados.

&nbsp;



# Example

``` shell
  declare -a arrSplit=()
  mse_str_split "arrSplit" "-" "2022-12-22"
  echo "${arrSplit[0]}"
  2022
  echo "${arrSplit[1]}"
  12
```


&nbsp;

# Returns array

O resultado será definido no array indicado.