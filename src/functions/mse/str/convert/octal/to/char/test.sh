#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_octal_to_char() {
  testResult=$(mse_str_convert_octal_to_char "151")
  testExpected="i"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_octal_to_char "303 255")
  testExpected="í"

  mse_md_utest_assertEqual
}
