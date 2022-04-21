#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showVariableValue() {
  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/.config" "GIT_LOG_LENGTH")
  testExpected="10"

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/.config" "REQUEST_TIMEOUT")
  testExpected="1200"

  mse_utest_assertEqual
}
