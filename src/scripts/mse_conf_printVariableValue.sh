#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
#
# @param string $1
# Nome da variável alvo.
#
# @param string $2
# Caminho até o arquivo que deve ser verificado.
mse_conf_printVariableValue()
{
  mse_conf_printSectionVariableValue "" "$1" "$2"
}
