#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_check_hasKeyInAssocArray() {
  testResult=$(mse_exec_validate mse_check_hasKeyInAssocArray)
  testExpected="0"

  mse_utest_assertEqual

  #
  # Neste ponto é preciso fazer o teste sem usar um subshell pois de
  # outra forma as variáveis globais do shell pai não serão setadas.
  mse_exec_validate mse_check_hasKeyInAssocArray &> /dev/null
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Parameter \"KeyName\" is required"

  mse_utest_assertEqual

  #
  # Se quiser/precisar usar um subshell e precisar do resultado de
  # ambos valores, uma solução como a descrita abaixo pode ser tentada.
  mseTest=$(mse_exec_validate mse_check_hasKeyInAssocArray; printf " :: ${MSE_GLOBAL_LASTERR}")
  testResult="${mseTest}"
  testExpected="0 :: Parameter \"KeyName\" is required"

  mse_utest_assertEqual



  unset testAssocArray
  declare -A testAssocArray
  testAssocArray["key1"]="one"
  testResult=$(mse_check_hasKeyInAssocArray "key2" "testAssocArray")
  testExpected="0"

  mse_utest_assertEqual


  testResult=$(mse_check_hasKeyInAssocArray "key1" "testAssocArray")
  testExpected="1"

  mse_utest_assertEqual
}
