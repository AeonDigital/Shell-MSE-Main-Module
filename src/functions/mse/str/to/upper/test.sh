#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_to_upper() {
  testResult=$(mse_str_to_upper "convert To Upper Case")
  testExpected="CONVERT TO UPPER CASE"

  mse_md_utest_assertEqual
}
