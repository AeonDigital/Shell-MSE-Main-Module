#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_dump() {
  declare -a mseReturn=()
  local mseArrayName="${1}"
  local mseIsGlobal=$(mse_get_default "${2}" "0" "0 1")
  local mseArrayUseName=$(mse_get_default "${3}" "${mseArrayName}")
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
    local mseStrSortKeys=$(mse_array_print_sort "${mseArrayName}" "k" "asc")
    declare -a mseArrSortKeys=()
    mse_str_split_inLines "mseArrSortKeys" "${mseStrSortKeys}"

    declare -n mseArrayObj="${mseArrayName}"
    local v=""

    mseReturn+=("${msePrefixLines}declare "${mseProperties}" ${mseArrayUseName}")
    for k in "${mseArrSortKeys[@]}"; do
      v="${mseArrayObj[${k}]}"
      mseReturn+=("${msePrefixLines}${mseArrayUseName}[\"${k}\"]=\"${v}\"")
    done

    mse_array_print_inLines "mseReturn"
  fi
}