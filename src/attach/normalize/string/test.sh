#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_normalize_string() {
  local mseTestMultilineResult=""
  local mseTestMultilineExpected=""

  mseTestMultilineResult+="\ntest 0 with \`multiline\`"
  mseTestMultilineResult+="\nstring "
  mseTestMultilineResult+=" \0null "
  mseTestMultilineExpected+="\ntest 0 with \`multiline\`"
  mseTestMultilineExpected+="\nstring "
  mseTestMultilineExpected+=" \0null "


  testResult="${mseTestMultilineResult}"
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_equals



  testResult=$(mse_normalize_string "${mseTestMultilineResult}")
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_not_equals
}