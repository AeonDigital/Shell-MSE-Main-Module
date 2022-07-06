#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se a linha passada está definindo o início de uma seção de
# configuração. Este tipo de seção é identificado pela existencia de uma linha
# onde a única informação é uma marcação coforme demonstrado abaixo:
# [NOME_DA_SEÇÃO]
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
mse_file_read_checkSection_start() {
  local mseR

  mseR=0
  if [ $# -ge 5 ]; then
    local mseSection

    for mseSection in "${block_start_check_args_array[@]}"; do
      mseSection="[${mseSection}]"
      if [ "$mseSection" == "$3" ]; then
        mseR=1
        break
      fi
    done
  fi

  printf "${mseR}"
}



#
# @desc
# Identifica se a linha passada está definindo o fim de uma seção de
# configuração. O final de uma seção é identificada pelo início de uma outra
# ou pelo final do arquivo.
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
mse_file_read_checkSection_end() {
  local mseR

  mseR=0
  if [ $# -ge 5 ]; then
    if [ "${3:0:1}" == "[" ]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}



#
# @desc
# Identifica se a linha passada está definindo o início de uma seção de
# configuração.
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
mse_file_read_checkArbitratySection_start() {
  local mseR=0

  if [ "${3}" == "${5}" ]; then
    mseR=1
  fi

  printf "${mseR}"
}



#
# @desc
# Identifica se a linha passada está definindo o fim de uma seção de
# configuração.
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
mse_file_read_checkArbitratySection_end() {
  local mseR=0
  declare -n mseReadOptions="${1}"

  if [ "${3}" == "${5}" ]; then
    mseR=1
  fi

  printf "${mseR}"
}
