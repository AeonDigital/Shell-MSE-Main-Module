#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica uma seção de um arquivo de configuração, tipicamente definido pela
# notação [section-name] e imprime na tela todas as suas variáveis.
# Linhas comentadas e vazias não serão mostradas.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
#
# @param bool $3
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
#
# @return string
mse_conf_showSectionVariables()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="SectionName :: r :: string"
  mseParamRules["param_2"]="ShowLineNumber :: o :: bool :: 0"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    local mseShowLineNumber

    mseShowLineNumber=0
    if [ $# -ge 3 ] && [ $3 == 1 ]; then
      mseShowLineNumber=1
    fi

    mse_file_read_resetConfig

    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","

    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"

    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_isVariable"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]="# ;"
    MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=" "
    MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"
    MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

    mse_file_read "$1" 0 "$mseShowLineNumber"
    return 0
  fi
}
