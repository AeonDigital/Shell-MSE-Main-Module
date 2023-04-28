#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_charDecimal() {
  testResult=$(mse_is_charDecimal "105")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charDecimal "195 173")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charDecimal "a")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charDecimal 1)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_charDecimal 12b)
  testExpected="0"

  mse_md_utest_assertEqual
}
