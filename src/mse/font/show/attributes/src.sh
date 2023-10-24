#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_show_attributes() {
  local mseFormat="l"
  local mseLineItens="6"

  if [ "$#" -ge "1" ] && ([ "${1}" == "l" ] || [ "${1}" == "t" ]); then
    mseFormat="${1}"
  fi

  if [ "$#" == "2" ]; then
    local isInt=$(mse_is_int "${2}")
    if [ "${isInt}" == "1" ]; then
      mseLineItens="${2}"
    fi
  fi


  local i
  local mseLength="${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}"
  local mseLine
  local mseRawTable

  for (( i=0; i<mseLength; i++)); do
    mseAttrName="${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}"

    if [ "${mseAttrName}" != "NONE" ]; then

      mseLine="${mseAttrName}"
      if [ "${mseFormat}" == "l" ]; then
        mseLine+="\n"
      elif [ "${mseFormat}" == "t" ]; then
        if (( i % mseLineItens != 0 )); then
          mseLine+=" : "
        else
          mseLine+="\n"
        fi
      fi

      mseRawTable+="${mseLine}"
    fi
  done

  mseRawTable=$(printf "${mseRawTable}")
  local mseReturn=$(printf "NONE\n"; column -e -t -s ":" <<< "${mseRawTable}")
  echo -n "${mseReturn}"
}