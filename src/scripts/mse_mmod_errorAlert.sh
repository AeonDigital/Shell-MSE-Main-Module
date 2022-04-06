#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário indicando um erro
# ocorrido em algum script.
#
# @param string $1
# Nome da função onde ocorreu o erro.
# Se não for definido, usará o valor padrão 'script'.
#
# @param string $2
# Mensagem de erro.
#
# @param string $3
# Informação extra [opcional].
#
# @example
#   mse_mmod_errorAlert "" "expected 2 arguments"
#   mse_mmod_errorAlert ${FUNCNAME[0]} "expected 2 arguments"
mse_mmod_errorAlert() {
  if [ $# != 2 ] && [ $# != 3 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else
    local mseLocal

    mseLocal=$1
    if [ $1 == "" ]; then
      mseLocal="script"
    fi

    mse_mmod_setIMessage "${lbl_generic_ERROR} (${lbl_generic_in} ${mseLocal}) : $2" 1
    if [ $# == 3 ]; then
      mse_mmod_setIMessage "$3"
    fi
    mse_mmod_alertUser
  fi
}
