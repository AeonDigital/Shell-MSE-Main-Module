#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showSectionVariableValue() {
  testResult=$(mse_conf_showSectionVariableValue "${mseTMPDIR}/tests/.config" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected=$(printf "dev-php-webserver")

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionVariableValue "${mseTMPDIR}/tests/.config" "email" "EMAIL_HOST")
  testExpected=$(printf "192.168.1.206")

  mse_utest_assertEqual
}
