#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua uma consulta nos metadados dos módulos carregados no momento pelo
# nome de funções que deem "match" com o valor indicado.
#
# @param string $1
# Nome da função alvo.
#
# @return
# Lista estilizada do resultado da consulta por funções.
mse_mmod_searchFunction() {
  if [ "$#" == "0" ] || [ "$1" == "" ]; then
    mse_inter_alertUser "i" "" "${lbl_searchFunction_enterAFunction}"
  else
    mse_mmod_showMetaData 1 1 "" "" "$1"
  fi
}
MSE_GLOBAL_CMD["search function"]="mse_mmod_searchFunction"
