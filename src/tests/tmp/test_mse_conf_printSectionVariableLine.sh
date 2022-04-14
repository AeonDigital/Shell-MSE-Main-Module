#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_printSectionVariableLine() {
  testResult=$(mse_conf_printSectionVariableLine "${mseTMPDIR}/tests/.config" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected=$(printf "CONTAINER_WEBSERVER_NAME    =   dev-php-webserver")

  mse_utest_assertEqual


  testResult=$(mse_conf_printSectionVariableLine "${mseTMPDIR}/tests/.config" "email" "EMAIL_HOST")
  testExpected=$(printf "EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_conf_printSectionVariableLine "${mseTMPDIR}/tests/.config" "email" "EMAIL_HOST" "1")
  testExpected=$(printf "29#EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual
}
