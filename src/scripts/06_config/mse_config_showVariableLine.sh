#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
# Use "" para procurar a variável em todo o arquivo.
#
# @param string $3
# Nome da variável alvo.
#
# @param bool $4
# Omita, indique "" ou "0" para retornar apenas as linhas alvo.
# Indique "1" para trazer o número de cada uma das linhas retornadas.
#
# @return
# Printa a linha da variável indicada
mse_config_showVariableLine() {
  local mseReturn
  local mseRawSection
  local mseShowLineNumber

  mseShowLineNumber=0
  if [ $# -ge 4 ] && [ "$4" == "1" ]; then
    mseShowLineNumber=1
  fi

  mseReturn=""
  mseRawSection=$(mse_config_showVariables "$1" "$2" "$mseShowLineNumber")

  if [ "$mseRawSection" != "" ]; then
    unset mseReadOptionsShowVarLine
    declare -A mseReadOptionsShowVarLine
    mse_file_prepareRead "mseReadOptionsShowVarLine"


    mseReadOptionsShowVarLine["line_check"]="mse_file_read_checkLine_hasVariable"
    mseReadOptionsShowVarLine["line_check_args"]="${3} # ;"
    mseReadOptionsShowVarLine["line_check_args_sep"]=" "
    mseReadOptionsShowVarLine["line_check_invert"]=""
    mseReadOptionsShowVarLine["line_check_has_linenumber"]="${mseShowLineNumber}"

    mseReturn=$(mse_file_read "$mseRawSection" "mseReadOptionsShowVarLine" "1" "0")
  fi

  printf "${mseReturn%%[[:cntrl:]]*}"
}
MSE_GLOBAL_CMD["config show variableLine"]="mse_config_showVariableLine"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_config_showVariableLine_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ShowLineNumber :: o :: bool :: 0"
}
