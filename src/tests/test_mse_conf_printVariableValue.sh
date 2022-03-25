#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariableValue() {
  testResult=$(mse_conf_printVariableValue "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="10"

  mse_utest_assertEqual



  testResult=$(mse_conf_printSectionVariableValue "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="20"

  mse_utest_assertEqual
}
