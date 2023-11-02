# Synopsis

Cria um código de estilo de cores para textos em conformidade com os parametros 
informados.



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


&nbsp;

## int|string attribute

- aka       : -a --attribute
- hint      :
  Código ou nome do atributo de fonte a ser usado.

Você pode definir mais de um valor bastando separá-los por virgula.

  Código  : Nome        : Efeito
  20      : NONE        : Reseta qualquer atributo definido (valor padrão).

   1      : BOLD        : Negrito
   2      : DARK        : Escurecido
   3      : ITALIC      : Itálico
   4      : UNDERLINE   : Sublinhado
   5      : BLINKS      : Piscando (lento)
   6      : BLINKF      : Piscando (rápido)
   7      : REVERSE     : Inverte a seleção de cor de fonte e cor de fundo
   8      : HIDE        : Oculto
   9      : STRIKE      : Riscado

  21      : RBOLD       : Remove Negrito
  22      : RDARK       : Remove Escurecido
  23      : RITALIC     : Remove Itálico
  24      : RUNDERLINE  : Remove Sublinhado
  25      : RBLINKS     : Remove Piscando (lento)
  26      : RBLINKF     : Remove Piscando (rápido)
  27      : RREVERSE    : Remove Inversão
  28      : RHIDE       : Remove Oculto
  29      : RSTRIKE     : Remove Riscado

**Valores considerados inválidos serão ignorados.**


&nbsp;

## int|string background

- aka       : -bg --background
- hint      :
  Cor do fundo a ser usada.

O valor a ser descrito varia conforme o tipo do sistema de cores selecionado.


**Sistema 4 bits**
Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:

  Código  : Nome        : Efeito
  49      : NONE        : Reseta a cor do fundo (valor padrão).

  Paleta Normal
  40      : BLACK       : Preto
  41      : RED         : Vermelho
  42      : GREEN       : Verde
  43      : YELLOW      : Amarelo
  44      : BLUE        : Azul
  45      : PURPLE      : Púrpura
  46      : CYAN        : Ciano
  47      : WHITE       : Branco

  Paleta Light / Luminosa
  100     : LBLACK      : Preto
  101     : LRED        : Vermelho
  102     : LGREEN      : Verde
  103     : LYELLOW     : Amarelo
  104     : LBLUE       : Azul
  105     : LPURPLE     : Púrpura
  106     : LCYAN       : Ciano
  107     : LWHITE      : Branco


**Sistema de 8 bits**

Informe um valor entre 0 e 255 para a cor desejada. 
O valor padrão neste caso é `0` (preto).


**Sistema de 32 bits**

Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados por 
um caracter `;`.
O valor padrão neste caso é `0;0;0` (preto).


**Para qualquer dos casos, valores considerados inválidos serão revertidos para 
o valor padrão de cada sistema.**


&nbsp;

## int|string foreground

- aka       : -fg --foreground
- hint      :
  Cor da fonte a ser usada.

O valor a ser descrito varia conforme o tipo do sistema de cores selecionado.


**Sistema 4 bits**
Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:

  Código  : Nome        : Efeito
  39      : NONE        : Reseta a cor do fundo (valor padrão).

  Paleta Normal
  30      : BLACK       : Preto
  31      : RED         : Vermelho
  32      : GREEN       : Verde
  33      : YELLOW      : Amarelo
  34      : BLUE        : Azul
  35      : PURPLE      : Púrpura
  36      : CYAN        : Ciano
  37      : WHITE       : Branco

  Paleta Normal + Atributo Dark
  230     : DBLACK      : Preto
  231     : DRED        : Vermelho
  232     : DGREEN      : Verde
  233     : DYELLOW     : Amarelo
  234     : DBLUE       : Azul
  235     : DPURPLE     : Púrpura
  236     : DCYAN       : Ciano
  237     : DWHITE      : Branco

  Paleta Light / Luminosa
  90      : LBLACK      : Preto
  91      : LRED        : Vermelho
  92      : LGREEN      : Verde
  93      : LYELLOW     : Amarelo
  94      : LBLUE       : Azul
  95      : LPURPLE     : Púrpura
  96      : LCYAN       : Ciano
  97      : LWHITE      : Branco

  Paleta Light / Luminosa + Atributo Dark
  290     : LDBLACK     : Preto
  291     : LDRED       : Vermelho
  292     : LDGREEN     : Verde
  293     : LDYELLOW    : Amarelo
  294     : LDBLUE      : Azul
  295     : LDPURPLE    : Púrpura
  296     : LDCYAN      : Ciano
  297     : LDWHITE     : Branco


**Obs:** a versão _DARK_ das cores é uma implementação não padrão e funciona 
apenas como um _wrapper_ para definir a referida cor com o atributo _DARK_.


**Sistema de 8 bits**

Informe um valor entre 0 e 255 para a cor desejada. 
O valor padrão neste caso é `255` (branco).


**Sistema de 32 bits**

Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados por 
um caracter `;`.
O valor padrão neste caso é `255;255;255` (branco).


**Para qualquer dos casos, valores considerados inválidos serão revertidos para 
o valor padrão de cada sistema.**


&nbsp;

## bool returnAsString

- aka       : -raa --returnAsString
- default   : 0
- hint      :  
  Indique `1` se deseja retornar o código do estilo em formato string legível.

Se omitido ou informado `0` será retornado um código da cor formada pronto para 
ser usado em uma formatação de strings do bash. Se for informado `1` o valor 
retornado será uma string contendo todo o código gerado representando o estilo 
de cores formado.



&nbsp;

# Examples

``` shell
  result=$(mse_font_create_style "4" "BOLD" "DWHITE" "LBLUE")
  printf "${result}Formatted as i wanted"
```



&nbsp;

# Returns string

Retorna uma string representante do estilo formado, seja em formato de código 
pronto para ser usado, seja como uma string legível.