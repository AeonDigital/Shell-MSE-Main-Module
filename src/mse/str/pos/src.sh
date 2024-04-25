#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_pos() {
  local mseString="${1}"
  local mseChar="${2}"

  local mseStrTmp="${mseString#*$mseChar}"
  local mseReturn=$(( ${#mseString} - ${#mseStrTmp} - 1 ))

  echo -n "${mseReturn}"
}