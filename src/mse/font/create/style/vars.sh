#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Below are variables that load the definitions of each of the font colors
# already prepared to be used in text messages immediately.
#
# 'L' indicates the 'Light'/luminous version of the color
# 'D' indicates the use of attribute 2/'Dark'/darkened
#
mseNONE='\e[0m'


mseBLACK='\e[20;47;30m'
mseDBLACK='\e[2;47;30m'
mseLBLACK='\e[20;47;90m'
mseDLBLACK='\e[2;47;90m'

mseRED='\e[20;49;31m'
mseDRED='\e[2;49;31m'
mseLRED='\e[20;49;91m'
mseDLRED='\e[2;49;91m'

mseGREEN='\e[20;49;32m'
mseDGREEN='\e[2;49;32m'
mseLGREEN='\e[20;49;92m'
mseDLGREEN='\e[2;49;92m'

mseYELLOW='\e[20;49;33m'
mseDYELLOW='\e[2;49;33m'
mseLYELLOW='\e[20;49;93m'
mseDLYELLOW='\e[2;49;93m'

mseBLUE='\e[20;49;34m'
mseDBLUE='\e[2;49;34m'
mseLBLUE='\e[20;49;94m'
mseDLBLUE='\e[2;49;94m'

msePURPLE='\e[20;49;35m'
mseDPURPLE='\e[2;49;35m'
mseLPURPLE='\e[20;49;95m'
mseDLPURPLE='\e[2;49;95m'

mseCYAN='\e[20;49;36m'
mseDCYAN='\e[2;49;36m'
mseLCYAN='\e[20;49;96m'
mseDLCYAN='\e[2;49;96m'

mseWHITE='\e[20;49;37m'
mseDWHITE='\e[2;49;37m'
mseLWHITE='\e[20;49;97m'
mseDLWHITE='\e[2;49;97m'



MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES=(
  'NONE'
  'BLACK'   'DBLACK'  'LBLACK'  'DLBLACK'
  'RED'     'DRED'    'LRED'    'DLRED'
  'GREEN'   'DGREEN'  'LGREEN'  'DLGREEN'
  'YELLOW'  'DYELLOW' 'LYELLOW' 'DLYELLOW'
  'BLUE'    'DBLUE'   'LBLUE'   'DLBLUE'
  'PURPLE'  'DPURPLE' 'LPURPLE' 'DLPURPLE'
  'CYAN'    'DCYAN'   'LCYAN'   'DLCYAN'
  'WHITE'   'DWHITE'  'LWHITE'  'DLWHITE'
)

MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS=(
  'Normal'
  'Black'   'Black + Dark'  'Black Light'   'Black Light + Dark'
  'Red'     'Red + Dark'    'Red Light'     'Red Light + Dark'
  'Green'   'Green + Dark'  'Green Light'   'Green Light + Dark'
  'Yellow'  'Yellow + Dark' 'Yellow Light'  'Yellow Light + Dark'
  'Blue'    'Blue + Dark'   'Blue Light'    'Blue Light + Dark'
  'Purple'  'Purple + Dark' 'Purple Light'  'Purple Light + Dark'
  'Cyan'    'Cyan + Dark'   'Cyan Light'    'Cyan Light + Dark'
  'White'   'White + Dark'  'White Light'   'White Light + Dark'
)

MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES=(
  '39'
  '30' '230' '90' '290'
  '31' '231' '91' '291'
  '32' '232' '92' '292'
  '33' '233' '93' '293'
  '34' '234' '94' '294'
  '35' '235' '95' '295'
  '36' '236' '96' '296'
  '37' '237' '97' '297'
)

MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES=(
  '49'
  '40' '' '100' ''
  '41' '' '101' ''
  '42' '' '102' ''
  '43' '' '103' ''
  '44' '' '104' ''
  '45' '' '105' ''
  '46' '' '106' ''
  '47' '' '107' ''
)



#
# The Array below has all the names of the attribute codes that can be used.
#
# 'R' indicates 'Remove'
#
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES=(
  'NONE'
  'BOLD'    'DARK'    'ITALIC'    'UNDERLINE'
  'BLINKS'  'BLINKF'  'REVERSE'   'HIDE'        'STRIKE'
  'RBOLD'   'RDARK'   'RITALIC'   'RUNDERLINE'
  'RBLINKS' 'RBLINKF' 'RREVERSE'  'RHIDE'       'RSTRIKE'
)
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES=(
  '20'
  '1'   '2'   '3'   '4'
  '5'   '6'   '7'   '8'   '9'
  '21'  '22'  '23'  '24'
  '25'  '16'  '27'  '28'  '29'
)









#
# A documentação abaixo foi mantida em português pois, em inglês já existe
# muita informação sobre o sistema de cores.


