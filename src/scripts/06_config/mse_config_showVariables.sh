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
# Imprime todas as variáveis do arquivo conforme configuração indicada.
mse_config_showVariables() {
  local mseReturn
  local mseShowLineNumber

  unset mseReadOptionsShowVars
  declare -A mseReadOptionsShowVars
  mse_file_prepareRead "mseReadOptionsShowVars"


  #
  # Tendo a definição de uma seção alvo...
  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    mseReadOptionsShowVars["block_start_check"]="mse_file_read_checkSection_start"
    mseReadOptionsShowVars["block_start_check_args"]="${2}"
    mseReadOptionsShowVars["block_start_check_args_sep"]=","
    mseReadOptionsShowVars["block_start_get_first_line"]="0"

    mseReadOptionsShowVars["block_end_check"]="mse_file_read_checkSection_end"
  fi

  mseShowLineNumber=0
  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseShowLineNumber=1
  fi

  mseReadOptionsShowVars["line_check"]="mse_file_read_checkLine_isVariable"
  mseReadOptionsShowVars["line_check_args"]="# ;"
  mseReadOptionsShowVars["line_check_args_sep"]=" "
  mseReadOptionsShowVars["line_check_invert"]=""
  mseReadOptionsShowVars["line_check_has_linenumber"]="${mseShowLineNumber}"

  mse_file_read "${1}" "mseReadOptionsShowVars" "1" "${mseShowLineNumber}"
}
MSE_GLOBAL_CMD["config show variables"]="mse_config_showVariables"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_config_showVariables_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowLineNumber :: o :: bool :: 0"
}
