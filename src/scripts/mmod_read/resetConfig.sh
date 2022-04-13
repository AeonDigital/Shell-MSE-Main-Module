#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Reseta todas as configurações atualmente definidas para o comando 'readFile'.
mse_mmod_readFile_resetConfig() {
  unset MSE_GLOBAL_MODULE_READ_BLOCK
  declare -gA MSE_GLOBAL_MODULE_READ_BLOCK


  MSE_GLOBAL_MODULE_READ_BLOCK["start"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""

  unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=()
  unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=()



  unset MSE_GLOBAL_MODULE_READ_LINE
  declare -gA MSE_GLOBAL_MODULE_READ_LINE

  MSE_GLOBAL_MODULE_READ_LINE["check"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

  unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=()

  MSE_GLOBAL_MODULE_READ_LINE["transform"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_has_linenumber"]=""

  unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=()
}
