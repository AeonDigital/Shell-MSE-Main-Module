#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_is_char_octal() {
  testResult=$(mse_is_char_octal "151")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_octal "303 255")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_octal 151)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_octal 012)
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_octal 2)
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_is_char_octal 1512)
  testExpected="0"

  mse_md_utest_assertEqual
}
