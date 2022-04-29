#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Limpa/reseta todas as variáveis globais que servem às diversas
# funções do MSE.
mse_exec_clearVars() {
  declare -g MSE_GLOBAL_LASTERR=""
  declare -g MSE_GLOBAL_RETURN=""

  unset MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
  declare -ga MSE_GLOBAL_VALIDATE_PARAMETERS_DATA

  unset MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
  declare -gA MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
}
