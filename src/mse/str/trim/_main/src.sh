#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim() {
  # with 'sed'
  # local mseReturn=$(echo "${1}" | sed -z -E -e 's/^[ \t\r\n]+//' | sed -z -E -e 's/[ \t\r\n]+$//')

  local mseReturn=$(echo -e "${1}")
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R
  echo -n "${mseReturn}"
}