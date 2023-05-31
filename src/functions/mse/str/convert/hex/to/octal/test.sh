#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_convert_hex_to_octal() {
  testResult=$(mse_str_convert_hex_to_octal "69")
  testExpected="151"

  mse_md_utest_assertEqual


  testResult=$(mse_str_convert_hex_to_octal "C3 AD")
  testExpected="303 255"

  mse_md_utest_assertEqual
}
