#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_integer() {
  testResult=$(mse_is_integer "9876543987")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_integer "-9876543987")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_integer "9876543.987")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_integer "987-6543987")
  testExpected="0"

  mse_md_utest_assertEqual
}
