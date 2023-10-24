#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim_right() {
  local mseReturn=$(echo -e "${1}")
  echo -n "${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R
}