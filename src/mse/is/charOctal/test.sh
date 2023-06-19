#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_charOctal() {
  testResult=$(mse_is_charOctal "151")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charOctal "303 255")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charOctal 151)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charOctal 012)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charOctal 2)
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charOctal 1512)
  testExpected="0"

  mse_md_utest_assertEqual
}
