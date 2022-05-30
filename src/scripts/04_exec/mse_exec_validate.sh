#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Executa a validação dos parametros de uma função.
#
# @param string $1
# Nome da função cujos parametros serão testados.
#
# @param mixed $2 3 4 ...
# Parametros que serão testados para a função indicada.
#
# @return
# '1' se 'true'
# '0' se 'false'
#
# Também retorna '1' se a função não possuir regras de validação
# definidas em uma função de mesmo nome e com o sufixo '_vldtr'.
mse_exec_validate() {
  mse_exec_clearVars

  local mseReturn
  local mseFunctionName
  local mseFunctionValidateRules

  mseFunctionName="$1"
  mseFunctionValidateRules="${mseFunctionName}_vldtr"
  if [ "$(type -t $mseFunctionValidateRules)" != "function" ]; then
    mseReturn=1;
  else
    #
    # Prepara o array 'MSE_GLOBAL_VALIDATE_PARAMETERS_DATA' que será usado
    # para a verificação dos mesmos
    MSE_GLOBAL_VALIDATE_PARAMETERS_DATA=("$@")
    MSE_GLOBAL_VALIDATE_PARAMETERS_DATA=("${MSE_GLOBAL_VALIDATE_PARAMETERS_DATA[@]:1}")

    #
    # Executa a função que define as regras de validação para a função
    # indicada.
    # Tal função deve redefinir e setar o array associativo
    # 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
    $mseFunctionValidateRules

    #
    # Efetua o teste de cada um dos parametros passados.
    mseReturn=$(mse_exec_validateParams "MSE_GLOBAL_VALIDATE_PARAMETERS_RULES" "MSE_GLOBAL_VALIDATE_PARAMETERS_DATA")

    #
    # Se algum erro ocorrer
    if [ "${mseReturn}" != 1 ]; then
      MSE_GLOBAL_LASTERR="${mseReturn}"
      mseReturn=0
    else
      mseReturn=1
    fi
  fi


  printf "%s" "${mseReturn}"
  if [ "${mseReturn}" == 1 ]; then
    return 0
  else
    return 1
  fi
}
