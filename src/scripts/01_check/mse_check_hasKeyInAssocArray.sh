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
mse_check_hasKeyInAssocArray() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="KeyName :: r :: string"
  mseParamRules["param_1"]="AssocArrayName :: r :: assocName"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    declare -n assocName="$2"
    if [ ! -z "${assocName[$1]+x}" ]; then mseReturn=1; else mseReturn=0; fi

    printf "%s" "${mseReturn}"
    return 0
  fi
}
