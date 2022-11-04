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
# @param bool $4
# Indique "1" para que cada elemento encontrado seja passado por um "trim".
# Omitindo ou informando "0" nada será feito.
#
# @return
# Preenche o array global 'MSE_GLOBAL_MODULE_SPLIT_RESULT' com o resultado
# do 'split' feito.
mse_str_split() {
  local mseDelimiter
  local mseString
  local mseSubStr
  local mseRemoveEmpty

  unset MSE_GLOBAL_MODULE_SPLIT_RESULT
  declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT

  mseDelimiter="$1"
  mseString="$2"
  mseSubStr=""
  mseRemoveEmpty="0"
  mseTrimElements="0"

  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseRemoveEmpty="1"
  fi

  if [ $# -ge 4 ] && [ "$4" == "1" ]; then
    mseTrimElements="1"
  fi

  while [ "${mseString}" != "" ]; do
    #
    # Não existindo nenhum delimitador...
    if [[ "$mseString" != *"$mseDelimiter"* ]]; then
      if [ "${mseTrimElements}" == "1" ]; then
        mseString=$(mse_str_trim "${mseString}")
      fi

      MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseString")
      break
    else
      mseSubStr="${mseString%%${mseDelimiter}*}"

      if [ "${mseTrimElements}" == "1" ]; then
        mseSubStr=$(mse_str_trim "${mseSubStr}")
      fi

      if [ "${mseSubStr}" != "" ] || [ "${mseRemoveEmpty}" == "0" ]; then
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
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="RemoveEmpty :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Trim :: o :: bool"



  local mseTmpThisDirectory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  local msePathToLocaleParamDescription="${mseTmpThisDirectory}/assets/locale/${MSE_GLOBAL_MODULE_LOCALE}/completion/mse_str_split.sh"
  if [ -f "${msePathToLocaleParamDescription}" ]; then
    . "${msePathToLocaleParamDescription}"
  fi
}
