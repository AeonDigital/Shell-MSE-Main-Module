# Synopsis

Lê um arquivo ou string linha a linha.



&nbsp;

# Description

Retorna todas as linhas que corresponderem às definições indicadas nas 
configurações de leitura.



&nbsp;

# Parameters

## string target

- aka       : -t --target
- hint      :  
  Caminho até o arquivo ou string que será lida.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array associativo que traz as configurações para leitura do arquivo.

Para configurar este array associativo você pode usar a função 
**mse_prepare_file_read**.


&nbsp;

## bool removeEmptyLines

- aka       : -rel --removeEmptyLines
- default   : 0
- hint      :  
  Indique se deseja remover as linhas vazias.

Use `0` para mostrar todas as linhas incluindo as vazias ou `1` para removê-las.
Esta definição reescreve a configuração **line_hide_empty** do array de 
configurações passado.


&nbsp;

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indique se deseja mostrar o número das linhas selecionadas.

Use `0` para ocultar e `1` para mostrar o número das linhas selecionadas.
Esta definição reescreve a configuração **line_show_number** do array de 
configurações passado.

O número da linha será retornado como primeira informação e estará separada do 
início do texto por um caracter `#`.



&nbsp;

# Returns string

Coleção de linhas selecionadas na leitura do arquivo conforme os critérios 
indicados.