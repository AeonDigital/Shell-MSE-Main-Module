#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe o nome dos módulos atualmente carregados em uma lista.
#
# @param bool $1
# Indica se deve mostrar outras informações dos módulos além do
# nome.
#   - Omita ou indique "0" para apresentar apenas o nome.
#   - Indique "1" se deseja ver outras informações.
#
# @return
# Lista dos módulos conforme a configuração indicada.
mse_mmod_listModules() {
  local mseShowData=0
  if [ $# -ge 1 ] || [ "$1" == "1" ]; then
    mseShowData=1
  fi

  #
  # Se for para apresentar apenas a lista de ítens...
  if [ "$mseShowData" == "0" ]; then
    printf "%s\n" "${MSE_GLOBAL_MODULES[@]}"
  else
    local i
    local mseTotalModules="${#MSE_GLOBAL_MODULES[@]}"

    local mseModuleName
    local mseModuleTotalSubModules
    local mseModuleTotalFunctions


    for ((i=0; i<mseTotalModules; i++)); do
      mseModuleName="${MSE_GLOBAL_MODULES[$i]}"
      mseModuleTotalSubModules=0
      mseModuleTotalFunctions=0

      #
      # verifica se existem submódulos
      if [ "${MSE_GLOBAL_MODULES_SUBMODULES[$mseModuleName]}" != "" ]; then
        mse_str_split "::" "${MSE_GLOBAL_MODULES_SUBMODULES[$mseModuleName]}"
      fi
    done
  fi
}
