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
# Nome do array que contém a lista das seções compiladas na ordem de exibição.
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

  declare -n mseShowAssocCompiledManData="${1}"
  declare -n mseShowArrayCompiledManOrder="${2}"
  declare -a mseManualShowRules=()

  mse_man_process_show_parse_rules "mseManualShowRules" "${3}"
  printf "%s\n" "${mseManualShowRules[@]}"




  # local mseTargetSectionName=""
  # local mseRawFullSectionName=""

  # local mseRealSectionName=""
  # local msePartialSectionData=""


  # for mseTargetSectionName in "${mseArrTargetSections[@]}"; do
  #   unset mseCollectedSectionData
  #   declare -A mseCollectedSectionData

  #   for mseRawFullSectionName in "${mseShowArrayCompiledManOrder[@]}"; do
  #     if [[ "${mseRawFullSectionName}" == "${mseTargetSectionName}_"* ]]; then

  #       mseRealSectionName="${mseRawFullSectionName/${mseTargetSectionName}_/}"
  #       msePartialSectionData="${mseShowAssocCompiledManData[${mseRawFullSectionName}]}"
  #       if [ "${msePartialSectionData}" != "" ]; then
  #         mseCollectedSectionData["${mseRealSectionName}"]="${msePartialSectionData}"
  #       fi
  #     fi
  #   done

  #   if [ "${#mseCollectedSectionData[@]}" -gt "0" ]; then
  #     mseTmpCmd="${MSE_MANUAL_THEME_NAME}_custom_section"
  #     $mseTmpCmd "mseCollectedSectionData"
  #   fi
  # done
}