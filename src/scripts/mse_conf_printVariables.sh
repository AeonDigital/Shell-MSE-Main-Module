#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime todas as variáveis do arquivo de configuração indicado.
#
# Linhas comentadas e vazias não serão mostradas.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param bool $2
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
mse_conf_printVariables()
{
  local mseShowLineNumber

  mseShowLineNumber=0
  if [ $# -ge 2 ] && [ $2 == 1 ]; then
    mseShowLineNumber=1
  fi

  mse_mmod_readFile_resetConfig

  MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_mmod_readFile_checkLine_isVariable"
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]="# ;"
  MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=" "
  MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

  mse_mmod_readFile "$1" 0 "$mseShowLineNumber"
}
