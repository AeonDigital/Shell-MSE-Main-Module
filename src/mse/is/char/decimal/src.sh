#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_char_decimal() {
  local mseReturn="1"

  local mseI
  local mseREG
  local mseArrParam

  mseREG='^[0-9]+$'
  mseArrParam=(${1// / })

  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ "${mseReturn}" == "1" ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn="0"
        break
      fi
    fi
  done

  echo -n "${mseReturn}"
}