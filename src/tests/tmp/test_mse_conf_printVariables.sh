#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariables() {
  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_printVariables" ]; then
    mse_conf_printVariables "${mseTMPDIR}/tests/.config"
  fi


  testResult=$(mse_conf_printVariables "${mseTMPDIR}/tests/.config")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_printVariables")

  mse_utest_assertEqual


  testResult=$(mse_conf_printVariables "${mseTMPDIR}/tests/.config" "1")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_printVariablesNL")

  mse_utest_assertEqual
}
