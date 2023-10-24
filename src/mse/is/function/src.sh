#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_function() {
  local mseReturn="0"
  if [ "$(type -t ${1})" == "function" ]; then mseReturn="1"; else mseReturn="0"; fi
  echo -n "${mseReturn}"
}