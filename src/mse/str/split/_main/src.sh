#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_split() {
  declare -n mseTargetArray="${1}"
  mseTargetArray=()

  if [ "$#" -ge "3" ]; then
    local mseSeparator="${2}"
    local mseString="${3}"
    local mseSubStr=""
    local mseRemoveEmpty=$(mseGetDefault "${4}" "0" "0 1")
    local mseTrimElements=$(mseGetDefault "${5}" "0" "0 1")


    while [ "${mseString}" != "" ]; do
      if [[ "${mseString}" != *"${mseSeparator}"* ]]; then
        if [ "${mseTrimElements}" == "1" ]; then
          mseString=$(mse_str_trim "${mseString}")
        fi

        mseTargetArray+=("${mseString}")
        break
      else
        mseSubStr="${mseString%%${mseSeparator}*}"

        if [ "${mseTrimElements}" == "1" ]; then
          mseSubStr=$(mse_str_trim "${mseSubStr}")
        fi

        if [ "${mseSubStr}" != "" ] || [ "${mseRemoveEmpty}" == "0" ]; then
          mseTargetArray+=("${mseSubStr}")
        fi

        mseString="${mseString#*${mseSeparator}}"
      fi
    done
  fi
}