#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela as informações de uma variável.
# Serão impressas 2 linhas de dados, uma contendo o nome da variável e na outra
# seu respectivo valor.
#
# @param string $1
# Nome da seção alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caminho até o arquivo que deve ser verificado.
mse_conf_printSectionVariableInfo()
{
  local mseKey
  local mseValue
  local mseStrSelection
  local oIFS

  mseStrSelection=$(mse_conf_printSectionVariable "$1" "$2" "$3");
  oIFS="${IFS}";

  if [ "${mseStrSelection}" != "" ]; then
    local k
    local v

    while IFS='=' read mseKey mseValue; do
      k=$(printf "${mseKey}" | sed 's/^\s*//g' | sed 's/\s*$//g');   # trim
      v=$(printf "${mseValue}" | sed 's/^\s*//g' | sed 's/\s*$//g'); # trim
      printf "${k}\n";
      printf "${v}\n";
    done <<< "${mseStrSelection}"
  fi;

  IFS="${oIFS}";
}
