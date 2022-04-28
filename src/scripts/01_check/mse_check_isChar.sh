#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é um único character (UTF-8 safe).
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isChar() {
  local mseReturn
  local oLC_CTYPE

  oLC_CTYPE="$LC_CTYPE"
  LC_CTYPE=""
  if [ "${#1}" == 1 ]; then mseReturn=1; else mseReturn=0; fi
  LC_CTYPE="${oLC_CTYPE}"

  printf "%s" "$mseReturn"
}