#
# Modificadores
#
# Há 3 conjuntos de modificadores que podem ser usados na composição da estilização de uma
# mensagem de texto; em cada família, cada ítem é representado por um dígito específico.
# Na composição do código que precede o texto que você deseja que herde aquele estilo você precisa
# definir o número que corresponderá a cada um dos modificadores na ordem correta.
#
# Os modificadores são:
# - Atributos
# - Cor de Fundo
# - Cor de Fonte
#
# Assim sendo, o comando a ser usado deve corresponder à seguinte estrutura:
# \e[Atributo;Fundo;Fonte
#
# Exemplo:
# printf "\e[0;44;93mTexto estilizado\e[0;49;39m"
# O código acima exibirá o texto sem nenhum atributo especial onde a cor da fonte é amarelo claro
# e o fundo é azul.
#
#
# Resetar todos os modificadores
# Use o código 0 para remover todos os modificadores; Sejam atributos,
# cor de fonte ou cor de fundo.
#
# Exemplo:
# printf "\e[0mA partir daqui a cor é a padrão do seu terminal"
#
#
#
# Conheça abaixo o código de cada variação de cada modificador
#



#
# Atributos
#
# 20: Reset (reseta as definições de atributos)
#
# 1:  Negrito
# 2:  Dark
# 3:  Itálico
# 4:  Sublinhado
# 5:  Piscando (lento)
# 6:  Piscando (rápido)
# 7:  Inverte a seleção de cor de fonte e cor de fundo
#     No exemplo acima o código \e[0;93;44] exibe um texto onde a cor da fonte é amarelo claro
#     e o fundo é azul, já o código \e[7;93;44] inverterá a seleção criando um texto onde
#     a cor da fonte será azul e o fundo será amarelo.
# 8:  Oculto; Use para ocultar informações sensíveis como senhas
# 9:  Riscado
#
# 21: Remove o Negrito
# 22: Remove o Dark
# 23: Remove o Itálico
# 24: Remove o Sublinhado
# 25: Remove o Piscado (lento)
# 26: Remove o Piscado (rápido)
# 27: Remove a Inversão
# 28: Remove o Oculto
# 29: Remove o Riscado
#
#
#
# Atributos múltiplos
# Você não está restrito a escolher apenas um atributo. Se desejar, pode definir vários
# ao mesmo tempo bastando separá-los por um sinal de ponto e vírgula. O interpretador irá
# concatenar os atributos indicados item a item até que o primeiro código inválido para
# atributos for encontrado.
#
# ex:
# printf "\e[1;4mNegrito e sublinhado \n"
# printf "\e[1;4;2mNegrito, sublinhado e escuro \n"
#



#
# Sistema de 4 bits
# Códigos aceitos: 49 {40..47} {100..107}
#
# 49:   Reset         (reseta as definições de cor de fundo)
#
# Paleta Normal
# 40:   Preto
# 41:   Vermelho
# 42:   Verde
# 43:   Amarelo
# 44:   Azul
# 45:   Púrpura
# 46:   Ciano
# 47:   Branco
#
# Paleta Light / Luminosa
# 100:  Preto
# 101:  Vermelho
# 102:  Verde
# 103:  Amarelo
# 104:  Azul
# 105:  Púrpura
# 106:  Ciano
# 107:  Branco
#
#
#
# Sistema de 8 bits
# Alguns terminais até 255 cores mas para usá-las é preciso
# indicar o código de cor conforme o modelo abaixo:
#
# \e[Atributo;48;5;{0..255};Fontem
#
# Ex:
# printf "\e[1;4;48;5;82;30mNegrito e sublinhado em um fundo verde brilhoso e uma fonte preta \e[0m\n"
#
#
#
# Sistema de 32 bits
# Terminais modernos suportam um sistema true color.
# Para usar uma descrição de cor neste formato é preciso indicar o código
# da cor conforme o modelo abaixo:
#
# \e[Atributo;48;2;R;G;B;Fontem
#
# Onde cada uma das posições R, G e B devem ser substituidas por um numeral
# inteiro entre 0 e 255.
#
# Ex:
# printf "\e[48;2;100;50;150mTeste de cores true type \e[0m\n"
#



#
# Sistema 4 bits
# Códigos aceitos: 39 {30..37} {90..97}
#
# 39:   Reset         (reseta as definições de cor de fonte)
#
# Paleta Normal
# 30:   Preto
# 31:   Vermelho
# 32:   Verde
# 33:   Amarelo
# 34:   Azul
# 35:   Púrpura
# 36:   Ciano
# 37:   Branco
#
# Paleta Light / Luminosa
# 90:   Preto
# 91:   Vermelho
# 92:   Verde
# 93:   Amarelo
# 94:   Azul
# 95:   Púrpura
# 96:   Ciano
# 97:   Branco
#
#
#
# Sistema de 8 bits
# Alguns terminais até 255 cores mas para usá-las é preciso
# indicar o código de cor conforme o modelo abaixo:
#
# \e[Atributo;Fundo;38;5;{1..256}
#
# Ex:
# printf "\e[1;4;38;5;82mNegrito e sublinhado em um verde brilhoso\e[0;49;39m\n"
#
#
#
# Sistema de 32 bits
# Terminais modernos suportam um sistema true color.
# Para usar uma descrição de cor neste formato é preciso indicar o código
# da cor conforme o modelo abaixo:
#
# \e[Atributo;Fundo;38;2;R;G;Bm
#
# Onde cada uma das posições R, G e B devem ser substituidas por um numeral
# inteiro entre 0 e 255.
#
# Ex:
# printf "\e[38;2;100;50;150mTeste de cores true type \e[0m\n"
#