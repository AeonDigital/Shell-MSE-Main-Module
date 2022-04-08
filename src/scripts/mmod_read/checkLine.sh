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
# @param string $3
# Indique cada caracter que pode ser usado para comentar uma linha
# separado por um espaço
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_mmod_readFile_checkLine_isComment() {
  local mseR
  local mseLine

  mseR=0
  if [ $# == 3 ]; then
    local mseArrLen
    local mseArrLastIndex
    local mseCommentSignals
    local mseComSig


    #
    # Promove um 'split' do parametro '$3'
    # e trata o '\n' que o comando 'readarray' adiciona no último ítem
    readarray -d ' ' -t mseCommentSignals <<< "$3"
    mseArrLen="${#mseCommentSignals[@]}"
    if [ $mseArrLen -gt 0 ]; then
      ((mseArrLastIndex=mseArrLen-1))
      mseCommentSignals[$mseArrLastIndex]=$(mse_str_trim "${mseCommentSignals[$mseArrLastIndex]}")
    fi

    mseLine=$(mse_str_trim "${2}")
    for mseComSig in "${mseCommentSignals[@]}"; do
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