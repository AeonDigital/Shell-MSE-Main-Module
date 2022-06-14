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
# Demais identificadores ou parametros que serão passados para a função alvo.
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
    local mseTgtFunction=$(mse_mmod_cmd_search "$@")

    local mseOffSet=""
    local mseFunctionName=""

    if [ "${mseTgtFunction}" != "" ]; then
      mseOffSet="${mseTgtFunction%#*}"
      mseFunctionName="${mseTgtFunction#*#}"
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
      elif [ "${mseParans[0]}" == "--help" ]; then
        mseParans=("${mseFunctionName}")
        mseFunctionName="mse_mmod_man"
      fi



      #
      # Se não existir uma função validadora, executa diretamente a função.
      if [ "$(type -t "${mseFunctionName}_vldtr")" != "function" ]; then
        "$mseFunctionName" "${mseParans[@]}"
      else
        #
        # Efetua a validação dos parametros da função
        mse_exec_validate "$mseFunctionName" "${mseParans[@]}" &> /dev/null

        #
        # Se bem sucedido, executa-a
        # senão, mostra o erro.
        if [ $? == 0 ]; then
          "$mseFunctionName" "${mseParans[@]}"
        else
          printf "${MSE_GLOBAL_LASTERR}"
        fi
      fi
    fi
  fi
}





#
# @desc
# A partir do comando digitado no prompt, identifica a função que deve ser
# executada
#
# @param string $1
# Nome da função alvo.
#
# @param bool ${2..}
# Demais identificadores ou parametros que serão passados para a função alvo.
#
# @return
# Não há retorno se, com os parametros passados não for possível identificar
# uma função alvo.
# Encontrando uma função alvo, retorna o nome da mesma em conjunto com o
# "offset" que identifica quantos parametros passados foram usados apenas
# como "alias" da respectiva função. Estas informações estarão separadas por
# um caracter "#" conforme o modelo abaixo:
#
# 2#mse_str_replace
mse_mmod_cmd_search() {
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


  if [ "${mseFunctionName}" != "" ]; then
    printf "${mseOffSet}#${mseFunctionName}"
  fi
}
