#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua a validação dos argumentos de uma função conforme as regras
# especificadas nas regras indicadas.
#
# @param int $1
# Total de argumentos que foram passados para a função sendo testada.
# Este valor pode ser obtido pela variável especial '$#'.
#
# @param array $2
# Nome do array associativo contendo as regras que servirão para testar os
# argumentos passados.
#
# @param bool $3
# Opcional.
# Omita, informe "" ou "0" para que a validação ocorra naturalmente.
# Informe "1" para que o algoritmo saiba que está validando suas próprias
# entradas.
#
# @return
# '1' se todos os parametros estiverem corretos.
# Mensagem de erro encontrada (referente ao primeiro erro de validação).
mse_mmod_validateArgs() {
  local mseReturn

  #
  # Define a validação dos argumentos desta própria função
  mseReturn=1
  # declare -A mseCheckParans
  # mseCheckParans["count"]="$#"
  # mseCheckParans["param_1"]="TotalArgs :: r :: int :: . :: 2 :: 2"
  # mseCheckParans["param_2"]="ParamRules :: r :: assocName :: . :: count"
  # mseCheckParans["param_2_count"]="count :: r :: int :: . :: 0"

  # if [ $# -le 1 ] || [ "$2" != "1" ]; then
  #   mseReturn=$(mse_mmod_validateArgs "mseCheckParans" "1")
  # fi


  #
  # Tendo recebido as informações mínimas necessárias para efetuar a validação
  # dos parametros indicados...
  if [ "$mseReturn" == 1 ]; then
    local mseTotalArgs
    local mseParamRuleRawName
    local mseParamRuleEvalName

    local mseParamRawKey
    local mseParamRawValue


    mseTotalArgs="$1"
    mseParamRuleRawName="$2"
    mseParamRuleEvalName="$2[@]"

    for mseParamRawKey in $(eval echo '${!'$mseParamRuleEvalName'}'); do
      mseParamRawValue="${mseParamRuleRawName}[$mseParamRawKey]"
      mseParamRawValue="${!mseParamRawValue}"
      echo "${mseParamRawKey}"
      echo "${mseParamRawValue}"
    done
  fi


  #printf "${mseReturn}"
}


mse_mmod_test() {
  declare -A checkParams
  checkParams["count"]="$#"
  checkParams["param_1"]="Nome :: r :: string       :: default :: 20"

  mse_mmod_validateArgs "$#" "checkParams"
  #checkParams["param_2"]="r :: int          :: notempty :: 50 :: 0 :: 100"
  #checkParams["param_3"]="o :: arrayName    :: defaultArrayName :: 1 :: 5"
  #checkParams["param_4"]="o :: fileName     :: defaultFileName"
  #checkParams["param_5"]="o :: dirName      :: defaultFileName"
  #checkParams["param_6"]="o :: functionName :: defaultFileName"
  #checkParams["param_7"]="o :: list         :: "
  #checkParams["param_7_list_labels"]="prepend, append, replace"
  #checkParams["param_7_list_values"]="p, a, r"


}
