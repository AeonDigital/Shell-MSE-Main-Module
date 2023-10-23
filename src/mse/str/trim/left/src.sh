#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_trim_left() {
  local mseReturn=$(echo -e "${1}")
  printf "%s" "${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
}