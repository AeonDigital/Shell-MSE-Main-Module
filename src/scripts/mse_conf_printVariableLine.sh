#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado.
#
# Se o arquivo de configuração estiver mal formatado e existir uma variável
# duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da variável alvo.
mse_conf_printVariableLine()
{
  local mseRawSection
  local mseRawLine

  mseRawSection=$(mse_conf_printVariables "$1")
  mseRawLine=""

  if [ "$mseRawSection" != "" ]; then
    mse_mmod_readFile_resetConfig

    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_mmod_readFile_checkLine_hasVariable"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]="$2"

    mseRawLine=$(mse_mmod_readFile "$mseRawSection")
  fi

  printf "${mseRawLine%[[:cntrl:]]*}"
}
