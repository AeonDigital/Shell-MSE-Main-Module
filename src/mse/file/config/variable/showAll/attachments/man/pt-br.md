# Synopsis

Imprime as variáveis do arquivo de configuração indicado.



&nbsp;

# Description

Imprime as variáveis do arquivo de configuração indicado.
Linhas comentadas e vazias não serão mostradas.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Caminho até o arquivo de configuração alvo.


&nbsp;

## string section

- aka       : -s --section
- hint      :  
  Nome da seção alvo. Omita para ler todo o arquivo.


&nbsp;

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indique se deseja mostrar o número das linhas retornadas.



&nbsp;

# Returns int

Imprime todas as variáveis do arquivo conforme configuração indicada.