# Synopsis

Efetua a contagem de linhas do arquivo ou string passada e printa o resultado.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Caminho para o arquivo ou string que será usada.



&nbsp;

# Returns int

Total de linhas do arquivo.
Devido a forma como o bash funciona com relação ao tratamento das linhas vazias 
no final dos arquivos, tenha em mente que a contagem de linhas irá apenas até a 
última linha não vazia do arquivo indicado."