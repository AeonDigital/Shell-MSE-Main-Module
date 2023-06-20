# Synopsis

Elimina qualquer espaço em branco existente imediatamente ANTES e APÓS a 
substring indicada.



&nbsp;

# Parameters

## string substring

- aka       : -ss --substring
- hint      :  
  Substring alvo.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  String que será alterada.

&nbsp;


## string position

- aka       : -pos --position
- default   : b
- options   :
  - b: a ambos both
  - l: e esq esquerda left
  - r: d dir direita right
- hint      :  
  Indica quando a alteração deve ser feita apenas em um dos lados da substring 
  alvo.

&nbsp;



# Example

``` shell
  mse_str_trim_substring ":" "  Keep  calm   :   and   ... :   think  "
    Keep  calm:and   ...:think
```


&nbsp;

# Returns string

Printa a string tratada.