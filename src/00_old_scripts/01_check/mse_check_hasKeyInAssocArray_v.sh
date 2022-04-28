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
mse_check_hasKeyInAssocArray_v() {
  local mseValidate

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="KeyName :: r :: string"
  mseParamRules["param_1"]="AssocArrayName :: r :: assocName"

  mseValidate=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseValidate" != 1 ]; then
    MSE_GLOBAL_LASTERR="${mseValidate}"
    return 1
  else
    MSE_GLOBAL_RETURN=$(mse_check_hasKeyInAssocArray "$1" "$2")
    return 0
  fi
}
