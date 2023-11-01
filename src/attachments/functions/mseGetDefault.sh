#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Returns the default value to be used according to the rules defined
# in the arguments.
#
# @param string $1
# Current value.
#
# @param string $2
# Value to be returned if current value is empty or invalid.
#
# @param string $3
# If set, it should contain a string containing all values accepted as valid.
# Separate the values with space characters.
# If a value contains a space character, use quotation marks to define it.
#
# @return string
# Valid value to use.
mseGetDefault() {
  local mseCurrentValue="${1}"
  local mseDefaultValueIfEmptyOrInvalid="${2}"

  IFS=$'\n'
  local mseCode="declare -a mseValidOptions=("${3}")"
  eval "${mseCode}"
  IFS=$' \t\n'

  local mseReturn="${mseDefaultValueIfEmptyOrInvalid}"
  if [ "${#mseValidOptions[@]}" == "0" ]; then
    if [ "${mseCurrentValue}" != "" ]; then
      mseReturn="${mseCurrentValue}"
    fi
  else
    for value in "${mseValidOptions[@]}"; do
      if [ "${mseCurrentValue}" == "${value}" ]; then
        mseReturn="${mseCurrentValue}"
        break
      fi
    done
  fi

  echo -n "${mseReturn}"
}
