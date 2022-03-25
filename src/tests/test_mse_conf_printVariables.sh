#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariables() {
  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables_01" ]; then
    mse_conf_printVariables "${mseTMPDIR}/tests/.config"
  fi


  testResult=$(mse_conf_printVariables "${mseTMPDIR}/tests/.config")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables_01")

  mse_utest_assertEqual



  if [ ! -f "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables_02" ]; then
    mse_conf_printSectionVariables "webserver" "${mseTMPDIR}/tests/.config"
  fi


  testResult=$(mse_conf_printSectionVariables "webserver" "${mseTMPDIR}/tests/.config")
  testExpected=$(< "${mseTMPDIR}/tests/expected/test_mse_conf_printSectionVariables_02")

  mse_utest_assertEqual
}
