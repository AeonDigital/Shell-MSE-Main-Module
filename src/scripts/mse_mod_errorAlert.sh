#!/bin/bash -eu
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
#   mse_mod_errorAlert "" "expected 2 arguments"
#   mse_mod_errorAlert ${FUNCNAME[0]} "expected 2 arguments"
mse_mod_errorAlert() {
  if [ $# != 2 ] && [ $# != 3 ]; then
    mse_mod_errorAlert "${FUNCNAME[0]}" "expected 2 or 3 arguments"
  else
    local mseLocal=$1
    local mseIndent="    "
    if [ $1 == "" ]; then
      mseLocal="script"
    fi

    printf "${mseIndent}${mseIndent}ERROR (in ${mseLocal}) : $2\n"
    if [ $# == 3 ]; then
      printf "${mseIndent}$3\n"
    fi
  fi
}
