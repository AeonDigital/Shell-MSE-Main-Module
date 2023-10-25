#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkLine_isVariable() {
  local mseR=0

  if [ $# -ge 4 ] && [ "$3" != "" ]; then
    local mseLine=$(mse_str_trim "${3}")

    if [ "$4" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    local mseCommentChars=$(echo -n "${line_check_args_array[@]}")
    local mseReg='^(['"${mseCommentChars}"']?)([a-zA-Z]+).*='
    if [[ "$mseLine" =~ $mseReg ]]; then
      mseR=1
    fi
  fi

  echo -n "${mseR}"
}