#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e comentar ou
# descomentar a variável indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
# Use "" para procurar em todo o arquivo.
#
# @param string $3
# Nome da variável alvo.
#
# @param char $4
# Caracter usado para comentar a linha.
#
# @param bool $5
# Use '0' para descomentar a linha da variável alvo.
# Use '1' para comentar a linha da variável alvo.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo ou se a variável
# já está no estado em que deveria ficar.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_mainComment()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=5
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="SectionName :: r :: string"
  mseParamRules["param_2"]="VariableName :: r :: string"
  mseParamRules["param_3"]="CommentChar :: r :: char"
  mseParamRules["param_4"]="ToComment :: r :: bool"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseRawLine
    local mseIsComment
    local mseLineNumber
    local mseNewLine
    local mseCharC

    if [ "$2" == "" ]; then
      mseRawLine=$(mse_conf_showVariableLine "$1" "$3" "1")
    else
      mseRawLine=$(mse_conf_showSectionVariableLine "$1" "$2" "$3" "1")
    fi

    if [ "${mseRawLine}" == "" ]; then
      printf "Variable \"$3\" not found"
      return 1
    else
      mseReturn="1"
      mseCharC="$4"

      #
      # Identifica o número da linha alvo em que está a variável
      # redefine o 'rawLine' para uma versão sem o número da linha
      mseLineNumber="${mseRawLine%${mseCharC}*}"
      mseLineNumber="${mseLineNumber%*${mseCharC}}"
      mseRawLine=$(mse_raw_str_trim "${mseRawLine#*${mseCharC}}")



      #
      # Verifica o estado da variável... se está ou não comentada
      mseIsComment=0
      if [ "${mseRawLine:0:1}" == "$4" ]; then
        mseIsComment=1
      fi


      #
      # Se a variável deve ser comentada...
      mseNewLine=""
      if [ "$mseIsComment" == 0 ] && [ "$5" == 1 ]; then
        mseNewLine=("${4}${mseRawLine}")
      elif [ "$mseIsComment" == 1 ] && [ "$5" == 0 ]; then
        mseNewLine=("${mseRawLine:1}")
      fi


      if [ "$mseNewLine" != "" ]; then
        mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "$mseLineNumber")
      fi


      printf "%s" "${mseReturn}"
      if [ "$mseReturn" == 1 ]; then return 0; else return 1; fi
    fi
  fi
}
