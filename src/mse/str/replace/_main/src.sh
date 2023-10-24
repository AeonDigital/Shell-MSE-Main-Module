#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_replace() {
  local mseOld="${1}"
  local mseNew="${2}"
  local mseString="${3}"
  local mseReturn="${mseString//${mseOld}/${mseNew}}"

  echo -n "${mseReturn}"
}