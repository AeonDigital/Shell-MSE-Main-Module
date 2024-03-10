#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Lê todas as informações extraídas do arquivo de manual indicado preenchendo
# os arrays indicados com todo o conteúdo de todas as seções
#
# Lembre-se que a subseção 'subsections' da seção 'parameters' sempre virá com
# seu conteúdo vazio.
#
# @param string $1
# Caminho até o arquivo do manual compilado.
#
# @param assoc $2
# Nome do array associativo que receberá o conteúdo do manual devidamente
# compilado.
#
# @param array $3
# Nome do array que receberá o nome de cada chave identificadora de conteúdo
# do array $2 na ordem em que ele deve ser exposto.
#
# @return void
mse_man_read_compiled_data() {
  local mseTargetFile="${1}"
  local mseInternalStrCompileManName="${2}"
  declare -n mseInternalAssocCompileManName="${mseInternalStrCompileManName}"
  local mseInternalStrCompileManOrder="${3}"
  declare -n mseInternalArrCompileManOrder="${mseInternalStrCompileManOrder}"
  local mseCompiledFile="${4}"



  local mseFileContent=$(< "${mseTargetFile}")
  if [ "${mseFileContent}" != "" ]; then
    local mseLineRaw=""
    local mseTargetSectionName=""


    local mseInManData="0"
    local mseManDataTitle=""
    local mseManDataContent=""


    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [ "${mseInManData}" == "0" ]; then
        if [ "${mseLineRaw}" == "<![MAN-DATA[" ]; then
          mseInManData="1"
          mseManDataTitle=""
          mseManDataContent=""
        fi
      elif [ "${mseInManData}" == "1" ]; then
        if [ "${mseLineRaw}" != "]]!>" ]; then
          if [ "${mseManDataTitle}" == "" ]; then
            if [[ "${mseLineRaw}" == ":: "* ]]; then
              mseManDataTitle="${mseLineRaw#:: *}"
              mseInternalArrCompileManOrder+=("${mseManDataTitle}")
            fi
          else
            mseManDataContent+="${mseLineRaw}\n"
          fi
        else
          mseInManData="0"
          mseManDataContent="${mseManDataContent//<<<0/<<<\\0}"
          mseInternalAssocCompileManName["${mseManDataTitle}"]="${mseManDataContent}"
        fi
      fi
    done <<< "${mseFileContent}"
    IFS=$' \t\n'
  fi
}