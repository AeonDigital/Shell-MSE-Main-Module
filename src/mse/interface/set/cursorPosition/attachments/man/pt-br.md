# Synopsis

Move o cursor pelo terminal conforme as configurações passadas.



&nbsp;

# Parameters

## char position

- aka       : -p --position
- default   : 
- options   :
    - t: top
    - r: right
    - b: bottom
    - l: left
- hint      :  
  Direção na qual o cursor deve ser movido.

Tenha em mente que, devido ao funcionamento do terminal, quando você efetua o 
`enter` de um comando os seguintes eventos ocorrem na seguinte ordem:

  1. É criada uma nova linha e o cursor fica posicionado na primeira coluna 
     desta nova linha.
  2. O comando digitado na linha acima é executado.
  3. O prompt é reescrito
  4. O cursor é reposicionado ao final do novo prompt.

As informações acima servirão para explicar o funcionamento desta ação e de 
como você deverá perceber as diferenças entre efetuar elas dentro de um script 
(local onde um novo prompt não é criado até o final do mesmo) e seu uso no 
próprio terminal (que é um uso não aconselhado do mesmo).

Quando este mesmo comando é executado dentro de um script, a posição do cursor 
estará vinculada ao último output que ocorreu, portanto o cursor não retorna 
para o início da linha de forma "natural".


&nbsp;

## int distance

- aka       : -d --distance
- default   : 0
- hint      :  
  Quantidade de linhas ou colunas que o cursor ser movido.


&nbsp;

## char anchorPosition

- aka       : -a --anchorPosition
- default   : 
- options   :
    - r: right
    - l: left
- hint      :  
  Se definido, irá "ancorar" o cursor na posição máxima do limite escolhido.




# Returns void



&nbsp;

# Informations

Conheça outros códigos de controle de terminal neste local:
http://www.climagic.org/mirrors/VT100_Escape_Codes.html