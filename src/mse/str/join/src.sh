#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_join() {
  local mseGlue="${1}"
  local mseGlueLen="${#mseGlue}"

  declare -n mseArrayName="${2}"
  mseReturn=$(printf "%s${1}" "${mseArrayName[@]}")

  if [ "${mseGlueLen}" -gt "0" ]; then
    mseReturn="${mseReturn:: -$mseGlueLen}"
  fi

  printf "%s" "${mseReturn}"
}