#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_pad() {
  local mseNStr=""
  local mseOStr="${1}"
  local msePadChar="${2}"
  local mseTotalLength="${3}"
  local msePadPosition="${4}"

  if [ "${msePadPosition}" != "l" ] && [ "${msePadPosition}" != "r" ]; then
    msePadPosition=""
  fi


  #
  # Changing the "LC_CTYPE" variable below changes how character counts are done in a string.
  # - Use "" to count the number of chars in a string (multibyte safe)
  # - Use "C" to consider each byte in the string as an independent char.
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=""

  if [ "${#msePadChar}" == "1" ] && [ "${mseTotalLength}" -gt "0" ] && [ "${msePadPosition}" != "" ]; then
    mseNStr="${mseOStr}"

    if [ "${mseTotalLength}" -gt "${#mseNStr}" ]; then
      local mseStringLength="${#mseNStr}"
      local msePadLeft="0"
      local msePadStr=""

      ((msePadLeft=mseTotalLength-mseStringLength))
      if [ "${msePadChar}" == " " ]; then
        msePadStr=$(printf "%-${msePadLeft}s")
      else
        msePadStr=$(printf "${msePadChar}%.0s" $(eval "echo {1.."$((${msePadLeft}))"}"))
      fi

      if [ "${msePadPosition}" == "l" ]; then
        mseNStr="${msePadStr}${mseNStr}"
      elif [ "${msePadPosition}" == "r" ]; then
        mseNStr="${mseNStr}${msePadStr}"
      fi
    fi
  fi

  LC_CTYPE="${oLC_CTYPE}"

  echo -n "${mseNStr}"
}