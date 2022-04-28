#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaços em branco no início ou no final de uma string.
#
# @param string $1
# String que será alterada.
#
# @return string
# String tratada.
mse_raw_str_trim() {
  local str=""
  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    str="$1"
    str="${str#"${str%%[![:space:]]*}"}" # trim L
    str="${str%"${str##*[![:space:]]}"}" # trim R
  fi
  printf '%s' "${str}"
}
