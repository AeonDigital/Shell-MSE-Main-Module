#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_get_boundaryLineNumbers() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  testResult=$(mse_file_get_boundaryLineNumbers "${dir}/attachments/test/sample/.config" "#" "" "" "")
  testExpected="1 58"

  mse_utest_assert_equals


  testResult=$(mse_file_get_boundaryLineNumbers "${dir}/attachments/test/sample/.config" "#" "1" "email" "")
  testExpected="27 41"

  mse_utest_assert_equals


  testResult=$(mse_file_get_boundaryLineNumbers "${dir}/attachments/test/sample/.config" "#" "1" "email" "" "1")
  testExpected="27 38"

  mse_utest_assert_equals


  testResult=$(mse_file_get_boundaryLineNumbers "${dir}/attachments/test/sample/.config" "#" "1" "teste" "")
  testExpected="55 58"

  mse_utest_assert_equals


  testResult=$(mse_file_get_boundaryLineNumbers "${dir}/attachments/test/sample/.bashrc" "#" "0" "# [[INI-MYSHELLENV]]" "# [[END-MYSHELLENV]]")
  testExpected="27 32"

  mse_utest_assert_equals
}
