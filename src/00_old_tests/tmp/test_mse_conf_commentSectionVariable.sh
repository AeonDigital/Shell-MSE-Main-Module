#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_commentSectionVariable() {
  testResult=$(mse_conf_showSectionVariableLine "${mseTMPDIR}/tests/.config" "teste" "COMMENT_TEST")
  testExpected="#COMMENT_TEST                =   value"

  mse_utest_assertEqual


  testResult=$(mse_conf_uncommentSectionVariable "${mseTMPDIR}/tests/.config" "teste" "COMMENT_TEST" "#")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionVariableLine "${mseTMPDIR}/tests/.config" "teste" "COMMENT_TEST")
  testExpected="COMMENT_TEST                =   value"

  mse_utest_assertEqual


  testResult=$(mse_conf_commentSectionVariable "${mseTMPDIR}/tests/.config" "teste" "COMMENT_TEST" "#")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionVariableLine "${mseTMPDIR}/tests/.config" "teste" "COMMENT_TEST")
  testExpected="#COMMENT_TEST                =   value"

  mse_utest_assertEqual
}
