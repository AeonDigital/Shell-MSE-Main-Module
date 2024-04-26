#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Mostra os dados de uma seção customizada.
#
# @param assoc $1
# Nome do array associativo que contém os dados da seção que será mostrada.
#
# @return string
mse_manual_theme_default_custom_section() {
  unset mseArrStr
  declare -a mseArrStr=()
  declare -n mseTmpSectionData="${1}"
  local mseTmpIndent="  "

  local mseTmpTitle="${mseTmpSectionData["title"]}"
  local mseTmpSummary="${mseTmpSectionData["summary"]}"
  local mseTmpDescription="${mseTmpSectionData["description"]}"
  local mseTmpSubSections="${mseTmpSectionData["subsections"]}"


  if [ "${mseTmpTitle}" != "" ]; then
    mseArrStr+=("# ${mseTmpTitle}")
    mseArrStr+=("")
  fi
  if [ "${mseTmpSummary}" != "" ]; then
    mse_man_show_theme_default_custom_section_split_in_lines "mseArrStr" "${mseTmpSummary}" "${mseTmpIndent}"
    mseArrStr+=("")

    if [ "${mseTmpDescription}" != "" ]; then
      mse_man_show_theme_default_custom_section_split_in_lines "mseArrStr" "${mseTmpDescription}" "${mseTmpIndent}"
      mseArrStr+=("")
    fi
  fi
  if [ "${mseTmpSubSections}" != "" ]; then
    mseArrStr+=("${mseTmpSubSections}")
  fi


  printf "%s\n" "${mseArrStr[@]}"
}


## seguir daqui fazendo a apresentação e tals... cores, ajustes e tudo o mais
mse_man_show_theme_default_custom_section_split_in_lines() {
  declare -n mseInnerArrStr="${1}"

  local mseTmpArrLine=""
  unset mseTmpArrLines
  declare -a mseTmpArrLines=()

  mse_str_split_inLines "mseTmpArrLines" "${2}"

  for mseTmpArrLine in "${mseTmpArrLines[@]}"; do
    mseInnerArrStr+=("${3}${mseTmpArrLine}")
  done
}