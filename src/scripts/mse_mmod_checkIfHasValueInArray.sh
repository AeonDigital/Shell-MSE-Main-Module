#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se o valor indicado existe no array alvo.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Valor que está sendo pesquisado
#
# @param string $2
# Nome do array em que a pesquisa deve ser feita.
mse_mmod_checkIfHasValueInArray() {
  local mseArray
  local mseValue
  local mseMatch

  mseArray="$2[@]"
  mseMatch="0"
  for mseValue in "${!mseArray}"; do
  if [ $mseValue == "$1" ]; then
    mseMatch="1"
    break
  fi
  done

  printf "${mseMatch}\n"
}
