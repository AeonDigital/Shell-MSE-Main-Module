#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaços em branco no início ou no final de uma string.
#
# @param string $1
# String que será alterada.
#
# @example
#   result=$(mse_str_trim "   texto  aqui   ")
#   printf $result # "texto  aqui"
mse_str_trim() {
  local str

  str="$1"
  str="${str#"${str%%[![:space:]]*}"}" # trim L
  str="${str%"${str##*[![:space:]]}"}" # trim R

  printf "${str}"

  #
  # usando 'sed'
  # printf "$1" | sed 's/^\s*//g' | sed 's/\s*$//g'

  #
  # usando 'xargs'
  # Elimina toda ocorrencia de múltiplos espaços entre
  # as palavras portanto não é adequada ao que se deseja.
  # printf "$1" | xargs
}
