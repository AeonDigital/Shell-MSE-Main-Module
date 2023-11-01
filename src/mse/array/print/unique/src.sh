#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_print_unique() {
  declare -n mseTargetArrayName="${1}"

  local mseTargetArrayValue

  local mseMatch
  local mseTmpValue
  declare -a mseTmpArray=()

  for mseTargetArrayValue in "${mseTargetArrayName[@]}"; do
    mseMatch="0"
    for mseTmpValue in "${mseTmpArray[@]}"; do
      if [ "${mseTargetArrayValue}" == "${mseTmpValue}" ]; then
        mseMatch="1"
        break
      fi
    done

    if [ "${mseMatch}" == "0" ]; then
      mseTmpArray+=("${mseTargetArrayValue}")
      echo "${mseTargetArrayValue}"
    fi
  done
}