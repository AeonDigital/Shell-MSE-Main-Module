#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Apaga totalmente o conteúdo da linha onde o cursor está atualmente.
#
# @param char $1
# Opcional. Se definido, apagará a linha a partir da posição atual do cursor
# até o limite escolhido:
#   - l   : apaga da posição atual até o limite esquerdo da linha.
#   - r   : apaga da posição atual até o limite direito da linha.
#
# @param bool $2
# Opcional. Indica se deve ou não mover o cursor para o início da linha.
# Use "1" para mover o cursor para o início da linha.
# Omita ou use "0" para manter o cursor no local atual.
#
# @link
# Conheça outros códigos de controle de terminal neste local:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html
mse_inter_clearLine() {
  local mseCmd="2"
  local mseCR=""

  if [ $# -ge 1 ]; then
    if [ "$1" == "l" ]; then
      mseCmd="1"
    elif [ "$1" == "r" ]; then
      mseCmd="0"
    fi
  fi

  if [ $# -ge 2 ]; then
    if [ "$2" == "1" ]; then
      mseCR="\r"
    fi
  fi

  printf "\e[${mseCmd}K${mseCR}"
}
