#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_transformLine_normalizeKeyValue() {
  local mseLine

  if [ "$#" -ge "3" ] && [ "${3}" != "" ]; then
    mseLine=$(mse_str_trim_substring "=" "${3}")
  fi

  echo -n "${mseLine}"
}
