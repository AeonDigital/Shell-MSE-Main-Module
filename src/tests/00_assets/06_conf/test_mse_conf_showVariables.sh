#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showVariables() {
  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/00_assets/.config")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_conf_showVariables")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/00_assets/.config" "" "1")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_conf_showVariablesNL")

  mse_utest_assertEqual




  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/00_assets/.config" "webserver")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_conf_showSectionVariables")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariables "${mseTMPDIR}/tests/00_assets/.config" "webserver" "1")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_conf_showSectionVariablesNL")

  mse_utest_assertEqual
}
