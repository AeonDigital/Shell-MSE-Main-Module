#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui toda ocorrencia da string $1 pela
# string $2 encontrada na string definida em $3.
#
# @param string $1
# String antiga (que será substituída).
#
# @param string $2
# String nova (que será adicionada no local da antiga).
#
# @param string $3
# String original. Onde ocorrerá a substituição
#
# @return
# Printa o resultado da substituição realizada.
#
# @example
#   result=$(mse_str_replace "22" "20" "2022-12-22")
#   printf $result # "2020-12-20"
mse_str_replace() {
  local mseReturn
  local mseOld
  local mseNew
  local mseString

  mseOld="$1"
  mseNew="$2"
  mseString="$3"
  mseReturn="${mseString//${mseOld}/${mseNew}}"

  printf "%s" "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_replace_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Old :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="New :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="String :: r :: string"
}
