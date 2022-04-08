#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Reseta todas as configurações atualmente definidas para o comando 'readFile'.
mse_mmod_readFile_resetConfig() {
  unset MSE_GLOBAL_MODULE_READ_BLOCK
  declare -gA MSE_GLOBAL_MODULE_READ_BLOCK

  MSE_GLOBAL_MODULE_READ_BLOCK["start"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""


  unset MSE_GLOBAL_MODULE_READ_LINE
  declare -gA MSE_GLOBAL_MODULE_READ_LINE

  MSE_GLOBAL_MODULE_READ_LINE["check"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_args"]=""
}
