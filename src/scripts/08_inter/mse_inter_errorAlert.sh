#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário indicando um erro ocorrido em
# algum script.
#
# @param string $1
# Nome da função onde ocorreu o erro.
# Se não for definido, usará o valor padrão 'script'.
#
# @param string $2
# Mensagem de erro.
#
# @param string $3
# opcional
# Informação extra quanto ao erro ocorrido.
#
# @return
# Printa na tela as informações desejadas como um alerta para o usuário.
# Em caso de erro, suprimirá qualquer saída e a mensagem de erro ficará
# registrada na variável global 'MSE_GLOBAL_LASTERR'.
#
# @example
#   mse_inter_errorAlert "" "expected 2 arguments"
#   mse_inter_errorAlert ${FUNCNAME[0]} "expected 2 arguments"
mse_inter_errorAlert() {
  declare -a mseErrorMsg
  local mseFunctionName

  #
  # Resgata o nome da função onde o erro ocorreu
  mseFunctionName="script"
  if [ "$1" != "" ]; then
    mseFunctionName="$1"
  fi

  #
  # Registra a mensagem de erro
  mseErrorMsg+=("$2")
  if [ $# -ge 3 ] && [ "$3" != "" ]; then
    mseErrorMsg+=("$3")
  fi


  mse_inter_alertUser "mseErrorMsg" "e" "1"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_errorAlert_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="FunctionName :: r :: string :: script"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="Message :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ExtraInformation :: o :: string"
}
