#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_setVariable() {
  testResult=$(mse_conf_showVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_utest_assertEqual



  mse_conf_setVariable "CONTAINER_WEBSERVER_NAME" "dev-teste" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_showVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-teste"

  mse_utest_assertEqual



  mse_conf_setVariable "CONTAINER_WEBSERVER_NAME" "dev-php-webserver" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_showVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_utest_assertEqual
}
