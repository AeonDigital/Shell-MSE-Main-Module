#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaços em branco no início ou no final de uma string.
#
# @param string $1
# String que será alterada.
#
# @return
# Printa a string tratada.
mse_str_trim() {
  local str

  str="$1"
  str="${str#"${str%%[![:space:]]*}"}" # trim L
  str="${str%"${str##*[![:space:]]}"}" # trim R

  printf "%s" "${str}"
}
