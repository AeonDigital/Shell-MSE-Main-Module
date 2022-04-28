#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se a chave indicada existe no array associativo alvo.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Nome da chave procurada.
#
# @param string $2
# Nome do array associativo em que a pesquisa deve ser feita.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_hasKeyInAssocArray() {
  local mseReturn

  declare -n assocName="$2"
  if [ ! -z "${assocName[$1]+x}" ]; then mseReturn=1; else mseReturn=0; fi

  printf "%s" "${mseReturn}"
}
