#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compila as informações extraídas do arquivo de manual indicado.
mse_man_compile_data() {
  local mseTargetFile="${1}"
  local mseInternalStrCompileManName="${2}"
  declare -n mseInternalAssocCompileManName="${mseInternalStrCompileManName}"
  local mseInternalStrCompileManOrder="${3}"
  declare -n mseInternalArrCompileManOrder="${mseInternalStrCompileManOrder}"


  mse_man_reset_data
  mse_man_extract_sections_data "${mseTargetFile}"


  declare -a mseExpectedSectionSubParts=("title" "summary" "description" "subsections");
  declare -a mseExpectedSectionParameterProperties=("name" "type" "aka" "default" "min" "max" "options_ci" "options_cs" "list_cl" "list_op" "hint" "description");

  local mseSectionName
  local mseSectionSubPart
  local mseSectionParameterName
  local mseSectionParameterPropertyName

  local mseNewKey
  for mseSectionName in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    mse_man_process_section_data "${mseSectionName}" "1"

    for mseSectionSubPart in "${mseExpectedSectionSubParts[@]}"; do
      mseNewKey="${mseSectionName}_${mseSectionSubPart}"
      mseInternalAssocCompileManName["${mseNewKey}"]="${MSE_MAN_SECTION_DATA[${mseSectionSubPart}]}"
      mseInternalArrCompileManOrder+=("${mseNewKey}")

      if [ "${mseSectionName}" == "parameters" ] && [ "${mseSectionSubPart}" == "subsections" ] && [ "${MSE_MAN_SECTION_DATA["subsections"]}" != "" ]; then
        mse_man_process_parameters "${MSE_MAN_SECTION_DATA[subsections]}"
        for mseSectionParameterName in "${MSE_MAN_PARAMETERS_ORDER[@]}"; do
          for mseSectionParameterPropertyName in "${mseExpectedSectionParameterProperties[@]}" ; do
            mseNewKey="${mseSectionName}_${mseSectionParameterName}_${mseSectionParameterPropertyName}"
            mseNewKey="${mseNewKey,,}"
            mseInternalAssocCompileManName["${mseNewKey}"]="${MSE_MAN_PARAMETERS_DATA["${mseSectionParameterName}_${mseSectionParameterPropertyName}"]}"
            mseInternalArrCompileManOrder+=("${mseNewKey}")
          done
        done
      fi
    done
  done
}