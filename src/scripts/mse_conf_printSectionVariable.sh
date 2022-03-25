#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado da
# seção alvo.
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma seção uma
# variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Nome da seção alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caminho até o arquivo que deve ser verificado.
mse_conf_printSectionVariable()
{
  local rawLine
  local strSelection=$(mse_conf_printSectionVariables "$1" "$3");

  while read rawLine
  do
    local line=$(sed 's/\s*'"="'\s*/'"="'/g' <<< "${rawLine}"); # trimD

    if [[ "${line}" =~ ^"$2"= ]]; then
      printf "${rawLine}\n";
      break;
    fi;
  done <<< "${strSelection}"
}
