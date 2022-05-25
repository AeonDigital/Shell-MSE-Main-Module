#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe na tela o nome de cada uma das funções que faz parte do módulo de
# nome selecionado.
#
# @param string $1
# Especifique o nome de um módulo atualmente carregado para ver suas
# respectivas funções.
#
# @param string $2
# Opcional.
# Se definido, será usado como filtro para o nome das funções a serem
# retornadas.
mse_mmod_showModuleFunctions() {
  local mseReturn
  local mseModuleIndex=""
  local mseShowHelp=0

  if [ $# == 0 ] || [ "$1" == "" ]; then
    mseShowHelp=1
  else
    mseModuleIndex=$(mse_check_hasValueInArray "$1" "MSE_GLOBAL_MODULES" "1" "1")
    if [ "${mseModuleIndex}" == "" ]; then
      mseShowHelp=1
    fi
  fi


  #
  # Se o módulo indicado não existe...
  if [ "${mseShowHelp}" == 1 ]; then
    mseReturn=$(mse_str_replacePlaceHolder "${lbl_mmod_invalidModuleName}" "MODULE" "$1")
  else
    local mseKey
    local msePath
    local mseFunction
    local mseModuleName="${MSE_GLOBAL_MODULES[$mseModuleIndex]}"
    local mseArrReturn=()
    local mseFilter=""

    if [ $# -ge 2 ] && [ "$2" != "" ]; then
      mseFilter="$2"
    fi

    #
    # Seta o bash para efetuar comparações de string
    # de forma 'case-insensitive'
    shopt -s nocasematch

    #
    # Percorre a lista de funções
    for mseKey in "${!MSE_GLOBAL_MODULES_FUNCTIONS[@]}"; do
      msePath="${MSE_GLOBAL_MODULES_FUNCTIONS[$mseKey]}"

      #
      # Apenas se a função pertence ao módulo indicado...
      if [ "${mseKey%::*}" == "${mseModuleName}" ]; then
        mseFunction="${mseKey#*::}"

        if [ "${mseFilter}" == "" ] || [[ "${mseFunction}" =~ "${mseFilter}" ]]; then
          mseArrReturn+=("${mseFunction}")
        fi
      fi
    done

    #
    # Reseta o bash para efetuar comparações de string
    # de forma 'case-sensitive' que é o padrão!
    shopt -u nocasematch


    if [ "${#mseArrReturn[@]}" -ge 1 ]; then
      IFS=$'\n'
      mseArrReturn=($(sort <<< "${mseArrReturn[*]}"))
      unset IFS

      mseReturn=$(printf "%s\n" "${mseArrReturn[@]}")
    fi
  fi


  printf "${mseReturn}\n"
}
