#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
#
# Se o arquivo de configuração estiver mal formatado e existir uma variável
# duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da variável alvo.
mse_conf_printVariableValue()
{
  local mseRawLine
  mseRawLine=$(mse_conf_printVariableLine "$1" "$2")

  if [ "${mseRawLine}" != "" ]; then
    mseRawLine=$(mse_str_trimD "=" "${mseRawLine}")
    printf "${mseRawLine#${2}=}"
  fi;
}
