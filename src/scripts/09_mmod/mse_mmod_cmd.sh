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
    local mseFunctionName="${MSE_GLOBAL_CMD[$1]}"

    #
    # Verifica o nome do comando de forma complexa
    if [ "${mseFunctionName}" == "" ] && [ "${mseLength}" -ge 2 ]; then
      local mseCmd="$1"

      for ((i=2; i<=mseLength; i++)); do
        mseCmd+=" ${!i}"

        mseFunctionName="${MSE_GLOBAL_CMD[$mseCmd]}"
        if [ "${mseFunctionName}" != "" ]; then
          mseOffSet="$i"
          break
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

      "$mseFunctionName" "${mseParans[@]}"
    fi
  fi
}
