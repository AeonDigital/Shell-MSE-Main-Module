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
#
# @return bool
# '1' se o valor está no array
# '0' se o valor não está no array
mse_check_ifHasValueInArray() {
  local mseReturn

  declare -a mseParamData=($@)
  declare -A mseParamRules
  mseParamRules["count"]=2
  mseParamRules["param_0"]="Value :: r :: string"
  mseParamRules["param_1"]="ArrayName :: r :: arrayName"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseValue
    declare -n arrayName="$2"

    mseReturn=0
    for mseValue in "${arrayName[@]}"; do
      if [ "$mseValue" == "$1" ]; then
        mseReturn="1"
        break
      fi
    done

    printf "%s" "${mseReturn}"
    return 0
  fi
}
