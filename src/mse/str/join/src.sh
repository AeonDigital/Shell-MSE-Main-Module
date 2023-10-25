#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_join() {
  local mseReturn=""
  local mseGlue="${1}"
  local mseGlueLen="${#mseGlue}"

  declare -n mseArrayName="${2}"

  local mseItem=""
  for mseItem in "${mseArrayName[@]}"; do
    mseReturn+="${mseItem}${1}"
  done

  if [ "${mseGlueLen}" -gt "0" ]; then
    mseReturn="${mseReturn:: -$mseGlueLen}"
  fi

  echo -n "${mseReturn}"
}