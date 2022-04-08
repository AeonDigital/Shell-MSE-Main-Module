#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printSectionVariables() {
  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables" ]; then
    mse_conf_printSectionVariables "${mseTMPDIR}/tests/.config" "webserver"
  fi


  testResult=$(mse_conf_printSectionVariables "${mseTMPDIR}/tests/.config" "webserver")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables")

  mse_utest_assertEqual
}
