#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é um único character (UTF-8 safe).
# Printa '1' se sim e '0' se não.
#
# @param char $1
# Valor que será testado.
#
# @return bool
# '1' se o valor é um char
# '0' se o valor não é um char
mse_raw_isChar() {
  local mseReturn=0

  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    local oLC_CTYPE="${LC_CTYPE}"
    local mseValue="$1"

    LC_CTYPE=""
    if [ "${#mseValue}" == 1 ]; then mseReturn=1; else mseReturn=0; fi

    LC_CTYPE="${oLC_CTYPE}"
  fi

  printf "%s" "${mseReturn}"
}
