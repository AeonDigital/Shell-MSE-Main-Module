#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_config_showVariables() {
  testResult=$(mse_config_showVariables "${mseTMPDIR}/tests/00_assets/.config")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_config_showVariables")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariables "${mseTMPDIR}/tests/00_assets/.config" "" "1")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_config_showVariablesNL")

  mse_utest_assertEqual




  testResult=$(mse_config_showVariables "${mseTMPDIR}/tests/00_assets/.config" "webserver")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_config_showSectionVariables")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariables "${mseTMPDIR}/tests/00_assets/.config" "webserver" "1")
  testExpected=$(< "${mseTMPDIR}/tests/00_assets/expected/showVariables/test_mse_config_showSectionVariablesNL")

  mse_utest_assertEqual
}
