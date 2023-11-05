#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Lê todo o arquivo de manual (MarkDown) indicado e coleta linha a linha as
# informações das seções principais.
#
# @param string $1
# Caminho até o arquivo do manual.
#
# @param string $2
# Nome das seções do documento que devem ser exibidas.
#
# Se o valor passado for ignorado ou inválido, todas as seções padrões
# serão mostradas.
# Seções customizadas precisam ser informadas aqui para serem reconhecidas.
#
# @return
# Os dados de cada seção do manual serão alocados no array associativo
# 'MSE_MAN_MAIN_SECTIONS_DATA' sob uma chave que resulta do seu próprio nome
# que será 'normalizado' a partir do processo de
# 'mse_man_normalize_section_name'.
mse_man_extract_main_sections_data() {
  mse_man_reset_data

  local mseFile="${1}"
  local mseSections="${2}"


  local mseDefaultSections=" synopsis description parameters returns examples dependencies "
  declare -a mseArrDefaultSections=()
  mse_str_convert_toArray "mseArrDefaultSections" "${mseDefaultSections}"

  if [ "${mseSections}" == "" ]; then
    mseSections="${mseDefaultSections}"
  else
    mseSections="${mseSections/./${mseDefaultSections}}"
  fi

  declare -a mseTargetSections=()
  mse_str_convert_toArray "mseTargetSections" "${mseSections}"

  local mseI
  local mseS
  for mseI in "${!mseTargetSections[@]}"; do
    mseTargetSections["${mseI}"]=$(mse_man_normalize_section_name "${mseTargetSections["${mseI}"]}")
  done


  local mseFileContent=""
  if [ -f "${mseFile}" ]; then
    mseFileContent=$(< "${mseFile}")
  fi


  if [ "${mseFileContent}" != "" ]; then
    local mseLineRaw=""
    local mseInTargetSection="0"
    local mseInTargetSectionName=""


    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [[ "${mseLineRaw}" == "# "* ]]; then
        if [[ "${mseLineRaw,,}" == "# returns"* ]]; then
          mseInTargetSectionName="returns"
        else
          mseInTargetSectionName=$(mse_man_normalize_section_name "${mseLineRaw}")
        fi
        mseInTargetSection=$(mse_array_has_value "${mseInTargetSectionName}" "mseTargetSections")

        if [ "${mseInTargetSection}" == "1" ]; then
          MSE_MAN_MAIN_SECTIONS_ORDER+=("${mseInTargetSectionName}")
        fi
      fi


      if [ "${mseInTargetSection}" == "1" ]; then
        mseLineRaw="${mseLineRaw//&nbsp;/ }"

        if [ -z "${MSE_MAN_MAIN_SECTIONS_DATA[$mseInTargetSectionName]+x}" ]; then
          MSE_MAN_MAIN_SECTIONS_DATA[${mseInTargetSectionName}]="${mseLineRaw}"
        else
          MSE_MAN_MAIN_SECTIONS_DATA[${mseInTargetSectionName}]+="\n${mseLineRaw}"
        fi
      fi
    done <<< "${mseFileContent}"
    IFS=$' \t\n'


    local mseKey
    for mseKey in "${!MSE_MAN_MAIN_SECTIONS_DATA[@]}"; do
      MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]=$(mse_str_trim "${MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]}")
    done
  fi
}