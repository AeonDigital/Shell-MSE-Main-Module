#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_config_showVariableLine() {
  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "" "GIT_LOG_LENGTH")
  testExpected=$(printf "GIT_LOG_LENGTH              =   10")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "" "EMAIL_HOST")
  testExpected=$(printf "EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "" "EMAIL_HOST" "1")
  testExpected=$(printf "29#EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "" "COMMENT_TEST" "1")
  testExpected="23##COMMENT_TEST                =   value"

  mse_utest_assertEqual





  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected=$(printf "CONTAINER_WEBSERVER_NAME    =   dev-php-webserver")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "email" "EMAIL_HOST")
  testExpected=$(printf "EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "email" "EMAIL_HOST" "1")
  testExpected=$(printf "29#EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_config_showVariableLine "${mseTMPDIR}/tests/00_assets/.config" "database" "COMMENT_TEST" "1")
  testExpected="52##COMMENT_TEST                =   value"

  mse_utest_assertEqual
}
