# Synopsis

Imprime na tela o valor da variável pesquisada.



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

# Returns string

Printa o valor da variável indicada.
Atenção para casos em que o valor da variável é vazio `""` pois o fato de não 
obter uma saída pode ser interpretado da mesma forma que se ela não existisse 
no arquivo de configuração ou seção indicada.