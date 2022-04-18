#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se a chave indicada existe no array associativo alvo.
# Printa '1' se sim e '0' se não.
#
# @param string $1
# Nome da chave procurada
#
# @param string $2
# Nome do array associativo em que a pesquisa deve ser feita.
#
# @return bool
# '1' se a chave está no array
# '0' se a chave não está no array
mse_mmod_checkIfHasKeyInAssoc() {
  declare -n assocName="$2"
  if [ ! -z "${assocName[$1]+x}" ]; then printf "1"; else printf "2"; fi
  #eval 'if [ ${'$2'[$1]+x} ]; then printf "1"; else printf "0"; fi'
}
