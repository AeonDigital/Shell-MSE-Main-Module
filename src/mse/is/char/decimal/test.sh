#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_char_decimal() {
  testResult=$(mse_is_char_decimal "105")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_decimal "195 173")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_decimal "a")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_decimal 1)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_decimal 12b)
  testExpected="0"

  mse_md_utest_assertEqual
}
