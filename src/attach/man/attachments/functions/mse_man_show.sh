#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Imprime na tela as informações do manual passado conforme regras definidas
# entre os parametros.
#
# A formatação do documento original será usada para sua apresentação exceto
# se o `theme` selecionado fizer um tratamento diferenciado.
#
#
# @param assoc $1
# Nome do array associativo que contém os dados do manual.
#
# @param array $2
# Nome do array que contém a lista das seções compiladas a serem exibidas.
#
# @param string $3
# Regras de como exibir o manual.
# [ Este parametro é o mesmo $2 recebido em `mse_man` ]
#
#
# @return string
mse_man_show() {
  local mseTmpCmd=""

  mseTmpCmd="${MSE_MANUAL_THEME_NAME}_set_colors"
  $mseTmpCmd

  #declare -n mseShowAssocCompiledManData="${1}"
  #declare -n mseShowArraySections="${2}"


  #
  # Monta seção 'synopsis'
  mseTmpCmd="${MSE_MANUAL_THEME_NAME}_show_synopsis"
  $mseTmpCmd "${1}" "${2}"

  #declare -a mseManualShowRules=()

  # mse_man_process_show_parse_rules "mseManualShowRules" "${3}"



  # local mseTargetSectionName=""
  # local mseTargetSectionNameHasWildcard="0"
  # for mseTargetSectionName in "${mseManualShowRules[@]}"; do
  #   echo "search by ${mseTargetSectionName}"

  #   if [[ "${mseTargetSectionName}" == *"_*_"* ]]; then
  #     mseTargetSectionNameHasWildcard="1"
  #   fi

  #   if [ "${mseTargetSectionNameHasWildcard}" == "0" ]; then
  #     local mseRawFullSectionName=""
  #     for mseRawFullSectionName in "${mseShowArrayCompiledManOrder[@]}"; do
  #       if [ "${mseTargetSectionName}" == "${mseRawFullSectionName}" ] || [[ "${mseRawFullSectionName}" == "${mseTargetSectionName}"* ]]; then
  #         echo " - ${mseRawFullSectionName}"
  #       fi
  #     done
  #   fi
  # done
}