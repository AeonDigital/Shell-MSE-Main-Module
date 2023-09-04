#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_float() {
  testResult=$(mse_is_float "987654398.7")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_float "-9876543.987")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_float "9876543,987")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_float "987-6543.987")
  testExpected="0"

  mse_md_utest_assertEqual
}
