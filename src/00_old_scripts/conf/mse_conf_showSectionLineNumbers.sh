#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica a linha de início e de fim de uma seção de dados em um arquivo
# de configuração.
# A linha de início é a própria linha onde se encontra o header da seção.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
#
# @param char $3
# Caracter usado para comentar a linha.
#
# @return
# Printa o número da linha de início e de fim separadas por um espaço.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_showSectionLineNumbers()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="SectionName :: r :: string"
  mseParamRules["param_2"]="CommentChar :: r :: char"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mse_file_read_resetConfig

    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","
    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"
    MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]="1"

    local mseRawLines=$(mse_file_read "$1" 0 "1")

    if [ "$mseRawLines" == "" ]; then
       printf "%s" "Section \"$2\" do not exists"
       return 1
    else
      local mseCharC
      local mseFirstLine
      local mseFirstLineNumber
      local mseLastLine
      local mseLastLineNumber

      mseCharC="$3"

      mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
      mseFirstLineNumber="${mseFirstLine%${mseCharC}*}"
      mseFirstLineNumber="${mseFirstLineNumber%*${mseCharC}}"

      mseLastLine="${mseRawLines##*[[:cntrl:]]}"
      mseLastLineNumber="${mseLastLine%${mseCharC}*}"
      mseLastLineNumber="${mseLastLineNumber%*${mseCharC}}"

      printf "%s" "${mseFirstLineNumber} ${mseLastLineNumber}"
      return 0
    fi
  fi
}
