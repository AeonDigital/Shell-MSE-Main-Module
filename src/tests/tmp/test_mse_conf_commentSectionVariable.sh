#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_commentSectionVariable() {
  testResult=$(mse_conf_printVariable "COMMENT_TEST_NOT" "${mseTMPDIR}/tests/.config")
  testExpected=""

  mse_utest_assertEqual



  mse_conf_uncommentVariable "COMMENT_TEST_NOT" "#" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printVariable "COMMENT_TEST_NOT" "${mseTMPDIR}/tests/.config")
  testExpected="COMMENT_TEST_NOT            =   value"

  mse_utest_assertEqual



  mse_conf_commentVariable "COMMENT_TEST_NOT" "#" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printVariable "COMMENT_TEST_NOT" "${mseTMPDIR}/tests/.config")
  testExpected=""

  mse_utest_assertEqual





  testResult=$(mse_conf_printSectionVariable "teste" "COMMENT_TEST" "${mseTMPDIR}/tests/.config")
  testExpected=""

  mse_utest_assertEqual



  mse_conf_uncommentSectionVariable "teste" "COMMENT_TEST" "#" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printSectionVariable "teste" "COMMENT_TEST" "${mseTMPDIR}/tests/.config")
  testExpected="COMMENT_TEST                =   value"

  mse_utest_assertEqual



  mse_conf_commentSectionVariable "teste" "COMMENT_TEST" "#" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printSectionVariable "teste" "COMMENT_TEST" "${mseTMPDIR}/tests/.config")
  testExpected=""

  mse_utest_assertEqual
}
