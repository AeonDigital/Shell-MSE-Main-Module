#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra os atributos disponíveis no shell
# que podem ser utilizados para a estilização das mensagens
# da interface.
mse_mmod_showFontAttributes() {

  local i
  local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
  local mseLine
  local mseRawTable

  for (( i=0; i<mseLength; i++)); do
    mseAttrName=${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}

    if [ "${mseAttrName}" != "DEFAULT" ]; then

      mseLine="${LBLUE}${mseAttrName}${NONE}"
      if (( i % 6 != 0 )); then
        mseLine+=" : "
      else
        mseLine+="\n"
      fi

      mseRawTable+="${mseLine}"
    fi
  done

  printf "\n${WHITE}${lbl_icolor_showFontAttributes_AttrOptions}:${NONE} \n\n"
  printf "${LBLUE}DEFAULT${NONE}\n"

  mseRawTable=$(printf "${mseRawTable}")
  column -e -t -s ":" <<< "${mseRawTable}"
  printf "\n"

}
