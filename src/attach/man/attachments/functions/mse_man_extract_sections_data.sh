#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Lê todo o arquivo de manual (MarkDown) indicado e coleta linha a linha as
# informações das seções principais existentes.
#
# @param string $1
# Caminho até o arquivo do manual.
#
# @return
# Os dados de cada seção do manual serão alocados no array associativo
# 'MSE_MAN_MAIN_SECTIONS_DATA' sob uma chave que resulta do seu próprio nome
# que será 'normalizado' a partir do processo de
# 'mse_man_normalize_section_name'.
mse_man_extract_sections_data() {
  mse_man_reset_data

  local mseFile="${1}"

  local mseFileContent=""
  if [ -f "${mseFile}" ]; then
    mseFileContent=$(< "${mseFile}")
  fi


  if [ "${mseFileContent}" != "" ]; then
    local mseLineRaw=""
    local mseTargetSectionName=""


    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [[ "${mseLineRaw}" == "# "* ]]; then
        if [[ "${mseLineRaw,,}" == "# returns"* ]]; then
          mseTargetSectionName="returns"
        else
          mseTargetSectionName=$(mse_man_normalize_section_name "${mseLineRaw}")
        fi

        MSE_MAN_MAIN_SECTIONS_ORDER+=("${mseTargetSectionName}")
      fi


      mseLineRaw="${mseLineRaw//&nbsp;/ }"

      if [ -z "${MSE_MAN_MAIN_SECTIONS_DATA[$mseTargetSectionName]+x}" ]; then
        MSE_MAN_MAIN_SECTIONS_DATA[${mseTargetSectionName}]="${mseLineRaw}"
      else
        MSE_MAN_MAIN_SECTIONS_DATA[${mseTargetSectionName}]+="\n${mseLineRaw}"
      fi
    done <<< "${mseFileContent}"
    IFS=$' \t\n'


    local mseKey
    for mseKey in "${!MSE_MAN_MAIN_SECTIONS_DATA[@]}"; do
      MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]=$(mse_str_trim "${MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]}")
    done
  fi
}