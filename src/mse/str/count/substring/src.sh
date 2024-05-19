#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_count_substring() {
  local mseReturn="0"

  local mseSubstring="${1}"
  local mseBaseStr="${2}"

  while [[ "${mseBaseStr}" == *"${mseSubstring}"* ]]; do
    ((mseReturn++))
    mseBaseStr="${mseBaseStr%${mseSubstring}*}"
  done

  echo -n "${mseReturn}"
}