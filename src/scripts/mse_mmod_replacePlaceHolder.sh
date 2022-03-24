#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui um 'placeholder' em uma string pelo valor indicado.
# Os 'placeholders' precisam ser definidos usando o seguinte padrão:
# [[PHNAME]]
#
# @param string $1
# Nome do placeholder que será substituido (sem os colchetes).
#
# @param string $2
# Valor que será usado no lugar do 'placeholder'
#
# @param string $3
# String que contém o 'placeholder' e que será retornada com a
# alteração feita
mse_mmod_replacePlaceHolder() {
  local mseREG
  local mseNEW

  if [ $# -lt 3 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else
    #
    # Trata caracteres que podem ocasionar falhas no uso do 'sed'
    # ao usar o replace
    #
    # Adiciona uma contrabarra em toda barra encontrada.
    mseREG='s/\//\\\//g'
    mseNEW="$(printf "$2" | sed -e "${mseREG}")"

    #
    # Efetivamente substitui o placeholder pelo valor a ser usado
    mseREG='s/\[\['$1'\]\]/'$mseNEW'/g'
    mseNEW="$(printf "$3" | sed -e "${mseREG}")"
  fi

  printf "${mseNEW}"
}
