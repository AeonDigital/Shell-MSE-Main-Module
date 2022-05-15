#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se o valor indicado existe no array alvo.
#
# @param string $1
# Valor que está sendo pesquisado.
#
# @param string $2
# Nome do array em que a pesquisa deve ser feita.
#
# @return
# '1' se 'true'
# '0' se 'false'
mse_check_hasValueInArray() {
  local mseReturn
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
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_hasValueInArray_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ArrayName :: r :: arrayName"
}
