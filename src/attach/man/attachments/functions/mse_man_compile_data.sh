#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compila as informações extraídas do arquivo de manual indicado
# preenchendo os arrays indicados com todo o conteúdo de todas as seções
# encontradas.
#
# @param string $1
# Caminho até o arquivo do manual.
#
# @param assoc $2
# Nome do array associativo que receberá todo o conteúdo do manual devidamente
# compilado.
#
# @param array $3
# Nome do array que receberá o nome de cada chave identificadora de conteúdo
# do array $2 na ordem em que ele deve ser exposto.
#
# @param string $4
# Caminho até o local do arquivo onde os dados extraídos serão salvos.
#
# @return void
mse_man_compile_data() {
  local mseTargetFile="${1}"
  local mseInternalStrCompileManName="${2}"
  declare -n mseInternalAssocCompileManName="${mseInternalStrCompileManName}"
  local mseInternalStrCompileManOrder="${3}"
  declare -n mseInternalArrCompileManOrder="${mseInternalStrCompileManOrder}"
  local mseCompiledFile="${4}"

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


  if [ "${mseCompiledFile}" != "" ]; then
    printf "" > "${mseCompiledFile}"

    local mseK
    local mseSepare="0"
    local mseStrPart=""
    local mseStrContent=""

    for mseK in "${mseInternalArrCompileManOrder[@]}"; do
      mseStrPart=""
      if [ "${mseSepare}" == "0" ]; then
        mseSepare="1"
      elif [ "${mseSepare}" == "1" ]; then
        mseStrPart+="\n\n\n"
      fi

      if [ "${mseK}" != "parameters_subsections" ]; then
        mseStrPart+="<![MAN-DATA[\n"
        mseStrPart+=":: ${mseK}\n"
        mseStrPart+="${mseInternalAssocCompileManName[${mseK}]}\n"
        mseStrPart+="]]!>"

        mseStrPart="${mseStrPart//<<<\\0/<<<\\\\0}"
        mseStrContent+="${mseStrPart}"
      fi
    done


    printf "${mseStrContent}" >> "${mseCompiledFile}"
  fi
}