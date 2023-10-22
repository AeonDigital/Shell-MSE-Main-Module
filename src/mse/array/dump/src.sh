#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_dump() {
  declare -a mseReturn=()
  local mseArrayName="${1}"
  local mseIsGlobal=$(mseGetDefault "${2}" "0" "0 1")
  local mseArrayUseName=$(mseGetDefault "${3}" "${mseArrayName}")
  local msePrefixLines="${4}"

  local mseProperties="-"
  if [ "${mseIsGlobal}" == "1" ]; then
    mseProperties+="g"
  fi


  if [[ "$(declare -p ${mseArrayName} 2> /dev/null)" == "declare -A"* ]]; then
    mseProperties+="A"
  elif [[ "$(declare -p ${mseArrayName} 2> /dev/null)" == "declare -a"* ]]; then
    mseProperties+="a"
  else
    mseProperties=""
  fi


  if [ "${mseProperties}" != "" ]; then
    declare -n mseArrayObj="${mseArrayName}"
    local v=""

    mseReturn+=("${msePrefixLines}declare "${mseProperties}" ${mseArrayUseName}")
    for k in "${!mseArrayObj[@]}"; do
      v="${mseArrayObj[${k}]}"
      mseReturn+=("${msePrefixLines}${mseArrayUseName}[\"${k}\"]=\"${v}\"")
    done

    printf "%s\n" "${mseReturn[@]}"
  fi
}