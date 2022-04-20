#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_str_join() {
  testResult=$(mse_str_join)
  testExpected="Parameter \"Glue\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_join "-")
  testExpected="Parameter \"ArrayName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_str_join "-" "myArray")
  testExpected="Parameter \"ArrayName\" is not an array name"

  mse_utest_assertEqual


  myArray=("2022" "12" "22")
  testResult="$(mse_str_join "-" "myArray")"
  testExpected="2022-12-22"

  mse_utest_assertEqual


  myArray=("2022" "12" "22")
  testResult="$(mse_str_join "::" "myArray")"
  testExpected="2022::12::22"

  mse_utest_assertEqual
}
