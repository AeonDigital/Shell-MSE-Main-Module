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
  local strSelection=$(mse_conf_printSectionVariable "$1" "$2" "$3");
  local key
  local value

  oIFS="${IFS}";
  if [ "${strSelection}" != "" ]; then
    while IFS='=' read key value; do
      local k=$(printf "${key}" | sed 's/^\s*//g' | sed 's/\s*$//g');   # trim
      local v=$(printf "${value}" | sed 's/^\s*//g' | sed 's/\s*$//g'); # trim
      printf "${k}\n";
      printf "${v}\n";
    done <<< "${strSelection}"
  fi;
  IFS="${oIFS}";
}
