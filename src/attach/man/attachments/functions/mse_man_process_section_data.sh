#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Processa as linhas de dados de uma seção armazenada no array associativo
# 'MSE_MAN_MAIN_SECTIONS_DATA' extraindo suas informações de forma genérica.
#
# Insere marcações que visam facilitar a futura insersão de personalizações como
# coloração e outras possibilidades oferecidas pelos themes.
#
# Deve ser usada após a execução do 'mse_man_extract_sections_data'.
#
# @param string $1
# Nome da seção que será processada.
#
# @param int $2
# Nível da seção que está sendo processada.
# Use 1 para seções em primeiro nível, 2 para segundo e assim por diante.
#
# @return
# Os dados obtidos serão armazenados no array associativo
# 'MSE_MAN_SECTION_DATA'.
#
# Ao final do processo as seguintes chaves devem ser preenchidas com os
# dados encontrados:
# - title       -> Primeira linha não vazia da seção (sempre em 1 única linha)
# - summary     -> Após o título, primeira coleção de linhas contiguas de
#                  informação até encontrar a primeira linha vazia.
# - description -> Toda informação existênte após o sumário até o início da
#                  primeira subseção, se houver.
# - subsections -> Coleção de subseções presentes após a descrição.
mse_man_process_section_data() {
  local mseTargetSectionName="${1}"
  local mseTargetSectionLevel="${2}"


  if [ "${mseTargetSectionName}" != "" ] && [ $(mse_is_int "${mseTargetSectionLevel}") == "1" ]; then
    unset MSE_MAN_SECTION_DATA
    declare -Ag MSE_MAN_SECTION_DATA

    MSE_MAN_SECTION_DATA["title"]=""
    MSE_MAN_SECTION_DATA["summary"]=""
    MSE_MAN_SECTION_DATA["description"]=""
    MSE_MAN_SECTION_DATA["subsections"]=""

    local mseTargetSectionContent="${MSE_MAN_MAIN_SECTIONS_DATA[${mseTargetSectionName}]}"
    if [ "${mseTargetSectionContent}" != "" ]; then
      local mseLineRaw=""
      local mseTargetPart="title"

      #((mseTargetSectionLevel++))
      #local mseHashOpenSectionInSubLevel=$(mse_str_pad "" "#" "${mseTargetSectionLevel}" "l")

      local msePartTitle=""
      local msePartSummary=""
      local msePartDescription=""
      local msePartSubsections=""



      local mseCurrentLineIsList=""
      local mseCurrentLineFirstChar=" "
      local msePreviousLineLastChar=" "
      local mseInsertSpace=""



      IFS=$'\n'
      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        if [ "${mseTargetPart}" == "title" ]; then
          mseLineRaw=$(mse_str_trim "${mseLineRaw}")

          if [ "${mseLineRaw}" != "" ]; then
            mseTargetPart="summary"
            msePartTitle="[[title]]${mseLineRaw##*# }[[/]]"
          fi
        elif [ "${mseTargetPart}" == "subsections" ]; then
          msePartSubsections+="\n${mseLineRaw}"
        else
          if [[ "${mseLineRaw}" == "#"* ]]; then
            mseTargetPart="subsections"
            msePartSubsections+="\n${mseLineRaw}"
          else

            mseInsertSpace=""
            mseCurrentLineFirstChar=" "
            if [ "${mseLineRaw}" != "" ]; then
              if [ $(mse_man_process_section_data_check_horizontal_rule "${mseLineRaw}") == "1" ]; then
                mseLineRaw="[[hr/]]"
              else
                mseCurrentLineFirstChar="${mseLineRaw:0:1}"

                if [[ "${mseLineRaw}" =~ "  "$ ]]; then
                  mseLineRaw=$(mse_str_trim_right "${mseLineRaw}")
                  mseLineRaw="${mseLineRaw}[[br/]]"
                else
                  mseLineRaw=$(mse_str_trim_right "${mseLineRaw}")
                fi

                mseCurrentLineIsList=$(mse_man_process_section_data_check_list "${mseLineRaw}")
                if [ "${mseCurrentLineIsList}" == "0" ] && [ "${mseCurrentLineFirstChar}" != " " ] && [ "${msePreviousLineLastChar}" != " " ]; then
                  mseInsertSpace=" "
                fi
              fi
            fi


            case "${mseTargetPart}" in
              summary)
                if [ "${msePartSummary}" == "" ]; then
                  if [ "${mseLineRaw}" != "" ]; then
                    msePartSummary+="${mseLineRaw}"
                  fi
                else
                  if [ "${mseLineRaw}" == "" ]; then
                    mseTargetPart="description"
                  else
                    msePartSummary+="${mseInsertSpace}${mseLineRaw}"
                  fi
                fi
              ;;
              description)
                if [ "${msePartDescription}" != "" ] || [ "${mseLineRaw}" != "" ]; then
                  if [ "${mseLineRaw}" == "" ]; then
                    msePartDescription+="\n"
                  else
                    if [ "${msePartDescription}" != "" ]; then
                      msePartDescription+="${mseInsertSpace}"
                    fi
                    msePartDescription+="${mseLineRaw}"
                  fi
                fi
              ;;
            esac


            msePreviousLineLastChar=" "
            if [[ ! "${mseLineRaw}" =~ '[[br/]]'$ ]]; then
              msePreviousLineLastChar="${mseLineRaw: -1:1}"
            fi
          fi
        fi
      done <<< "${mseTargetSectionContent}"
      IFS=$' \t\n'


      msePartTitle=$(mse_str_trim "${msePartTitle}")
      msePartSummary=$(mse_str_trim "${msePartSummary}")
      msePartDescription=$(mse_str_trim "${msePartDescription}")
      # msePartSubsections=$(mse_str_trim "${msePartSubsections}")

      msePartTitle=$(mse_normalize_string "${msePartTitle}")
      msePartSummary=$(mse_normalize_string "${msePartSummary}")
      msePartDescription=$(mse_normalize_string "${msePartDescription}")
      # #msePartSubsections=$(mse_normalize_string "${msePartSubsections}")

      MSE_MAN_SECTION_DATA["title"]="${msePartTitle}"
      MSE_MAN_SECTION_DATA["summary"]=$(mse_man_process_section_data_set_markups "${msePartSummary}")
      MSE_MAN_SECTION_DATA["description"]=$(mse_man_process_section_data_set_markups "${msePartDescription}")
      # #MSE_MAN_SECTION_DATA["subsections"]="${msePartSubsections}"
    fi
  fi
}



