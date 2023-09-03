#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_show_waitUser() {
  local mseWaitingTitle="${2}"
  if [ "${mseWaitingTitle}" == "" ]; then
    mseWaitingTitle="${lbl_interface_wait_user_any_key}"
  fi

  local mseWaitingMessage=$(mse_interface_show_message "MSE_MESSAGE_THEME_CONFIG" "${1}" "title" "${mseWaitingTitle}")
  read -n 1 -s -r -p "${mseWaitingMessage}  "
  printf "\n"
}