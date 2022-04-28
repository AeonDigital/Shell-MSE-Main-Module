#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite identificar se um valor passado é uma representação decimal válida
# de um único caracter (UTF-8 safe).
#
# @param string $1
# Valor que será testado.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_isCharDecimal() {
  local mseReturn

  local mseI
  local mseREG
  local mseArrParam

  mseREG='^[0-9]+$'
  mseArrParam=(${1// / })

  mseReturn=1
  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done

  printf "%s" "${mseReturn}"
}