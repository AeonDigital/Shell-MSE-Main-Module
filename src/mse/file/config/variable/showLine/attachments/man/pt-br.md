# Synopsis

Imprime na tela toda a linha informativa sobre a variável de nome indicado.



&nbsp;

# Description

Se o arquivo de configuração estiver mal formatado e existir dentro da mesma 
seção uma variável duplicada, apenas a primeira será levada em consideração.



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

## string varName

- aka       : -vn --varName
- hint      :  
  Nome da variável alvo.


&nbsp;

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indique se deseja mostrar o número das linhas retornadas.



&nbsp;

# Returns string

Printa a linha da variável indicada.