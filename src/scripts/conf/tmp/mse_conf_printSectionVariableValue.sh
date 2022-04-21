#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
# A variável será pesquisada apenas na seção indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
#
# @param string $3
# Nome da variável alvo.
mse_conf_showSectionVariableValue()
{
  local mseRawLine
  mseRawLine=$(mse_conf_showSectionVariableLine "$1" "$2" "$3" 0)

  if [ "${mseRawLine}" != "" ]; then
    mseRawLine=$(mse_str_trimD "=" "${mseRawLine}")
    printf "${mseRawLine#${3}=}"
  fi;
}
