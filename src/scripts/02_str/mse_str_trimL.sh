#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Elimina qualquer espaço em branco no início da string indicada.
#
# @param string $1
# String que será alterada.
#
# @return
# Printa a string tratada.
#
# @example
#   result=$(mse_str_trimL "   texto aqui   ")
#   printf $result # "texto aqui   "
mse_str_trimL() {
  local mseReturn

  mseReturn="$1"
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L

  printf "%s" "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_trimL_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
