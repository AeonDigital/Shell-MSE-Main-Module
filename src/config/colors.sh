#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
# printf "\e[0;44;93mTexto estilizado\e[0;37;37m"
# O código acima exibirá o texto sem nenhum atributo especial onde a cor da fonte é amarelo claro
# e o fundo é azul
#
# Conheça abaixo o código de cada variação de cada modificador
#



#
# Atributos
#
# 0:  Remove todos os modificadores; Sejam atributos, cor de fonte ou cor de fundo.
# 1:  Negrito*
# 2:  Dim*
# 4:  Sublinhado*
# 5:  Piscando*
# 7:  Inverte a seleção de cor de fonte e cor de fundo
#     No exemplo acima o código \e[0;93;44] exibe um texto onde a cor da fonte é amarelo claro
#     e o fundo é azul, já o código \e[7;93;44] inverterá a seleção criando um texto onde
#     a cor da fonte será azul e o fundo será amarelo.
# 8:  Oculto*; Use para ocultar informações sensíveis
#
# 21: Remove o Negrito*
# 22: Remove o Dim*
# 24: Remove o Sublinhado*
# 25: Remove o Piscado*
# 27: Remove a Inversão*
# 28: Remove o Oculto*
#
# *:  Estes ítens não puderam ser testados direto no terminal via VM possivelmente por que
#     necessitavam de uma fonte que correspondesse aos mesmos.
#



#
# Cor do fundo
#
# 37:   Padrão        (assume o fundo atual do terminal)
# 40:   Preto
# 41:   Vermelho
# 42:   Verde
# 43:   Amarelo
# 44:   Azul
# 45:   Púrpura
# 46:   Ciano
# 47:   Cinza claro   (não use com fonte branca)
# 100:  Cinza escuro  (não use com fonte preta; Aparenta não funcionar)
# 101:  Vermelho claro
# 102:  Verde claro   (não use com fonte branca)
# 103:  Amarelo claro (não use com fonte branca)
# 104:  Azul claro    (não use com fonte amarelo clara)
# 105:  Púrpura claro|Pink (não use com fontes claras)
# 106:  Ciano claro   (não use com fonte branca)
# 107:  Branco        (não use com fontes claras)
#



#
# Cor da fonte
#
# 39:   Padrão
# 30:   Preto         (combine com um fundo colorido para obter um bom resultado)
# 31:   Vermelho      (Não use com um fundo verde)
# 32:   Verde
# 33:   Amarelo
# 34:   Azul
# 35:   Púrpura
# 36:   Ciano
# 37:   Cinza claro
# 90:   Cinza escuro
# 91:   Vermelho claro
# 92:   Verde claro
# 93:   Amarelo claro
# 94:   Azul claro
# 95:   Púrpura claro|Pink
# 96:   Ciano claro
# 97:   Branco
#




#
# Abaixo há variáveis que carregam as definição de cada uma das cores de
# fonte já preparadas para serem usadas em mensagens de texto de forma imediata.
#
# 'D' indica 'Dark'
# 'L' indica 'Light'
#

mseNONE='\e[0;37;37m'

mseBLACK='\e[0;47;30m'
mseDGREY='\e[0;37;90m'
mseLGREY='\e[0;37;37m'
mseWHITE='\e[0;37;97m'

mseRED='\e[0;37;31m'
mseLRED='\e[0;37;91m'

mseGREEN='\e[0;37;32m'
mseLGREEN='\e[0;37;92m'

mseYELLOW='\e[0;37;33m'
mseLYELLOW='\e[0;37;93m'

mseBLUE='\e[0;37;34m'
mseLBLUE='\e[0;37;94m'

msePURPLE='\e[0;37;35m'
mseLPURPLE='\e[0;37;95m'

mseCYAN='\e[0;37;36m'
mseLCYAN='\e[0;37;96m'



MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES=(
  'NONE'
  'BLACK' 'DGREY' 'LGREY' 'WHITE' 'RED' 'LRED'
  'GREEN' 'LGREEN' 'YELLOW' 'LYELLOW' 'BLUE' 'LBLUE'
  'PURPLE' 'LPURPLE' 'CYAN' 'LCYAN'
)

MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS=(
  'Normal'
  'Black' 'Dark grey' 'Light grey' 'White' 'Red' 'Light red'
  'Green' 'Light green' 'Brown' 'Yellow' 'Blue' 'Light blue'
  'Purple' 'Light purple' 'Ciano' 'Light ciano'
)

MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES=(
  '37'
  '30' '90' '37' '97' '31' '91'
  '32' '92' '33' '93' '34' '94'
  '35' '95' '36' '96'
)

MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES=(
  '49'
  '40' '100' '47' '107' '41' '101'
  '42' '102' '43' '103' '44' '104'
  '45' '105' '46' '106'
)



#
# O Array abaixo possui todos os nomes dos códigos de atributos possíveis
# de serem usados.
#
# 'R' indica 'Remove'
#
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES=(
  'DEFAULT'
  'BOLD' 'DIM' 'UNDERLINE' 'BLINK' 'INVERT' 'HIDDEN'
  'RBOLD' 'RDIM' 'RUNDERLINE' 'RBLINK' 'RINVERT' 'RHIDDEN'
)
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES=(
  '0'
  '1' '2' '4' '5' '7' '8'
  '21' '22' '24' '25' '27' '28'
)
