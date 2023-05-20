#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_to_lower() {
  testResult=$(mse_str_to_lower "CONVERT To Lower Case")
  testExpected="convert to lower case"

  mse_md_utest_assertEqual
}
