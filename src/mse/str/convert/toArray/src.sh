#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_convert_toArray() {
  local mseArrName="${1}"
  shift

  IFS=$'\n'
  local mseCode="${mseArrName}=("$@")"
  eval "${mseCode}"
  IFS=$' \t\n'
}