#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read_checkSection_start() {
  local mseR=0

  if [ $# -ge 5 ]; then
    local mseSection

    for mseSection in "${block_start_check_args_array[@]}"; do
      mseSection="[${mseSection}]"
      if [ "$mseSection" == "$3" ]; then
        mseR=1
        break
      fi
    done
  fi

  echo -n "${mseR}"
}