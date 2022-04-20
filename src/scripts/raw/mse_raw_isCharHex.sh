#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é uma representação hexadecimal
# válida de um único caracter (UTF-8 safe).
# Printa '1' se sim e '0' se não.
#
# @param char $1
# Valor que será testado.
#
# @return bool
# '1' se o valor é uma representação hexadecimal válida de um char
# '0' se o valor não é uma representação hexadecimal válida de um char
mse_raw_isCharHex() {
  local mseReturn=0

  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    local mseI
    local mseREG='^[0-9A-Fa-f]{1,}$'
    local mseArrParam=(${1// / })

    local mseReturn=1
    for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
      if [ $mseReturn == 1 ]; then
        if ! [[ ${mseArrParam[$mseI]} =~ $mseREG ]]; then
          mseReturn=0
          break
        fi
      fi
    done
  fi

  printf "%s" "${mseReturn}"
}
