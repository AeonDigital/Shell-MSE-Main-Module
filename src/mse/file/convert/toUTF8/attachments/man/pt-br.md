# Synopsis

Converte o arquivo alvo do encoding atual para UTF-8.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Caminho para o arquivo que será convertido.


&nbsp;

## string newFile

- aka       : -nf --newFile
- default   : 
- hint      :  
  Caminho para o novo arquivo gerado a partir do original.

Se nenhum arquivo for definido, o original será sobrescrito.



&nbsp;

# Returns bool

`1` se a conversão for realizada caso contrário `0`.



&nbsp;

## Dependencies

- iconv