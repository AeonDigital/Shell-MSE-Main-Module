#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e evetuar
# alterações em suas seções como adicionar, remover, alterar, comentar e
# descomentar variáveis.
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
# Nome da operação que será realizada:
# - add       | a   : para adicionar uma nova variável.
# - remove    | r   : para remover uma variável existente.
# - change    | cg  : para alterar o valor de uma variável.
# - comment   | cm  : para comentar uma variável.
# - uncomment | u   : para descomentar uma variável.
#
# @param string $4
# Opcional. Usado em caso de estar adicionando uma nova variável no arquivo.
# Indica a posição em que a variável deve ser adicionada.
# - prepend   | p   : Adiciona a variável no início do arquivo/seção.
# - append    | a   : Adiciona a variável no final do arquivo/seção.
# - replace   | r   : Efetua a alteração da variável no mesmo local em que ela
#                     foi encontrada. Esta é a opção padrão.
#
# @param char $5
# Opcional. Caracter usado para comentar a linha.
# Usado apenas em cado de operação 'comment' ou 'uncomment'.
#
# @param string $4
# Nome da variável alvo.
#
# @param string $5
# Opcional. Novo valor da variável.
# Usado apenas para operação 'change'
#
# @return
# Printa '1' se conseguir efetuar a alteração exigida.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_mainSetVariable()
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
