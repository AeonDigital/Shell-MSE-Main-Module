#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Usado em conjunto com um "alias" que facilite chegar a este comando,
# permite evocar funções previamente definidas de forma menos verbosa.
#
# @param string $1
# Nome da função alvo.
#
# @param bool ${2..}
# Demais parametros que serão passados para a função alvo.
#
# @return
# Informações de uso da função alvo.
#
# @example
# Considerando que existe um "alias" para esta função chamado "mse":
#
#   > mse search replace
#
#   O exemplo acima será o mesmo que evocar:
#   > mse_mmod_searchFunction replace
#
mse_mmod_cmd() {

  if [ "$#" -ge 1 ] && [ "$1" != "" ]; then
    local i
    local mseOffSet=1
    local mseLength="$#"
    local mseOriginalCmd=""
    local mseFunctionName=""


    if [ ! -z "${MSE_GLOBAL_CMD_COMPARE[${1^^}]+x}" ]; then
      mseOriginalCmd="${MSE_GLOBAL_CMD_COMPARE[${1^^}]}"

      if [ ! -z "${MSE_GLOBAL_CMD[$mseOriginalCmd]+x}" ]; then
        mseFunctionName="${MSE_GLOBAL_CMD[${mseOriginalCmd}]}"
      fi
    fi



    #
    # Verifica se é um nome de comando extenso, ou seja,
    # cujo nome está dividido em mais de uma string...
    if [ "${mseFunctionName}" == "" ] && [ "${mseLength}" -ge 2 ]; then
      local mseCmd="$1"

      for ((i=2; i<=mseLength; i++)); do
        mseCmd+="_${!i}"

        if [ ! -z "${MSE_GLOBAL_CMD_COMPARE[${mseCmd^^}]+x}" ]; then
          mseOriginalCmd="${MSE_GLOBAL_CMD_COMPARE[${mseCmd^^}]}"

          if [ ! -z "${MSE_GLOBAL_CMD[$mseOriginalCmd]+x}" ]; then
            mseFunctionName="${MSE_GLOBAL_CMD[${mseOriginalCmd}]}"

            if [ "${mseFunctionName}" != "" ]; then
              mseOffSet="$i"
              break
            fi
          fi
        fi
      done
    fi



    if [ "${mseFunctionName}" == "" ]; then
      local mseMSG
      mseMSG=$(mse_str_replacePlaceHolder "${lbl_cmd_commandNotFound}" "CMD" "$1")
      mse_inter_alertUser "i" "" "${mseMSG}"
    else
      local mseParans=("$@")
      mseParans=("${mseParans[@]:${mseOffSet}}")

      if [ "${mseParans[0]}" == "--" ]; then
        mseParans=("${mseParans[@]:1}")
      fi

      "$mseFunctionName" "${mseParans[@]}"
    fi
  fi
}
