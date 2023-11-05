#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Processa as linhas de dados de uma seção armazenada em um array associativo
# para extrair as informações genéricas definidas.
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
# 'MSE_MAN_GENERIC_SECTION_DATA'.
#
# Ao final do processo as seguintes chaves devem ser preenchidas com os
# dados encontrados:
# - title
# - summary
# - description
# - subsections
mse_man_process_section_generic() {
  local mseTargetAssocArrayName="${1}"
  declare -n mseTargetAssocArray="${1}"
  local mseTargetSectionName="${2}"
  local mseTargetSectionLevel="${3}"

  local mseIsLevelOk=$(mse_is_int "${mseTargetSectionLevel}")

  if [ "${mseTargetSectionName}" != "" ] && [ "${mseIsLevelOk}" == "1" ] && [ "${#mseTargetAssocArray[@]}" -gt "0" ]; then
    local mseHasTargetSection=$(mse_array_has_key "${mseTargetSectionName}" "${mseTargetAssocArrayName}")

    if [ "${mseHasTargetSection}" == "1" ]; then
      unset MSE_MAN_GENERIC_SECTION_DATA
      declare -Ag MSE_MAN_GENERIC_SECTION_DATA

      MSE_MAN_GENERIC_SECTION_DATA["title"]=""
      MSE_MAN_GENERIC_SECTION_DATA["summary"]=""
      MSE_MAN_GENERIC_SECTION_DATA["description"]=""
      MSE_MAN_GENERIC_SECTION_DATA["subsections"]=""

      local mseTargetSectionContent="${mseTargetAssocArray[${mseTargetSectionName}]}"
      if [ "${mseTargetSectionContent}" != "" ]; then
        local mseLineRaw=""
        local mseInContent="0"
        local mseTargetPart=""

        ((mseTargetSectionLevel++))
        local mseOpenSectionHash=$(mse_str_pad "" "#" "${mseTargetSectionLevel}" "l")
        local mseOpenSubSectionHash="${mseOpenSectionHash}#"


        IFS=$'\n'
        while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
          if [ "${mseInContent}" == "0" ] && [ "${mseLineRaw}" != "" ]; then
            mseInContent="1"
            mseTargetPart="title"
          fi


          if [ "${mseInContent}" == "1" ]; then
            if [[ "${mseLineRaw}" == "${mseOpenSectionHash} "* ]] || [[ "${mseLineRaw}" == "${mseOpenSubSectionHash} "* ]]; then
              mseTargetPart="subsections"
            fi

            case "${mseTargetPart}" in
              title)
                MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]+="${mseLineRaw##*# }"
                mseTargetPart="summary"
              ;;
              summary)
                if [ "${MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]}" == "" ]; then
                  if [ "${mseLineRaw}" != "" ]; then
                    MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]+="\n${mseLineRaw}"
                  fi
                else
                  if [ "${mseLineRaw}" == "" ]; then
                    mseTargetPart="description"
                  else
                    MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]+="\n${mseLineRaw}"
                  fi
                fi
              ;;
              description)
                if [ "${MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]}" != "" ] || [ "${mseLineRaw}" != "" ]; then
                  MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]+="\n${mseLineRaw}"
                fi
              ;;
              subsections)
                MSE_MAN_GENERIC_SECTION_DATA[${mseTargetPart}]+="\n${mseLineRaw}"
              ;;
            esac
          fi

        done <<< "${mseTargetSectionContent}"
        IFS=$' \t\n'


        MSE_MAN_GENERIC_SECTION_DATA["title"]=$(mse_str_trim "${MSE_MAN_GENERIC_SECTION_DATA["title"]}")
        MSE_MAN_GENERIC_SECTION_DATA["summary"]=$(mse_str_trim "${MSE_MAN_GENERIC_SECTION_DATA["summary"]}")
        MSE_MAN_GENERIC_SECTION_DATA["description"]=$(mse_str_trim "${MSE_MAN_GENERIC_SECTION_DATA["description"]}")
        MSE_MAN_GENERIC_SECTION_DATA["subsections"]=$(mse_str_trim "${MSE_MAN_GENERIC_SECTION_DATA["subsections"]}")
      fi
    fi
  fi
}