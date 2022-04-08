#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica uma seção de um arquivo de configuração, tipicamente definido pela
# notação [section-name] e imprime na tela todas as suas variáveis.
#
# Linhas comentadas e vazias não serão mostradas.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
mse_conf_printSectionVariables()
{
  mse_mmod_readFile_resetConfig

  MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_mmod_readFile_checkSection_start"
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
  MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_mmod_readFile_checkSection_end"

  MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_mmod_readFile_checkLine_isVariable"
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

  mse_mmod_readFile "$1" 0 0
}
