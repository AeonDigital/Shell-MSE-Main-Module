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
mse_conf_printVariables()
{
  mse_mmod_readFile_resetConfig

  MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_mmod_readFile_checkLine_isVariable"
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

  mse_mmod_readFile "$1" 0 0
}
