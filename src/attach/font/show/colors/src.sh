#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_show_colors() {
  local mseCheck


  local mseColorSystem="4"
  if [ "$#" -ge "1" ] && ([ "${1}" == "8" ] || [ "${1}" == "32" ]); then
    mseColorSystem="${1}"
  fi

  local mseFocus="f"
  if [ "$#" -ge "2" ] && [ "${2}" == "b" ]; then
    mseFocus="b"
  fi

  local mseItensPerLine="12"
  local mseItensPerLineIsSet="4"
  if [ "$#" -ge "3" ]; then
    mseCheck="$(mse_is_int "${3}")"
    if [ "${mseCheck}" == "1" ]; then
      if [ "$3" -le "4" ]; then
        mseItensPerLine="4"
      else
        mseItensPerLine="${3}"
      fi
      mseItensPerLineIsSet="0"
    fi
  fi


  case "${mseColorSystem}" in
    4)
      local i
      local mseLength="${#MSE_ICOLOR_AVAILABLE_COLOR_NAMES[@]}"

      local mseColorLabel
      local mseColorName
      local mseColorVarName
      local mseColorCode
      local mseLine
      local mseRawTable

      mseRawTable="${lbl_font_showTextColors_TableHeaders}\n"

      for (( i=0; i<mseLength; i++)); do
        mseColorLabel="${MSE_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}"
        mseColorName="${MSE_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}"
        mseColorVarName="mse${mseColorName}"
        mseColorCode="\\${!mseColorVarName}"

        mseLine="${mseColorLabel}:${mseColorName}:${mseColorCode}:${!mseColorVarName}myShellEnv${mseNONE} \n"
        mseRawTable+="${mseLine}"
      done

      echo ""

      mseRawTable=$(echo -ne "${mseRawTable}")
      mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')
      column -e -t -s ":" <<< "${mseRawTable}"

      echo ""
    ;;
    8)
      local mseColorSet="255"
      local mseColorCodeMaxLength=($(eval echo {0..${mseColorSet}}))

      local mseColorIndex
      local mseColorNumber="0"
      local mseColorMod="0"
      local mseStrColorNumber
      local mseNewLine


      echo ""
      for mseColorIndex in "${mseColorCodeMaxLength[@]}"; do
        mseNewLine="0"

        if [ "${mseColorIndex}" -lt "10" ]; then
          mseStrColorNumber="  ${mseColorIndex}"
        elif [ "${mseColorIndex}" -lt "100" ]; then
          mseStrColorNumber=" ${mseColorIndex}"
        else
          mseStrColorNumber="${mseColorIndex}"
        fi

        if [ "${mseFocus}" == "f" ]; then
          echo -ne "\e[38;5;${mseColorIndex}m  ${mseStrColorNumber}  ${mseNONE}"
        elif [ "${mseFocus}" == "b" ]; then
          echo -ne "\e[48;5;${mseColorIndex}m  ${mseStrColorNumber}  ${mseNONE}"
        fi

        ((mseColorNumber=mseColorIndex+1))
        ((mseColorMod=mseColorNumber % mseItensPerLine))
        if [ "${mseColorMod}" == "${mseItensPerLineIsSet}" ]; then
          echo ""
          mseNewLine="1"
        fi
      done

      if [ "${mseNewLine}" == "0" ]; then
        echo ""
      fi

      echo -ne "\n${lbl_font_showTextColors_UseCodeExample}"
      if [ "${mseFocus}" == "f" ]; then
        echo -n "\\e[38;5;Xm"
      elif [ "${mseFocus}" == "b" ]; then
        echo -n "\\e[48;5;Xm"
      fi

      echo ""
      echo ""
    ;;
  esac
}