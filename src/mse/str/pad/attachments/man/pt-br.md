# Synopsis

Preenche uma string com o caractere indicado.



&nbsp;

# Description

Adiciona na string original um total de caracteres "pad" à esquerda ou direita 
(conforme "position") até que ela tenha o total de caracteres indicado em 
"length".



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String que será preenchida.

&nbsp;


## char pad

- aka       : -p --pad
- hint      :  
  String que será usada para fazer o preenchimento.

&nbsp;


## int length

- aka       : -l --length
- hint      :  
  Total de caracteres que a string final deve ter.

&nbsp;


## string position

- aka       : -pos --position
- options   :
  - l: e esq esquerda left
  - r: d dir direita right
- hint      :  
  Posição em que o preenchimento deve ser feito.

&nbsp;



# Example

``` shell
  mse_str_pad "32" "0" "5" "l"
  00032
```


&nbsp;

# Returns string

Retorna a string alterada.