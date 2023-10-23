#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_get_key_byValue() {
  local mseCaseSensitive="1"
  if [ "$#" -ge "3" ] && [ "${3}" == "0" ]; then
    mseCaseSensitive="0"
  fi
  mse_array_search "${1}" "${2}" "${mseCaseSensitive}" "0" "0" "i"
}