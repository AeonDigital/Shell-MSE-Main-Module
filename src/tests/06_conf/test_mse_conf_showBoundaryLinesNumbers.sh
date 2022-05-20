#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showBoundaryLinesNumbers() {
  testResult=$(mse_conf_showBoundaryLinesNumbers "${mseTMPDIR}/tests/00_assets/.config")
  testExpected="1 58"

  mse_utest_assertEqual


  testResult=$(mse_conf_showBoundaryLinesNumbers "${mseTMPDIR}/tests/00_assets/.config" "email" "#")
  testExpected="27 38"

  mse_utest_assertEqual


  testResult=$(mse_conf_showBoundaryLinesNumbers "${mseTMPDIR}/tests/00_assets/.config" "teste" "#")
  testExpected="55 58"

  mse_utest_assertEqual
}
