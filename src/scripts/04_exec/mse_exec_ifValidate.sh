#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Executa a função indicada apenas após a validação de seus respectivos
# parametros e, caso eles forem considerados válidos.
#
# @param string $1
# Nome da função.
#
# @param mixed $2 3 4 ...
# Parametros que serão passados para a função.
#
# @return
# Preenche as variáveis globais 'MSE_GLOBAL_RETURN' e 'MSE_GLOBAL_LASTERR'
# conforme sucesso ou falha da validação e/ou execução da função.
# Na tela, nenhuma saida será feita.
#
# @exemple
# Uma forma de uso para obter o resultado da validação/execução poderia
# ser conforme o seguinte modelo:
#
# > mse_exec_ifValidate "mse_check_hasKeyInAssocArray" "k1" "arr" &&
#     printf "${MSE_GLOBAL_RETURN}" ||
#     printf "${MSE_GLOBAL_LASTERR}"
mse_exec_ifValidate() {
  local mseReturn
  local mseFunctionName
  local mseTmpParametersArray


  #
  # Efetua a validação dos parametros da função
  mse_exec_validate "$@" &> /dev/null

  #
  # Durante a validação, qualquer erro irá ser registrado na variável
  # global 'MSE_GLOBAL_LASTERR'.
  #
  # Passando na validação, executa a função e registra seu retorno
  # na variável global 'MSE_GLOBAL_RETURN'
  if [ $? == 0 ]; then
    mseFunctionName="$1"

    #
    # Resgata apenas os parametros que devem ser passados para a função final
    mseTmpParametersArray=("$@")
    mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")

    #
    # Executa a função indicada
    mseReturn=$("$mseFunctionName" "${mseTmpParametersArray[@]}")

    #
    # Se a execução da função indicada for vem sucedida
    # registra o resultado da mesma na variável global 'MSE_GLOBAL_RETURN'
    #
    # Senão, registra a mensagem de erro (se existir) na variável global
    # 'MSE_GLOBAL_LASTERR'
    if [ $? == 0 ]; then
      MSE_GLOBAL_RETURN="${mseReturn}"
      return 0
    else
      MSE_GLOBAL_LASTERR="${mseReturn}"
      return 1
    fi
  else
    return 1
  fi
}
