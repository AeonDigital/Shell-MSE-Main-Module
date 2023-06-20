# Synopsis

Elimina qualquer espaço em branco existente imediatamente ANTES da substring 
indicada.



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


# Example

``` shell
  mse_str_trim_substring_left "," "Keep calm   ,   and..."
  Keep calm,   and...
```


&nbsp;

# Returns string

Printa a string tratada.