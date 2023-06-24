# Synopsis

Mostra uma tabela de cores que o terminal está apto a utilizar para a 
estilização de fontes e fundo.



&nbsp;

# Parameters

## int colorSystem

- aka       : -c --colorSystem
- default   : 4
- options   : 
  - 4:
  - 8:
  - 32:
- hint      :  
  Sistema de cor (4, 8 ou 32 bits).

Há 3 sistemas de descrição de cores que podem ser usados conforme a 
compatibilidade do seu terminal.

Escolha uma destas:

- 4   : Usa 4 bits para representação das cores (16 cores).
        Este é o sistema mais comum entre os diversos terminais.
- 8   : Usa 8 bits para representação das cores (256 cores).
- 32  : Usa 32 bits para representação das cores (true color).

Não há (no momento) amostragem preparada para uma coleção de 32 bits.


&nbsp;

## char focus

- aka       : -f --focus
- default   : f
- options   :
  - f: foreground
  - b: background
- hint      :
  Indica o tipo de amostragem (cor de fonte ou de fundo).

O valor `f` será automaticamente definido caso o conjunto de cores seja de o 
de 4 bits.



&nbsp;

## int itensPerLine

- aka       : -ipl --itensPerLine
- default   : 12
- min       : 4
- max       : 255
- hint      :
  Indique a quantidade de itens por linha que devem ser mostrados.




&nbsp;

# Returns string

Printa na tela uma tabela contendo o conjunto de cores selecionado.