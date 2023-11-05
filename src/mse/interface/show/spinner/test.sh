#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_spinner() {
  testResult="-"
  testExpected="-"

  mse_utest_assert_equals



  local mseTestShowSpinnerInShell="0"
  if [ "${mseTestShowSpinnerInShell}" == "1" ]; then
    mse_interface_show_spinner
    sleep 5
    mse_interface_show_spinner


    mse_interface_show_spinner "MSE_SPINNER_COMEANDGO"
    sleep 5
    mse_interface_show_spinner


    mse_interface_show_spinner "MSE_SPINNER_STICK_STAR"
    sleep 5
    mse_interface_show_spinner


    mse_interface_show_spinner "MSE_SPINNER_THINKING" "0.5"
    sleep 5
    mse_interface_show_spinner
  fi
}