#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_isChar() {
  testResult=$(mse_check_isChar "a")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar "á")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar "ab")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar "1")
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar 1)
  testExpected="1"

  mse_utest_assertEqual


  testResult=$(mse_check_isChar 12)
  testExpected="0"

  mse_utest_assertEqual





  testResult=$(mse_exec_validate mse_check_isChar)
  testExpected="0"

  mse_utest_assertEqual

  #
  # Neste ponto é preciso fazer o teste sem usar um subshell pois de
  # outra forma as variáveis globais do shell pai não serão setadas.
  mse_exec_validate mse_check_isChar &> /dev/null
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Parameter \"Value\" is required"

  mse_utest_assertEqual

  #
  # Se quiser/precisar usar um subshell e precisar do resultado de
  # ambos valores, uma solução como a descrita abaixo pode ser tentada.
  mseTest=$(mse_exec_validate mse_check_isChar && printf " :: ${MSE_GLOBAL_RETURN}" || printf " :: ${MSE_GLOBAL_LASTERR}")
  testResult="${mseTest}"
  testExpected="0 :: Parameter \"Value\" is required"

  mse_utest_assertEqual
}
