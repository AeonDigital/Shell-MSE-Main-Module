#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_int() {
  testResult=$(mse_is_int "9876543987")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_int "-9876543987")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_int "9876543.987")
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_int "987-6543987")
  testExpected="0"

  mse_md_utest_assertEqual
}
