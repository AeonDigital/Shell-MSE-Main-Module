#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkArbitratySection_start() {
  local mseR=0

  if [ "${3}" == "${5}" ]; then
    mseR=1
  fi

  echo -n "${mseR}"
}