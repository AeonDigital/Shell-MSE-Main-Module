#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_hex_toOctal() {
  testResult=$(mse_str_convert_hex_toOctal "69")
  testExpected="151"

  mse_utest_assert_equals


  testResult=$(mse_str_convert_hex_toOctal "C3 AD")
  testExpected="303 255"

  mse_utest_assert_equals
}
