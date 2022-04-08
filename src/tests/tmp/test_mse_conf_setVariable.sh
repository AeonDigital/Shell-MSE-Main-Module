#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_setVariable() {
  testResult=$(mse_conf_printVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_utest_assertEqual



  mse_conf_setVariable "CONTAINER_WEBSERVER_NAME" "dev-teste" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-teste"

  mse_utest_assertEqual



  mse_conf_setVariable "CONTAINER_WEBSERVER_NAME" "dev-php-webserver" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printVariable "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_utest_assertEqual





  testResult=$(mse_conf_printSectionVariable "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="GIT_LOG_LENGTH              =   20"

  mse_utest_assertEqual



  mse_conf_setSectionVariable "teste" "GIT_LOG_LENGTH" "30" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printSectionVariable "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="GIT_LOG_LENGTH              =   30"

  mse_utest_assertEqual



  mse_conf_setSectionVariable "teste" "GIT_LOG_LENGTH" "20" "${mseTMPDIR}/tests/.config"
  testResult=$(mse_conf_printSectionVariable "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected="GIT_LOG_LENGTH              =   20"

  mse_utest_assertEqual
}
