#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim() {
  local mseReturn=$(echo -e "${1}")
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R
  echo -n "${mseReturn}"
}