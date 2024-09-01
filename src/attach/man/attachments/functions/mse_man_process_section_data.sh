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

      local msePartTitle=""
      local msePartSummary=""
      local msePartDescription=""
      local msePartSubsections=""


      IFS=$'\n'
      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        if [ "${mseTargetPart}" == "title" ]; then
          mseLineRaw=$(mse_str_trim "${mseLineRaw}")

          if [ "${mseLineRaw}" != "" ]; then
            mseTargetPart="summary"
            msePartTitle="[[Title]]${mseLineRaw##*# }[[/Title]]"
          fi
        else
          if [[ "${mseLineRaw}" == "#"* ]]; then
            mseTargetPart="subsections"
          fi

          case "${mseTargetPart}" in
            "summary")
              if [ "$(mse_str_trim_right "${mseLineRaw}")" != "" ]; then
                msePartSummary+="${mseLineRaw}\n"
              else
                if [ "${msePartSummary}" != "" ]; then
                  mseTargetPart="description"
                fi
              fi
            ;;

            "description")
              msePartDescription+="${mseLineRaw}\n"
            ;;

            "subsections")
              msePartSubsections+="${mseLineRaw}\n"
            ;;
          esac
        fi
      done <<< "${mseTargetSectionContent}"
      IFS=$' \t\n'



      MSE_MAN_SECTION_DATA["title"]="${msePartTitle}"
      MSE_MAN_SECTION_DATA["summary"]=$(mse_man_process_section_data_process_part "${msePartSummary}")
      MSE_MAN_SECTION_DATA["description"]=$(mse_man_process_section_data_process_part "${msePartDescription}")
      #MSE_MAN_SECTION_DATA["subsections"]="${msePartSubsections}"

      #mse_man_process_section_data_process_part "${msePartDescription}"

      #
      # SEGUIR DAQUI
      # É PRECISO VERIFICAR O TRATAMENTO DAS SUBSECTIONS POIS ELAS SE
      # DESDOBRAM E TEM PROPRIEDADES QUE DEVEM GERAR TRATAMENTOS EM ESPECIAL.
      #
      # O TRATAMENTO DE OUTROS PADRÕES COMO LISTAS ORDENADAS E NÃO ORDENADAS
      # AINDA NÃO ESTÁ FINALIZADO... SEGUIR POR AI


      #((mseTargetSectionLevel++))
      #local mseHashOpenSectionInSubLevel=$(mse_str_pad "" "#" "${mseTargetSectionLevel}" "l")

      #mseIsCurrentLineList=$(mse_man_process_section_data_check_list "${mseLineRaw}")


    fi
  fi
}





