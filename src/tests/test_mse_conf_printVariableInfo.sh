#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printVariableInfo() {
  testResult=$(mse_conf_printVariableInfo "CONTAINER_WEBSERVER_NAME" "${mseTMPDIR}/tests/.config")
  testExpected=$(printf "CONTAINER_WEBSERVER_NAME\ndev-php-webserver\n")

  mse_utest_assertEqual



  testResult=$(mse_conf_printSectionVariableInfo "teste" "GIT_LOG_LENGTH" "${mseTMPDIR}/tests/.config")
  testExpected=$(printf "GIT_LOG_LENGTH\n20\n")

  mse_utest_assertEqual
}
