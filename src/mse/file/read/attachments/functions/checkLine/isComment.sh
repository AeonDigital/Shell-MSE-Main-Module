#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkLine_isComment() {
  local mseR="0"

  if [ "$#" -ge "4" ] && [ "${3}" != "" ]; then
    local mseLine=$(mse_str_trim "${3}")

    if [ "${4}" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    for mseComSig in "${line_check_args_array[@]}"; do
      if [ "${mseLine:0:1}" == "$mseComSig" ]; then
        mseR="1"
        break
      fi
    done
  fi

  echo -n "${mseR}"
}