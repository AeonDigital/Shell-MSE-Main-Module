#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showVariableLine() {
  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "GIT_LOG_LENGTH")
  testExpected=$(printf "GIT_LOG_LENGTH              =   10")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "EMAIL_HOST")
  testExpected=$(printf "EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual


  testResult=$(mse_conf_showVariableLine "${mseTMPDIR}/tests/.config" "EMAIL_HOST" "1")
  testExpected=$(printf "29#EMAIL_HOST                  =   192.168.1.206")

  mse_utest_assertEqual
}
