#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkSection_end() {
  local mseR="0"

  if [ "$#" -ge "5" ]; then
    if [ "${3:0:1}" == "[" ]; then
      mseR="1"
    fi
  fi

  echo -n "${mseR}"
}