#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_commentVariable() {
  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "COMMENT_TEST")
  testExpected="#COMMENT_TEST                =   value"

  mse_utest_assertEqual


  testResult=$(mse_conf_uncommentVariable "${mseTMPDIR}/tests/.config" "COMMENT_TEST" "#")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "COMMENT_TEST")
  testExpected="COMMENT_TEST                =   value"

  mse_utest_assertEqual


  testResult=$(mse_conf_commentVariable "${mseTMPDIR}/tests/.config" "COMMENT_TEST" "#")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "COMMENT_TEST")
  testExpected="#COMMENT_TEST                =   value"

  mse_utest_assertEqual
}
