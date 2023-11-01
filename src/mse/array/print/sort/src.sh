#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_print_sort() {
  declare -n mseTargetArrayName="${1}"
  local mseTarget=$(mseGetDefault "${2:0:1}" "v" "v k")
  local mseOrder=$(mseGetDefault "${3:0:1}" "a" "a d")


  declare -a mseArray=("${mseTargetArrayName[@]}")
  if [ "${mseTarget}" == "k" ]; then
    mseArray=("${!mseTargetArrayName[@]}")
  fi


  local i
  local j
  local mseLength="${#mseArray[@]}"
  local mseTemp

  if [ "${mseOrder}" == "a" ]; then
    for ((i = 0; i < mseLength; i++)); do
      for ((j = 0; j < mseLength - i - 1; j++)); do
          if [[ "${mseArray[j]}" > "${mseArray[j + 1]}" ]]; then
              mseTemp="${mseArray[j]}"
              mseArray[j]="${mseArray[j + 1]}"
              mseArray[j + 1]="${mseTemp}"
          fi
      done
    done
  else
    for ((i = 0; i < mseLength; i++)); do
      for ((j = 0; j < mseLength - i - 1; j++)); do
          if [[ "${mseArray[j]}" < "${mseArray[j + 1]}" ]]; then
            mseTemp="${mseArray[j]}"
            mseArray[j]="${mseArray[j + 1]}"
            mseArray[j + 1]="${mseTemp}"
          fi
      done
    done
  fi


  for mseTemp in "${mseArray[@]}"; do
    echo "${mseTemp}"
  done
}