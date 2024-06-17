#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Renderiza a seção 'synopsis'
#
# @return string
mse_manual_theme_default_show_synopsis() {
  declare -n mseTmpAssocCompiledMan="${1}"
  declare -n mseTmpManualShowTargetSections="${2}"


  local mseTmpSectionTitle=""
  local mseTmpSectionSummary=""
  local mseTmpSectionDescription=""
  local mseTmpSectionSubsections=""


  local mseTmpTgtSectionName=""
  for mseTmpTgtSectionName in "${mseTmpManualShowTargetSections[@]}"; do
    case "${mseTmpTgtSectionName}" in
      "synopsis_title")
        mseTmpSectionTitle="${mseTmpAssocCompiledMan[${mseTmpTgtSectionName}]}"
      ;;
      "synopsis_summary")
        mseTmpSectionSummary="${mseTmpAssocCompiledMan[${mseTmpTgtSectionName}]}"
      ;;
      "synopsis_description")
        mseTmpSectionDescription="${mseTmpAssocCompiledMan[${mseTmpTgtSectionName}]}"
      ;;
      "synopsis_subsections")
        mseTmpSectionSubsections="${mseTmpAssocCompiledMan[${mseTmpTgtSectionName}]}"
      ;;
    esac
  done

  # a partir daqui vi que era necessário fazer o pré-processamento das cores do manual
  # como forma de agilizar esta etapa.
  # Quando finalizar é preciso voltar para este ponto


  local mseUseHashColor="${MSE_MANUAL_THEME_COLORS[mand_hash]}"
  local mseUseTitleColor="${MSE_MANUAL_THEME_COLORS[mand_title]}"
  local mseUseTextColor="${MSE_MANUAL_THEME_COLORS[mand_text]}"

  local strManualPart=""
  if [ "${mseTmpSectionTitle}" != "" ]; then
    strManualPart+="${mseUseHashColor}#${mseNONE} "
    strManualPart+="${mseUseTitleColor}${mseTmpSectionTitle}${mseNONE}"
    strManualPart+="\n\n"
  fi

  if [ "${mseTmpSectionSummary}" != "" ]; then
    strManualPart+="${mseUseTextColor}${mseTmpSectionSummary}${mseNONE}"
    strManualPart+="\n\n"
  fi

  if [ "${mseTmpSectionDescription}" != "" ]; then
    strManualPart+="${mseUseTextColor}${mseTmpSectionDescription}${mseNONE}"
    strManualPart+="\n\n"
  fi

  echo -ne "${strManualPart}"
}