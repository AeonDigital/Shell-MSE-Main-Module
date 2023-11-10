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


  local mseSectionName
  local mseSectionSubPart
  local mseSectionParameterName

  local mseNewKey
  for mseSectionName in "${MSE_MAN_MAIN_SECTIONS_ORDER[@]}"; do
    mse_man_process_section_data "${mseSectionName}" "1"

    for mseSectionSubPart in title summary description subsections; do
      mseNewKey="${mseSectionName}_${mseSectionSubPart}"
      mseInternalAssocCompileManName["${mseNewKey}"]="${MSE_MAN_SECTION_DATA[${mseSectionSubPart}]}"
      mseInternalArrCompileManOrder+=("${mseNewKey}")

      if [ "${mseSectionName}" == "parameters" ] && [ "${mseSectionSubPart}" == "subsections" ] && [ "${MSE_MAN_SECTION_DATA["subsections"]}" != "" ]; then
        mse_man_process_parameters "${MSE_MAN_SECTION_DATA[subsections]}"

        for mseSectionParameterName in "${MSE_MAN_PARAMETERS_ORDER[@]}"; do
          mseNewKey="${mseSectionName}_${mseSectionParameterName}"
          mseInternalAssocCompileManName["${mseNewKey}"]="${MSE_MAN_PARAMETERS_ORDER[${mseSectionParameterName}]}"

          mseInternalArrCompileManOrder+=("${mseNewKey}")
        done
      fi
    done
  done
}