#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showSectionVariables() {
  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_showSectionVariables" ]; then
    mse_conf_showSectionVariables "${mseTMPDIR}/tests/.config" "webserver"
  fi


  testResult=$(mse_conf_showSectionVariables "${mseTMPDIR}/tests/.config" "webserver")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_showSectionVariables")

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionVariables "${mseTMPDIR}/tests/.config" "webserver" "1")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_showSectionVariablesNL")

  mse_utest_assertEqual
}
