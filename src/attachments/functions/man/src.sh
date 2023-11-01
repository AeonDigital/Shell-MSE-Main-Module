#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]

# Parei no desenvolvimento da função 'mse_man_process_parameters'
# A função principal não foi finalizada pois ela seria totalmente reescrita usando
# as demais funções auxiliares.



mse_man() {
  declare -a pareiporaqui
}





#
# Redeclara os arrays globais de controle de dados de manuais.
mse_man_reset_data() {
  unset MSE_MAN_MAIN_SECTIONS_ORDER
  declare -ag MSE_MAN_MAIN_SECTIONS_ORDER=()

  unset MSE_MAN_MAIN_SECTIONS_DATA
  declare -Ag MSE_MAN_MAIN_SECTIONS_DATA



  unset MSE_MAN_GENERIC_SECTION_DATA
  declare -Ag MSE_MAN_GENERIC_SECTION_DATA



  unset MSE_MAN_SECTIONS_ORDER
  declare -ag MSE_MAN_SECTIONS_ORDER=()

  unset MSE_MAN_SECTIONS_DATA
  declare -Ag MSE_MAN_SECTIONS_DATA



  unset MSE_MAN_PARAMETERS_ORDER
  declare -ag MSE_MAN_PARAMETERS_ORDER=()

  unset MSE_MAN_PARAMETERS_DATA
  declare -Ag MSE_MAN_PARAMETERS_DATA
}


#
# Normaliza o nome da seção passado.
#
# @param string $1
# Nome da seção que será normalizado.
#
# @return string
# Remove os 'hashs' do início da string.
# Remove glifos de caracteres acentuados.
# Remove espaços substituindo-os por '_'.
mse_man_normalize_section_name() {
  local str="${1}"
  str="${str##*# }"
  str=$(mse_str_remove_glyphs "${str,,}")
  str="${str// /_}"

  echo -n "${str}"
}


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


  local mseDefaultSections=" synopsis description parameters returns "
  declare -a mseArrDefaultSections=()
  mse_str_convert_toArray "mseArrDefaultSections" "${mseDefaultSections}"

  if [ "${mseSections}" == "" ]; then
    mseSections="${mseDefaultSections}"
  else
    mseSections="${mseSections/./${mseDefaultSections}}"
  fi

  declare -a mseTargetSections=()
  mse_str_convert_toArray "mseTargetSections" "${mseSections}"



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


    for mseKey in "${!MSE_MAN_MAIN_SECTIONS_DATA[@]}"; do
      MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]=$(mse_str_trim "${MSE_MAN_MAIN_SECTIONS_DATA[${mseKey}]}")
    done
  fi
}


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



#
# Processa as linhas do manual correspondente aos parametros válidos de serem
# usados e suas respectivas regras de uso.
#
# @param string $1
# Coleção de linhas do manual da seção 'parameters' que correspondem aos
# parametros que serão processados.
#
# @return
# Os dados obtidos serão armazenados no array associativo
# 'MSE_MAN_PARAMETERS_DATA'.
# O array 'MSE_MAN_PARAMETERS_ORDER' será usado para manter a informação da
# ordem em que cada parametro aparece no manual.
#
# Ao final do processo as propriedades associadas com cada parametro serão
# adicionadas no array 'MSE_MAN_PARAMETERS_DATA' usando o nome do mesmo como
# prefixo.
# As seguintes propriedades serão preenchidas para cada parametro:
#
# - type
# - name
# - aka
# - default
# - min
# - max
# - options
# - list
# - hint
# - description
#
# Caso alguma propriedade esteja preenchida com algum valor inválido, o mesmo
# será substituido pela constante '!!MSE_ERROR!!'.
#
mse_man_process_parameters() {
  unset MSE_MAN_PARAMETERS_DATA
  declare -Ag MSE_MAN_PARAMETERS_DATA

  unset MSE_MAN_PARAMETERS_ORDER
  declare -ag MSE_MAN_PARAMETERS_ORDER=()


  local mseAllowedTypes=" bool int float char charDecimal charHex charOctal string array assoc regex function file dir mixed void "
  declare -a mseArrAllowedTypes=()
  mse_str_convert_toArray "mseArrAllowedTypes" "${mseAllowedTypes}"

  local mseExpectedProperties=" type name aka default min max options list hint description "
  declare -a mseArrExpectedProperties=()
  mse_str_convert_toArray "mseArrExpectedProperties" "${mseExpectedProperties}"


  local mseRawParametersData="${1}"
  if [ "${mseRawParametersData}" != "" ]; then
    local mseRawDeclaration=""
    local mseParameterType=""
    local mseParameterName=""
    declare -a mseArrSplit=()



    # @@ daqui!
    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [ "${mseLineRaw}" != "" ]; then

        if [[ "${mseLineRaw}" == "## "* ]]; then
          mseRawDeclaration="${mseLineRaw##*# }"
          echo "${mseRawDeclaration}"

          mse_str_split "mseArrSplit" " " "${mseRawDeclaration}" "1" "1"
          if [ "${#mseArrSplit[@]}" != "2" ]; then
            mseParameterType="${MSE_ERROR}"
            mseParameterName="ERROR_${#MSE_MAN_PARAMETERS_ORDER[@]}"
          else
            mseParameterType="${MSE_ERROR}"
            mseParameterName="ERROR_${#MSE_MAN_PARAMETERS_ORDER[@]}"
          fi
        fi

      fi
    done <<< "${mseRawParametersData}"
    IFS=$' \t\n'
  fi
}



#
# Processa as linhas de dados de uma seção armazenada em um array associativo
# para extrair as informações do mesmo de forma estruturada.
#
# Esta função pode ser acionada recursivamente caso existam subseções.
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
# 'MSE_MAN_SECTIONS_DATA'.
mse_man_process_section_data() {
  local mseTargetAssocArrayName="${1}"
  local mseTargetSectionName="${2}"
  local mseTargetSectionLevel="${3}"


  mse_man_process_section_generic "${mseTargetAssocArrayName}" "${mseTargetSectionName}" "${mseTargetSectionLevel}"

  local mseSectionPart=""
  local mseSectionPartName=""
  local mseNextTargetSectionLevel=$((mseTargetSectionLevel+1))
  declare -a mseSectionParts=("title" "summary" "description" "subsections")
  for mseSectionPart in "${mseSectionParts[@]}"; do
    mseSectionPartName="${mseTargetSectionName}_${mseSectionPart}"

    MSE_MAN_SECTIONS_ORDER+=("${mseSectionPartName}")
    MSE_MAN_SECTIONS_DATA["${mseSectionPartName}"]="${MSE_MAN_GENERIC_SECTION_DATA[${mseSectionPart}]}"

    if [ "${mseSectionPart}" == "subsections" ] && [ "${MSE_MAN_SECTIONS_DATA[${mseSectionPartName}]}" != "" ]; then
      if [ "${mseTargetSectionName}" == "parameters" ]; then
        mse_man_process_parameters "${MSE_MAN_GENERIC_SECTION_DATA[${mseSectionPart}]}"
      else
        mse_man_process_section_data "MSE_MAN_SECTIONS_DATA" "${mseSectionPartName}" "${mseNextTargetSectionLevel}"
      fi
    fi
  done
}