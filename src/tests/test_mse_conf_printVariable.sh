#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariable() {
  testResult=$(mse_conf_printVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_utest_assertEqual



  testResult=$(mse_conf_printSectionVariable "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="GIT_LOG_LENGTH              =   20"

  mse_utest_assertEqual
}
