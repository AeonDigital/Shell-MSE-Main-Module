#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Identifica se a linha passada está definindo o início de uma seção de
# configuração. Este tipo de seção é identificado pela existencia de uma linha
# onde a única informação é uma marcação coforme demonstrado abaixo:
# [NOME_DA_SEÇÃO]
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param external
# global array MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
# O referido array deve ser preenchido externamente.
# Cada um de seus itens deve indicar o nome de uma das seções que se deseja
# retornar
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkSection_start() {
  local mseR

  mseR=0
  if [ $# == 3 ]; then
    local mseSection

    for mseSection in "${MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY[@]}"; do
      mseSection="[${mseSection}]"
      if [ "$mseSection" == "$2" ]; then
        mseR=1
        break
      fi
    done
  fi

  printf "${mseR}"
}



#
# Identifica se a linha passada está definindo o fim de uma seção de
# configuração. O final de uma seção é identificada pelo início de uma outra
# ou pelo final do arquivo.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param string $3
# Não usado nesta verificação.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkSection_end() {
  local mseR

  mseR=0
  if [ "${2:0:1}" == "[" ]; then
    mseR=1
  fi

  printf "${mseR}"
}
