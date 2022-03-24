#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra as cores básicas disponíveis no shell
# que podem ser utilizadas para a estilização das mensagens
# de interface.
#
# @param int $1
# Use '0' ou omita este parametro se quiser ver a tabela completa
# Use '1' para ver apenas as colunas que possuem referências de nome e exemplos
# das cores.
# Use '2' para ver apenas as colunas de código das cores e seus respectivos
# resultados.
# Use '3' para ver apenas o código das cores coloridos em uma única linha.
#
# @exemple
#   mse_mmod_showTextColors
mse_mmod_showTextColors() {

  local i
  local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
  local mseLine
  local mseRawTable
  local mseColorName
  local mseColorRaw
  local mseColorCod


  if [ $# == 1 ] && [ $1 == 3 ]; then

    for (( i=0; i<mseLength; i++)); do
      mseColorName=${lbl_generic_array_color_labels[$i]}
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}

      if [ "${mseColorRaw}" != "NONE" ]; then
        mseColorCod="\\${!mseColorRaw}"

        mseLine="${!mseColorRaw}${mseColorRaw}${NONE}"
        if (( i % 4 != 0 )); then
          mseLine+=" : "
        else
          mseLine+="\n"
        fi

        mseRawTable+="${mseLine}"
      fi
    done

    printf "\n${WHITE}${lbl_icolor_showTextColors_ColorOptions}:${NONE} \n\n"
    printf "NONE\n"

    mseRawTable=$(printf "${mseRawTable}")
    column -e -t -s ":" <<< "${mseRawTable}"
    printf "\n"

  else

    if [ $# == 0 ] || [ $1 == 0 ]; then
      mseRawTable="${lbl_icolor_showTextColors_TableHeaders}\n"
    fi

    for (( i=0; i<mseLength; i++)); do
      mseColorName=${MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}
      mseColorCod="\\${!mseColorRaw}"

      mseLine="${mseColorName}:${mseColorRaw}:${mseColorCod}:${!mseColorRaw}myShellEnv${NONE} \n"
      mseRawTable+="${mseLine}"
    done

    printf "\n\n${WHITE}${lbl_icolor_showTextColors_ColorOptions}:${NONE} \n\n"

    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')

    if [ $# == 0 ] || [ $1 == 0 ]; then
      column -e -t -s ":" <<< "${mseRawTable}"
    else
      if [ $1 == 1 ]; then
        column -e -t -s ":" -o " | " -N "${lbl_icolor_showTextColors_TableHeaders}" -H "${lbl_icolor_showTextColors_TableFilter01}" <<< "${mseRawTable}"
      fi
      if [ $1 == 2 ]; then
        column -e -t -s ":" -o " | " -N "${lbl_icolor_showTextColors_TableHeaders}" -H "${lbl_icolor_showTextColors_TableFilter02}" <<< "${mseRawTable}"
      fi
    fi

    printf "\n"
  fi
}
