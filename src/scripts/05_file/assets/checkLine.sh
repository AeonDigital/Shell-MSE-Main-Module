#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se a linha passada ESTÁ comentada.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo verificada.
#
# @param string $3
# Conteúdo da linha sendo verificada.
#
# @param bool $4
# Use "0" para informar que as linhas sendo processadas estão em formato "raw"
# (tal qual no arquivo original).
# Use "1" para informar que há, no conteúdo de cada linha, a informação de seu
# respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_file_read_checkLine_isComment() {
  local mseR
  local mseLine

  mseR=0
  if [ $# -ge 4 ] && [ "$3" != "" ]; then
    mseLine=$(mse_str_trim "${3}")
    #
    # Remove a informação de número da linha
    if [ "$4" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    for mseComSig in "${line_check_args_array[@]}"; do
      if [ "${mseLine:0:1}" == "$mseComSig" ]; then
        mseR=1
        break
      fi
    done
  fi

  printf "${mseR}"
}



#
# @desc
# Identifica se a linha passada CONTÉM um valor compatível com a
# definição de uma variável (CHAVE=VALOR).
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo verificada.
#
# @param string $3
# Conteúdo da linha sendo verificada.
#
# @param bool $4
# Use "0" para informar que as linhas sendo processadas estão em formato "raw"
# (tal qual no arquivo original).
# Use "1" para informar que há, no conteúdo de cada linha, a informação de seu
# respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_file_read_checkLine_isVariable() {
  local mseR
  local mseLine
  local mseReg
  local mseCommentChars

  mseR=0
  if [ $# -ge 4 ] && [ "$3" != "" ]; then
    mseLine=$(mse_str_trim "${3}")
    #
    # Remove a informação de número da linha
    if [ "$4" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    mseCommentChars=$(printf '%s' "${line_check_args_array[@]}")
    mseReg='^(['"${mseCommentChars}"']?)([a-zA-Z]+).*='
    if [[ "$mseLine" =~ $mseReg ]]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}




#
# @desc
# Identifica se a linha passada CONTÉM uma variável de nome indicado
# esteja ela comentada ou não.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo verificada.
#
# @param string $3
# Conteúdo da linha sendo verificada.
#
# @param bool $4
# Use "0" para informar que as linhas sendo processadas estão em formato "raw"
# (tal qual no arquivo original).
# Use "1" para informar que há, no conteúdo de cada linha, a informação de seu
# respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_file_read_checkLine_hasVariable() {
  local mseR
  local mseLine
  local mseComSig
  local mseVarName

  mseR=0
  if [ $# -ge 5 ] && [ "$3" != "" ]; then
    mseLine=$(mse_str_trim "$3")
    mseLine=$(mse_str_trimD "=" "$mseLine")
    #
    # Remove a informação de número da linha
    if [ "$4" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    mseVarName="${line_check_args_array[0]}"
    line_check_args_array=("${line_check_args_array[@]:1}")

    for mseComSig in "${line_check_args_array[@]}"; do
      if [ "${mseLine:0:1}" == "${mseComSig}" ]; then
        mseLine="${mseLine#${mseComSig}}"
      fi
    done

    if [ "${mseLine%%=*}" == "${mseVarName}" ]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}
