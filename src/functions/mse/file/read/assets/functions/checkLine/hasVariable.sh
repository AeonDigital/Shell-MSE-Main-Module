#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkLine_hasVariable() {
  local mseR=0

  if [ $# -ge 5 ] && [ "$3" != "" ]; then
    local mseLine=$(mse_str_trim "$3")
    mseLine=$(mse_str_trim_substring "=" "$mseLine")

    if [ "$4" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi

    local mseVarName="${line_check_args_array[0]}"
    line_check_args_array=("${line_check_args_array[@]:1}")

    local mseComSig
    for mseComSig in "${line_check_args_array[@]}"; do
      if [ "${mseLine:0:1}" == "${mseComSig}" ]; then
        mseLine="${mseLine#${mseComSig}}"
      fi
    done

    if [ "${mseLine%%=*}" == "${mseVarName}" ]; then
      mseR=1
    fi
  fi

  printf "${mseR}"
}
