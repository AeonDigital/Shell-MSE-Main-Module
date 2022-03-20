#!/bin/bash -eu
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
mse_mod_checkIfHasValueInArray() {
  local tgtArray="$2[@]"
  local value
  local match="0"

  for value in "${!tgtArray}"; do
  if [ $value == "$1" ]; then
    match="1"
    break
  fi
  done

  printf "${match}\n"
}
