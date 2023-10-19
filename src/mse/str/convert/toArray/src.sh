#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_convert_toArray() {
  declare -n mseTargetArray="${1}"
  mseTargetArray=()

  if [ "${2}" != "" ]; then
    IFS=$'\n'
    mseTargetArray=($(xargs -n1 <<< "${2}"))
    IFS=$' \t\n'
  fi
}