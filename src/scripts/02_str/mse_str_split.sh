#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua um split na string passada usando o separador indicado.
#
# @param string $1
# Separador
#
# @param string $2
# String original (que será 'esplitada')
#
# @param bool $3
# Indique "1" para eliminar strings vazias.
# Omitindo ou informando "0" as strings vazias serão mantidas.
#
# @return
# Preenche o array global 'MSE_GLOBAL_MODULE_SPLIT_RESULT' com o resultado
# do 'split' feito.
mse_str_split() {
  local mseDelimiter
  local mseString
  local mseSubStr
  local mseAllowEmpty

  unset MSE_GLOBAL_MODULE_SPLIT_RESULT
  declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT

  mseDelimiter="$1"
  mseString="$2"
  mseSubStr=""
  mseAllowEmpty="0"

  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseAllowEmpty="1"
  fi

  while [ "${mseString}" != "" ]; do
    #
    # Não existindo nenhum delimitador...
    if [[ "$mseString" != *"$mseDelimiter"* ]]; then
      MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseString")
      break
    else
      mseSubStr="${mseString%%${mseDelimiter}*}"
      if [ "${mseSubStr}" != "" ] || [ "${mseAllowEmpty}" == "0" ]; then
        MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseSubStr")
      fi

      mseString="${mseString#*${mseDelimiter}}"
    fi
  done
}
MSE_GLOBAL_CMD["str split"]="mse_str_split"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_split_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="AllowEmpty :: o :: bool"
}
