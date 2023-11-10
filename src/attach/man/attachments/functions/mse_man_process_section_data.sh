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
# - [title]     -> Primeira linha não vazia da seção (sempre em 1 única linha)
# - summary     -> Após o título, primeira coleção de linhas contiguas de
#                  informação até encontrar a primeira linha vazia.
# - description -> Toda informação existênte após o sumário até o início da
#                  primeira subseção, se houver.
# - subsections -> Coleção de subseções presentes após a descrição.
mse_man_process_section_data() {
  local mseTargetAssocArrayName="${1}"
  declare -n mseTargetAssocArray="${1}"
  local mseTargetSectionName="${2}"
  local mseTargetSectionLevel="${3}"


  if [ "${mseTargetSectionName}" != "" ] && [ $(mse_is_int "${mseTargetSectionLevel}") == "1" ] && [ "${#mseTargetAssocArray[@]}" -gt "0" ]; then
    if [ $(mse_array_has_key "${mseTargetSectionName}" "${mseTargetAssocArrayName}") == "1" ]; then
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
        local mseHashOpenSectionInSubLevel=$(mse_str_pad "" "#" "${mseTargetSectionLevel}" "l")

        local msePartTitle=""
        local msePartSummary=""
        local msePartDescription=""
        local msePartSubsections=""

        IFS=$'\n'
        while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
          mseLineRaw=$(mse_str_trim_right "${mseLineRaw}")

          if [ "${mseInContent}" == "0" ] && [ "${mseLineRaw}" != "" ]; then
            mseInContent="1"
            msePartTitle="${mseLineRaw##*# }"

            mseTargetPart="summary"
          else
            if [ "${mseInContent}" == "1" ]; then
              if [[ "${mseLineRaw}" == "#"* ]]; then
                mseTargetPart="subsections"
              fi

              case "${mseTargetPart}" in
                summary)
                  if [ "${msePartSummary}" == "" ]; then
                    if [ "${mseLineRaw}" != "" ]; then
                      msePartSummary+="\n${mseLineRaw}"
                    fi
                  else
                    if [ "${mseLineRaw}" == "" ]; then
                      mseTargetPart="description"
                    else
                      msePartSummary+="\n${mseLineRaw}"
                    fi
                  fi
                ;;
                description)
                  if [ "${msePartDescription}" != "" ] || [ "${mseLineRaw}" != "" ]; then
                    msePartDescription+="\n${mseLineRaw}"
                  fi
                ;;
                subsections)
                  msePartSubsections+="\n${mseLineRaw}"
                ;;
              esac
            fi
          fi

        done <<< "${mseTargetSectionContent}"
        IFS=$' \t\n'


        msePartTitle=$(mse_str_trim "${msePartTitle}")
        msePartSummary=$(mse_str_trim "${msePartSummary}")
        msePartDescription=$(mse_str_trim "${msePartDescription}")
        msePartSubsections=$(mse_str_trim "${msePartSubsections}")

        MSE_MAN_GENERIC_SECTION_DATA["title"]=$(mse_normalize_string "${msePartTitle}")
        MSE_MAN_GENERIC_SECTION_DATA["summary"]=$(mse_normalize_string "${msePartSummary}")
        MSE_MAN_GENERIC_SECTION_DATA["description"]=$(mse_normalize_string "${msePartDescription}")
        MSE_MAN_GENERIC_SECTION_DATA["subsections"]=$(mse_normalize_string "${msePartSubsections}")
      fi
    fi
  fi
}