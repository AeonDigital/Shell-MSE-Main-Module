# Synopsis

Imprime os 256 caracteres presentes na atual fonte do seu terminal.



&nbsp;

# Parameters

## char outputFormat

- aka       : -o --outputFormat
- default   : t
- options   : 
  - t : table
  - c : concise
  - d : detailed
- hint      :  
  Indica o formato de saída dos dados.

As seguintes opções estão disponíveis:

- t : Tabela completa dos caracteres de 0 à 255 contendo headers hexadecimais.
      Cada linha contém 16 caracteres.
- c : Tabela dos caracteres de 33 à 255 sem headers.
      Cada linha contém 16 caracteres.
- d : Listagem dos caracteres mostrando informações de suas representações em 
      decimal, hex e octal.


&nbsp;

## int fromChar

- aka       : -f --fromChar
- default   : 33
- min       : 33
- max       : 255
- hint      :
  Índice do primeiro caracter da lista.
  Usado apenas se "outputFormat" for `d`.



&nbsp;

## int toChar

- aka       : -t --toChar
- default   : 255
- min       : 33
- max       : 255
- hint      :
  Índice do último caracter da lista.
  Usado apenas se "outputFormat" for `d`.




&nbsp;

# Example

``` shell
  mse_font_show_characters 'code' 50 70
  mse_font_show_characters 'code' | less -r
```



&nbsp;

# Returns string

Printa na tela as opções de atributos conforme o formato de apresentação 
selecionado.