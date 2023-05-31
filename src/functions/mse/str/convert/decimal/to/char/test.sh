#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_decimal_to_char() {
  testResult=$(mse_str_convert_decimal_to_char "105")
  testExpected="i"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_decimal_to_char "195 173")
  testExpected="í"

  mse_md_utest_assertEqual
}
