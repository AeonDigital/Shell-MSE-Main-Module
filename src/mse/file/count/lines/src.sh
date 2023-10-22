#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_count_lines() {
  local mseReturn="0"
  local mseFileContent="${1}"

  if [ -f "${mseFileContent}" ]; then
    mseFileContent=$(< "${mseFileContent}")
  fi

  if [ "${mseFileContent}" != "" ]; then
    local mseLineRaw

    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseReturn++))
    done <<< "${mseFileContent}"
    IFS=$' \t\n'
  fi

  printf "%s" "${mseReturn}"
}