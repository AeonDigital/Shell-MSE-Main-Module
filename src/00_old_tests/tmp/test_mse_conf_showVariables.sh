#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showVariables() {
  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_showVariables" ]; then
    mse_conf_showVariables "${mseTMPDIR}/tests/.config"
  fi


  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/.config")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_showVariables")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/.config" "1")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_showVariablesNL")

  mse_utest_assertEqual
}
