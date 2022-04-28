#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se a chave indicada existe no array associativo alvo.
#
# @param string $1
# Nome da chave procurada.
#
# @param string $2
# Nome do array associativo em que a pesquisa deve ser feita.
#
# @return
# '1' se a chave está no array
# '0' se a chave não está no array
mse_check_hasKeyInAssocArray() {
  local mseReturn

  declare -n assocName="$2"
  if [ ! -z "${assocName[$1]+x}" ]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
