#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_message() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual

  declare -a bodyLines=()
  bodyLines+=("first")
  bodyLines+=("second")
  mse_interface_show_message "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" "s" "default" "title" "bodyLines"
}