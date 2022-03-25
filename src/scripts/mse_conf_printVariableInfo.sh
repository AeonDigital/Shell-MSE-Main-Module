#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela as informações de uma variável.
# Serão impressas 2 linhas de dados, uma contendo o nome da variável e na outra
# seu respectivo valor.
#
# @param string $1
# Nome da variável alvo.
#
# @param string $2
# Caminho até o arquivo que deve ser verificado.
mse_conf_printVariableInfo()
{
  mse_conf_printSectionVariableInfo "" "$1" "$2"
}
