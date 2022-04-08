#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariableValue() {
  testResult=$(mse_conf_printVariableValue "${mseTMPDIR}/tests/.config" "GIT_LOG_LENGTH")
  testExpected="10"

  mse_utest_assertEqual


  testResult=$(mse_conf_printSectionVariableValue "${mseTMPDIR}/tests/.config" "teste" "GIT_LOG_LENGTH")
  testExpected="20"

  mse_utest_assertEqual
}
