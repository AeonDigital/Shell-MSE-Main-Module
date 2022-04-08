#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Identifica se a linha passada ESTÁ comentada.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param external
# global array MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
# O referido array deve ser preenchido externamente.
# Cada um de seus itens deve indicar um caracter que pode ser usado para
# comentar uma linha de dados em um arquivo de configuração.
# TODOS serão levados em consideração na análise da linha.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkLine_isComment() {
  local mseR
  local mseLine

  mseR=0
  if [ $# == 3 ]; then
    mseLine=$(mse_str_trim "${2}")
    for mseComSig in "${MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY[@]}"; do
      if [ "${mseLine:0:1}" == "$mseComSig" ]; then
        mseR=1
        break
      fi
    done
  fi

  printf "${mseR}"
}



#
# Identifica se a linha passada CONTÉM um valor compatível com a
# definição de uma variável (CHAVE=VALOR).
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param string $3
# Indique o nome da variável procurada.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkLine_isVariable() {
  local mseR
  local mseLine

  mseR=0
  if [ $# == 3 ] && [ "$2" != "" ]; then
    if [[ "$2" =~ ^([a-zA-Z]+).*= ]]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}




#
# Identifica se a linha passada CONTÉM uma variável de nome indicado
# esteja ela comentada ou não.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param string $3
# Indique o nome da variável procurada.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkLine_hasVariable() {
  local mseR
  local mseLine

  mseR=0
  if [ $# == 3 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trimD "=" "$2")

    if [ "${mseLine%%=*}" == "$3" ]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}
