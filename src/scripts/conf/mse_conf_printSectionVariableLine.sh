#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado
# pertencente à seção alvo.
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
#
# @param bool $4
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
mse_conf_printSectionVariableLine()
{
  local mseRawSection
  local mseRawLine
  local mseShowLineNumber

  mseShowLineNumber=0
  if [ $# -ge 4 ] && [ $4 == 1 ]; then
    mseShowLineNumber=1
  fi

  mseRawSection=$(mse_conf_printSectionVariables "$1" "$2" "$mseShowLineNumber")
  mseRawLine=""

  if [ "$mseRawSection" != "" ]; then
    mse_mmod_fileRead_resetConfig

    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_mmod_fileRead_checkLine_hasVariable"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]="$3"
    MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"

    unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
    declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("#" ";")

    mseRawLine=$(mse_mmod_fileRead "$mseRawSection")
  fi

  printf "${mseRawLine%[[:cntrl:]]*}"
}