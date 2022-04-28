#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Adiciona uma nova linha de informação no array de mensagem
# de interface ${MSE_GLOBAL_MODULE_GENERAL_MSG}
#
# @param string $1
# Nova linha da mensagem
#
# @param bool $2
# Use '1' quando quiser que o array seja reiniciado.
# Qualquer outro valor não causará efeitos
#
# @example
#   mse_mmod_setIMessage "Atenção" 1
#   mse_mmod_setIMessage "Todos os arquivos serão excluídos."
mse_mmod_setIMessage() {
  if [ $# != 1 ] && [ $# != 2 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else
    if [ $# == 2 ] && [ $2 == 1 ]; then
      MSE_GLOBAL_MODULE_GENERAL_MSG=()
    fi

    local mseLength=${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]}
    MSE_GLOBAL_MODULE_GENERAL_MSG[mseLength]=$1
  fi
}
