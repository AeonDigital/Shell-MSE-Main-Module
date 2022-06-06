#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime as variáveis do arquivo de configuração indicado.
# Linhas comentadas e vazias não serão mostradas.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
# Use "" para mostrar variáveis de todo o arquivo.
#
# @param bool $3
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
#
# @return
# Imprime todas as variáveis do arquivo.
mse_conf_showVariables()
{
  local mseReturn
  local mseShowLineNumber

  mse_file_read_resetConfig

  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","

    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"
  fi

  mseShowLineNumber=0
  if [ $# -ge 3 ] && [ $3 == 1 ]; then
    mseShowLineNumber=1
  fi

  MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_isVariable"
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]="# ;"
  MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=" "
  MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""

  mse_file_read "$1" 0 "$mseShowLineNumber"
}
MSE_GLOBAL_CMD["show variables"]="mse_conf_showVariables"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_showVariables_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowLineNumber :: o :: bool :: 0"
}
