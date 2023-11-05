#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_config_variable_showAll() {
  local dir=$(echo "${BASH_SOURCE%/*}")

  testResult=$(mse_file_config_variable_showAll "${dir}/attachments/test/config.cfg")
  testExpected=$(< "${dir}/attachments/test/showAll_01.cfg")

  mse_utest_assert_equals


  testResult=$(mse_file_config_variable_showAll "${dir}/attachments/test/config.cfg" "" "1")
  testExpected=$(< "${dir}/attachments/test/showAll_02.cfg")

  mse_utest_assert_equals




  testResult=$(mse_file_config_variable_showAll "${dir}/attachments/test/config.cfg" "webserver")
  testExpected=$(< "${dir}/attachments/test/showAll_03.cfg")

  mse_utest_assert_equals


  testResult=$(mse_file_config_variable_showAll "${dir}/attachments/test/config.cfg" "webserver" "1")
  testExpected=$(< "${dir}/attachments/test/showAll_04.cfg")

  mse_utest_assert_equals
}