# Synopsis

Retorna o número da primeira e da última linha envolvidos no trecho válido da 
leitura do arquivo.



&nbsp;

# Parameters

## string target

- aka       : -t --target
- hint      :  
  Caminho até o arquivo ou string alvo.


&nbsp;

## char commentChar

- aka       : -c --commentChar
- hint      :  
  Caracter usado para comentar as linhas dentro do arquivo alvo.


&nbsp;

## bool isConfigFile

- aka       : -icf --isConfigFile
- default   : 0
- hint      :  
  Identifica se trata-se de um arquivo de configuração ou outro tipo.

Isto altera a forma como a seção é procurada.
Use `0` para arquivos de qualquer tipo ou `1` quando trata-se de um arquivo de 
configuração padrão (onde as seções são definidas usando a notação [section]).


&nbsp;

## string startSection

- aka       : -s --startSection
- hint      :  
  Nome ou identificador do início da seção.

Para arquivos em geral, a seção será identificada por uma linha cujo valor seja 
igual ao indicado. Já para arquivos de configuração, informe apenas o nome da 
seção alvo.
Ignore ou defina `""` para este parametro se deseja usar o arquivo inteiro.


&nbsp;

## string endSection

- aka       : -e --endSection
- hint      :  
  Identificador do final da seção.

Para arquivos em geral, o fim da seção será identificada por uma linha cujo 
valor seja igual ao indicado. Já para arquivos de configuração, este valor deve 
ser deixado em branco pois a seção termina ao iniciar uma nova ou ao termino do 
próprio arquivo.


&nbsp;

## bool ignoreTrailingEmptyLines

- aka       : -itel --ignoreTrailingEmptyLines
- default   : 0
- hint      :  
  Indique se a as linhas vazias ao fim da seção alvo devem ser consideradas.

Use `0` para contabilizar as linhas vazias ao final da seção alvo e `1` se 
deseja que tais linhas sejam ignoradas.




&nbsp;

# Returns string

Printa o número da linha de início e de fim da seção alvo separadas por um 
espaço. Nada será retornado caso a seção ou o arquivo alvo não sejam 
encontrados.