#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_fontCreateStyle() {
  testResult=$(mse_mmod_fontCreateStyle)
  testExpected="${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_fontCreateStyle) : lost argument"

  mse_utest_assertEqual


  testResult=$(mse_mmod_fontCreateStyle "1")
  testExpected="${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_fontCreateStyle) : lost argument"

  mse_utest_assertEqual


  testResult=$(mse_mmod_fontCreateStyle "LBLUE" "NONE" "BOLD" "1")
  testExpected='\\e[0;94;49m'

  mse_utest_assertEqual
}
