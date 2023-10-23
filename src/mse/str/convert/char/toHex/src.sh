#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_convert_char_toHex() {
  local mseReturn=""
  local mseChar
  local mseCharI

  #
  # Changing the "LC_CTYPE" variable below changes how character counts are done in a string.
  # - Use "" to count the number of chars in a string (multibyte safe)
  # - Use "C" to consider each byte in the string as an independent char.
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE="C"

  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "${mseCharI}" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%X" "'${mseChar}")
  done

  LC_CTYPE="${oLC_CTYPE}"

  printf "%s" "${mseReturn}"
}