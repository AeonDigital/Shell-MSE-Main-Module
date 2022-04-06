#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
# A variável será pesquisada apenas na seção indicada.
#
# @param string $1
# Nome da seção alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caminho até o arquivo que deve ser verificado.
mse_conf_printSectionVariableValue()
{
  local oIFS
  local mseStrSelection

  mseStrSelection=$(mse_conf_printSectionVariableInfo "$1" "$2" "$3");

  oIFS="${IFS}";
  IFS=$'\n'
  mseStrSelection=($mseStrSelection);
  IFS="${oIFS}"

  if [ ${#mseStrSelection[@]} == 2 ]; then
    printf "${mseStrSelection[1]}\n";
  fi;
}
