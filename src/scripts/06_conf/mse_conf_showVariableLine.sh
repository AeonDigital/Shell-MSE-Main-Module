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
mse_conf_showVariableLine()
{
  local mseReturn
  local mseRawSection
  local mseShowLineNumber

  mseShowLineNumber=0
  if [ $# -ge 4 ] && [ $4 == 1 ]; then
    mseShowLineNumber=1
  fi

  mseRawSection=$(mse_conf_showVariables "$1" "$2" "$mseShowLineNumber")
  mseReturn=""

  if [ "$mseRawSection" != "" ]; then
    mse_file_read_resetConfig

    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_hasVariable"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]="$3"
    MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"

    unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
    declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("#" ";")

    mseReturn=$(mse_file_read "$mseRawSection")
  fi

  printf "${mseReturn%%[[:cntrl:]]*}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_showVariableLine_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ShowLineNumber :: o :: bool :: 0"
}