#
# Adiciona marcações no conteúdo de seção.
#
# @param string $1
# Conteúdo que será marcado.
#
# @return string
mse_man_process_section_data_set_markups() {
  unset mseSubSectionContentLines
  declare -a mseSubSectionContentLines=()
  mse_str_split_inLines "mseSubSectionContentLines" "${1}"

  local mseDefaultMarkUpSeparator="-=+∅+=-"
  declare -a mseMarkDownBoldItalicPatterns=('\*\*\*∅\*\*\*' '\*\*_∅_\*\*' '__\*∅\*__' '___∅___')
  declare -a mseMarkDownBoldPattern=('__∅__' '\*\*∅\*\*')
  declare -a mseMarkDownItalicPattern=('_∅_' '\*∅\*')

  # declare -a mseMarkDownBlockquotes=(">")
  # declare -a mseMarkDownListOrdered=("x. ")
  # declare -a mseMarkDownListUnordered=("- " "* " "+ ")


  local mseLineIndex=""
  local mseLineContent=""

  for mseLineIndex in "${!mseSubSectionContentLines[@]}"; do
    mseLineContent="${mseSubSectionContentLines[${mseLineIndex}]}"

    if [ "${mseLineContent}" != "" ]; then
      # Italic + Bold
      mseLineContent=$(mse_man_process_section_data_set_style "${mseLineContent}" "mseMarkDownBoldItalicPatterns" "[[BoldItalic]]" "[[/BoldItalic]]")
      # Bold
      mseLineContent=$(mse_man_process_section_data_set_style "${mseLineContent}" "mseMarkDownBoldPattern" "[[Bold]]" "[[/Bold]]")
      # Italic
      mseLineContent=$(mse_man_process_section_data_set_style "${mseLineContent}" "mseMarkDownItalicPattern" "[[Italic]]" "[[/Italic]]")
    fi

    mseSubSectionContentLines["${mseLineIndex}"]="${mseLineContent}"
  done

  mse_str_join "\n" "mseSubSectionContentLines"
}



