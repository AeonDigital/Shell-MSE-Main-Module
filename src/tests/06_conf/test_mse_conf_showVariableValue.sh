#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showVariableValue() {
  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/00_assets/.config" "" "GIT_LOG_LENGTH")
  testExpected="10"

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/00_assets/.config" "" "REQUEST_TIMEOUT")
  testExpected="1200"

  mse_utest_assertEqual





  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/00_assets/.config" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected=$(printf "dev-php-webserver")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableValue "${mseTMPDIR}/tests/00_assets/.config" "email" "EMAIL_HOST")
  testExpected=$(printf "192.168.1.206")

  mse_utest_assertEqual
}
