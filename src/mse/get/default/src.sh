#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_get_default() {
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