#
# Verifica se o conteúdo da linha passado indica que a mesma
# deva ser renderizada como uma linha horizonal.
#
# @param string $1
# Linha que será avaliada
#
# @return bool
mse_man_process_section_data_check_horizontal_rule() {
  local mseStrLine=$(mse_str_trim_right "${1}")
  local mseTotalChars="${#mseStrLine}"
  local mseStrLineFirstChar="${mseStrLine:0:1}"

  local mseIsHorizontalRule="0"
  if [ "${mseTotalChars}" -ge "3" ] && ([ "${mseStrLineFirstChar}" == "_" ] || [ "${mseStrLineFirstChar}" == "-" ] || [ "${mseStrLineFirstChar}" == "*" ]); then
    mseIsHorizontalRule="1"

    for ((i=0; i<mseTotalChars; i++)); do
      if [ "${mseStrLine:$i:1}" != "${mseStrLineFirstChar}" ]; then
        mseIsHorizontalRule="0"
        break
      fi
    done
  fi
  echo -ne "${mseIsHorizontalRule}"
}



#
# Verifica se o conteúdo da linha passado indica que a mesma
# está definindo uma lista ordenada ou não ordenada.
#
# @param string $1
# Linha que será avaliada
#
# @return bool
mse_man_process_section_data_check_list() {
  local tmpTrimLine=$(mse_str_trim "${1}")
  local tmpFirstChars="${tmpTrimLine:0:2}"

  local mseIsList="0"
  if [ "${tmpFirstChars}" == "- " ] || [ "${tmpFirstChars}" == "* " ] || [ "${tmpFirstChars}" == "+ " ]; then
    mseIsList="1"
  else
    local tmpFirstChars="${tmpTrimLine%%. *}"
    local tmpFirstCharsAreNumber=$(mse_is_int "${tmpFirstChars}")
    local tmpStartWithNumberList=$(mse_str_contains_start "${tmpFirstChars}. " "${tmpTrimLine}")

    if [ "${tmpFirstCharsAreNumber}" == "1" ] && [ "${tmpStartWithNumberList}" == "1" ]; then
      mseIsList="1"
    fi
  fi
  echo -ne "${mseIsList}"
}



#
# Substitui a marcação markdown para estilos de formatação pela
# marcação indicada.
#
# @param string $1
# Linha que será avaliada.
#
# @param array $2
# Nome do array que contém os padrões que identificam a marcação que será
# substituída.
#
# @param string $3
# Marcação de abertura a ser usada no lugar da original.
#
# @param string $4
# Marcação de fechamento a ser usada no lugar da original.
#
# @return string
mse_man_process_section_data_set_style() {
  local mseTmpLine="${1}"
  declare -n mseTmpArrMarkDownPatterns="${2}"
  local mseTmpIniMarkUp="${3}"
  local mseTmpEndMarkUp="${4}"

  declare -a mseTmpMarkDownPatternParts=()
  local mseTmpMarkDownPatternPart=""

  local mseMarkUpSeparator="-=+∅+=-"


  for ((i=0; i<${#mseTmpArrMarkDownPatterns[@]}; i++)); do
    mse_str_split "mseTmpMarkDownPatternParts" "∅" "${mseTmpArrMarkDownPatterns[$i]}"

    for ((j=0; j<${#mseTmpMarkDownPatternParts[@]}; j++)); do
      mseTmpMarkDownPatternPart="${mseTmpMarkDownPatternParts[$j]}"
      mseTmpLine="${mseTmpLine//${mseTmpMarkDownPatternPart}/${mseMarkUpSeparator}}"
    done
  done


  declare -a mseTmpLineContentParts=()
  mse_str_split "mseTmpLineContentParts" "${mseMarkUpSeparator}" "${mseTmpLine}"


  local mseTmpMarkDownSearchPart=""
  local mseTmpMarkDownReplacePart=""
  for ((i=0; i<${#mseTmpLineContentParts[@]}; i++)); do
    mseTmpMarkDownSearchPart="${mseTmpLineContentParts[$i]}"
    if [ $(mse_str_contains_start " " "${mseTmpMarkDownSearchPart}") == "0" ] && [ $(mse_str_contains_end " " "${mseTmpMarkDownSearchPart}") == "0" ]; then
      mseTmpMarkDownReplacePart="${mseTmpIniMarkUp}${mseTmpMarkDownSearchPart}${mseTmpEndMarkUp}"
      mseTmpMarkDownSearchPart="${mseMarkUpSeparator}${mseTmpMarkDownSearchPart}${mseMarkUpSeparator}"

      mseTmpLine="${mseTmpLine//${mseTmpMarkDownSearchPart}/${mseTmpMarkDownReplacePart}}"
    fi
  done

  echo -ne "${mseTmpLine}"
}