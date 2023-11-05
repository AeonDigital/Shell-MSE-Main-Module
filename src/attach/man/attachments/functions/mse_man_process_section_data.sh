#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Processa as linhas de dados de uma seção armazenada em um array associativo
# para extrair as informações do mesmo de forma estruturada.
#
# Esta função pode ser acionada recursivamente caso existam subseções.
#
# @param string $1
# Nome do array associativo em que a informação a ser processada se encontra.
#
# @param string $2
# Nome da seção que será processada.
#
# @param int $3
# Nível da seção que está sendo processada.
# Use 1 para seções em primeiro nível, 2 para segundo e assim por diante.
#
# @return
# Os dados obtidos serão armazenados no array associativo
# 'MSE_MAN_SECTIONS_DATA'.
mse_man_process_section_data() {
  local mseTargetAssocArrayName="${1}"
  local mseTargetSectionName="${2}"
  local mseTargetSectionLevel="${3}"


  mse_man_process_section_generic "${mseTargetAssocArrayName}" "${mseTargetSectionName}" "${mseTargetSectionLevel}"

  local mseSectionPart=""
  local mseSectionPartName=""
  local mseNextTargetSectionLevel=$((mseTargetSectionLevel+1))
  declare -a mseSectionParts=("title" "summary" "description" "subsections")
  for mseSectionPart in "${mseSectionParts[@]}"; do
    mseSectionPartName="${mseTargetSectionName}_${mseSectionPart}"

    MSE_MAN_SECTIONS_ORDER+=("${mseSectionPartName}")
    MSE_MAN_SECTIONS_DATA["${mseSectionPartName}"]="${MSE_MAN_GENERIC_SECTION_DATA[${mseSectionPart}]}"

    if [ "${mseSectionPart}" == "subsections" ] && [ "${MSE_MAN_SECTIONS_DATA[${mseSectionPartName}]}" != "" ]; then
      if [ "${mseTargetSectionName}" == "parameters" ]; then
        mse_man_process_parameters "${MSE_MAN_GENERIC_SECTION_DATA[${mseSectionPart}]}"
      else
        mse_man_process_section_data "MSE_MAN_SECTIONS_DATA" "${mseSectionPartName}" "${mseNextTargetSectionLevel}"
      fi
    fi
  done
}