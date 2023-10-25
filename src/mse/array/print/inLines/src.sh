#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_print_inLines() {
  declare -n assocName="${1}"
  for v in "${assocName[@]}"; do
    echo -e "${v}"
  done
}