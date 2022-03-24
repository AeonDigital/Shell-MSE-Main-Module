#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_createFontStyle() {
  testResult=$(mse_mmod_createFontStyle)
  testExpected="${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_createFontStyle) : lost argument"

  mse_utest_assertEqual


  testResult=$(mse_mmod_createFontStyle "1")
  testExpected="${MSE_GLOBAL_MODULE_ALERT_INDENT}ERROR (in mse_mmod_createFontStyle) : lost argument"

  mse_utest_assertEqual
}