#
# Processa apenas uma parte da seção.
#
# Insere marcações que visam facilitar a futura insersão de personalizações como
# coloração e outras possibilidades oferecidas pelos themes.
#
# @param string $1
# Conteúdo que será processado.
#
# @return string
# Retorna a parte indicada com as devidas marcações.
mse_man_process_section_data_process_part() {
  local msePart=""
  local mseRawSectionPart=$(mse_str_trim "${1}")

  if [ "${mseRawSectionPart}" != "" ]; then
    local mseUseLineContent=""
    local mseIsCurrentLineList=""

    local mseCurrentLineInsertIni=""
    local mseCurrentLineInsertEnd=""
    local mseCurrentLineFirstChar=" "
    local msePreviousLineLastChar=" "

    local mseLineRaw=""

    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      mseCurrentLineInsertIni=""
      mseCurrentLineInsertEnd=""

      if [ $(mse_man_process_section_data_check_horizontal_rule "${mseLineRaw}") == "1" ]; then
        mseUseLineContent="[[hr/]]"
        mseCurrentLineFirstChar=" "
        msePreviousLineLastChar=" "
      else
        mseUseLineContent=$(mse_str_trim_right "${mseLineRaw}")

        if [ "${mseUseLineContent}" == "" ]; then
          mseCurrentLineInsertEnd+="[[br/]]"
          mseCurrentLineFirstChar=" "
          msePreviousLineLastChar="[[br/]]"
        else
          if [ "${msePreviousLineLastChar}" == "[[br/]]" ]; then
            mseCurrentLineInsertIni+="[[br/]]"
            msePreviousLineLastChar=" "
          fi

          mseCurrentLineFirstChar="${mseUseLineContent:0:1}"
          if [ "${mseCurrentLineFirstChar}" != " " ] && [ "${msePreviousLineLastChar}" != " " ]; then
            mseCurrentLineInsertIni+=" "
          fi
          msePreviousLineLastChar="${mseUseLineContent: -1:1}"

          if [ $(mse_man_process_section_data_check_ends_with_two_spaces "${mseLineRaw}") == "1" ]; then
            mseCurrentLineInsertEnd+="[[br/]]"
            mseCurrentLineFirstChar=" "
            msePreviousLineLastChar=" "
          fi
        fi
      fi

      msePart+="${mseCurrentLineInsertIni}${mseUseLineContent}${mseCurrentLineInsertEnd}"
    done <<< "${mseRawSectionPart}"
    IFS=$' \t\n'

  fi

  msePart=$(mse_normalize_string "${msePart}")
  msePart=$(mse_man_process_section_data_set_markups "${msePart}")
  echo "${msePart}"
}





#
# Verifica a linha passada indica que a mesma deva ser renderizada como uma
# linha horizonal.
#
# @param string $1
# Linha que será avaliada
#
# @return bool
mse_man_process_section_data_check_horizontal_rule() {
  local mseStrLine=$(mse_str_trim_right "${1}")
  local mseTotalChars="${#mseStrLine}"
  local mseStrLineFirstChar="${mseStrLine:0:1}"

  local mseBool="0"
  if [ "${mseTotalChars}" -ge "3" ] && ([ "${mseStrLineFirstChar}" == "_" ] || [ "${mseStrLineFirstChar}" == "-" ] || [ "${mseStrLineFirstChar}" == "*" ]); then
    mseBool="1"

    for ((i=0; i<mseTotalChars; i++)); do
      if [ "${mseStrLine:$i:1}" != "${mseStrLineFirstChar}" ]; then
        mseBool="0"
        break
      fi
    done
  fi
  echo -ne "${mseBool}"
}





#
# Verifica a linha passada e verifica se ela termina com 2 espaços em branco.
#
# @param string $1
# Linha que será avaliada
#
# @return bool
mse_man_process_section_data_check_ends_with_two_spaces() {
  local mseBool="0"
  if [[ "${1}" =~ "  "$ ]]; then
    mseBool="1"
  fi
  echo -ne "${mseBool}"
}





#
# Verifica a linha passada indica que a mesma está definindo uma lista
# ordenada ou não ordenada.
#
# @param string $1
# Linha que será avaliada
#
# @return bool
mse_man_process_section_data_check_list() {
  local tmpTrimLine=$(mse_str_trim "${1}")
  local tmpFirstChars="${tmpTrimLine:0:2}"

  local mseBool="0"
  if [ "${tmpFirstChars}" == "- " ] || [ "${tmpFirstChars}" == "* " ] || [ "${tmpFirstChars}" == "+ " ]; then
    mseBool="1"
  else
    local tmpFirstChars="${tmpTrimLine%%. *}"
    local tmpFirstCharsAreNumber=$(mse_is_int "${tmpFirstChars}")
    local tmpStartWithNumberList=$(mse_str_contains_start "${tmpFirstChars}. " "${tmpTrimLine}")

    if [ "${tmpFirstCharsAreNumber}" == "1" ] && [ "${tmpStartWithNumberList}" == "1" ]; then
      mseBool="1"
    fi
  fi
  echo -ne "${mseBool}"
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

  #local mseDefaultMarkUpSeparator="-=+∅+=-"
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