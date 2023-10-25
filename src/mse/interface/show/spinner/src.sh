#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_show_spinner() {
  if [ "${MSE_SPINNER_PID}" == "" ]; then
    declare -n mseSpinnerPhases="MSE_SPINNER_DEFAULT"
    if [ "$#" -ge "1" ] && [ "${1}" != "" ]; then
      if [[ "$(declare -p "${1}" 2> /dev/null)" =~ "declare -a" ]]; then
        declare -n mseSpinnerPhases="${1}"
      fi
    fi

    local mseInterval="0.2"
    if [ "$#" -ge "2" ] && [ "${2}" != "" ]; then
      reg="^[0-9]+([.][0-9]+)?$"
      if [[ "${2}" =~ ${reg} ]]; then
        mseInterval="${2}"
      fi
    fi

    set +m
    {
      local mseStep=""
      local mseFirst="1"
      while : ; do
        # Causes a delay at the start of the presentation to allow time for the
        # prompt to start when in interactive mode
        if [ "${mseFirst}" == "1" ]; then
          mseFirst="0"
          sleep "0.5"
        fi

        for mseStep in "${mseSpinnerPhases[@]}"; do
          echo -ne "\r${mseStep}"
          sleep "${mseInterval}"
        done
      done &
    } 2> /dev/null

    MSE_SPINNER_PID=$!
  else
    mse_interface_stop_spinner
  fi
}



mse_interface_stop_spinner() {
  {
    kill -9 "${MSE_SPINNER_PID}" && wait;
  } 2> /dev/null

  set -m
  MSE_SPINNER_PID=""
  mse_interface_clear_line "" "1"
}



trap mse_interface_stop_spinner EXIT