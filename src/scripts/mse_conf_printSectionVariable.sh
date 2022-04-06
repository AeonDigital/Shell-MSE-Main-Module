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
  local mseRawLine
  local mseTmpLine
  local mseStrSelection

  mseStrSelection=$(mse_conf_printSectionVariables "$1" "$3")
  while read mseRawLine
  do
    mseTmpLine=$(sed 's/\s*'"="'\s*/'"="'/g' <<< "${mseRawLine}"); # trimD

    if [[ "${mseTmpLine}" =~ ^"$2"= ]]; then
      printf "${mseRawLine}\n"
      break
    fi;
  done <<< "${mseStrSelection}"
}
