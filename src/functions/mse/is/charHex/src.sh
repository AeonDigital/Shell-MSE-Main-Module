#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_charHex() {
  mseLastFunctionVariablesReset

  local mseReturn=1

  local mseI
  local mseREG
  local mseArrParam

  mseREG='^[0-9A-Fa-f]{1,2}$'
  mseArrParam=(${1// / })

  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
}