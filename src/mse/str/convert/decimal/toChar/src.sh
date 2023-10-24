#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_convert_decimal_toChar() {
  local mseReturn=""
  local mseTmp
  local mseByte
  local mseArrParam

  #
  # Changing the "LC_CTYPE" variable below changes how character counts are done in a string.
  # - Use "" to count the number of chars in a string (multibyte safe)
  # - Use "C" to consider each byte in the string as an independent char.
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE="C"

  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    mseTmp=$(printf "%o" "${mseByte}")  # converts any decimal to octal representation
    mseReturn+="\\${mseTmp}"
  done
  mseReturn=$(printf "${mseReturn}")    # normalize octal to char.

  LC_CTYPE="${oLC_CTYPE}"

  echo -n "${mseReturn}"
}