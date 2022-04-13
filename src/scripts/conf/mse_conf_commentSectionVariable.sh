#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar uma configuração do tipo chave=valor e comentar uma
# variável indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
#
# @param string $3
# Nome da variável alvo.
#
# @param string $4
# Caracter usado para comentar a linha.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo.
# Printa a mensagem do erro ocorrido.
mse_conf_commentSectionVariable()
{
  local mseReturn
  local mseRawLine
  local mseLineNumber
  local mseRawVarAssign
  local mseRawVarValue

  local mseComSig
  local mseIsComment
  local mseNewLine


  mseReturn=0
  if [ $# -ge 4 ]; then
    mseRawLine=$(mse_conf_printSectionVariableLine "$1" "$2" "$3" "1")
    if [ "${mseRawLine}" != "" ]; then
      mseLineNumber="${mseRawLine%#*}"
      mseRawLine="${mseRawLine#*#}"

      mse_str_split "=" "${mseRawLine}"
      mseRawVarAssign=${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}
      mseRawVarValue=""

      if [ ${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]} -ge 2 ]; then
        MSE_GLOBAL_MODULE_SPLIT_RESULT=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}")
        mseRawVarValue=$(mse_str_join "=" "MSE_GLOBAL_MODULE_SPLIT_RESULT")
      fi


      #
      # Verifica se a variável já não está comentada...
      # Usará as definições de caracteres de comentários registradas na função
      # 'mse_conf_printSectionVariableLine'
      mseIsComment=0
      for mseComSig in "${MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY[@]}"; do
        if [ "${mseRawVarAssign:0:1}" == "${mseComSig}" ]; then
          mseIsComment=1
        fi
      done


      #
      # Apenas se não está comentado
      if [ $mseIsComment == 0 ]; then
        mseNewLine="$4"
        mseNewLine+="${mseRawVarAssign}"
        mseNewLine+="="
        mseNewLine+="${mseVarValueSpaces}"
        mseNewLine+="${mseRawVarValue}"
        mseNewLine=("$mseNewLine")

        mseReturn=$(mse_mmod_fileWrite "$1" "mseNewLine" "r" "$mseLineNumber")
      fi
    fi
  fi

  printf "${mseReturn}"
}
