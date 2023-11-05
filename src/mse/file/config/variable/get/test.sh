#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_config_variable_get() {
  local dir=$(echo "${BASH_SOURCE%/*}")


  testResult=$(mse_file_config_variable_get "${dir}/attachments/test/config.cfg" "" "GIT_LOG_LENGTH")
  testExpected="10"

  mse_utest_assert_equals


  testResult=$(mse_file_config_variable_get "${dir}/attachments/test/config.cfg" "" "REQUEST_TIMEOUT")
  testExpected="1200"

  mse_utest_assert_equals





  testResult=$(mse_file_config_variable_get "${dir}/attachments/test/config.cfg" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected="dev-php-webserver"

  mse_utest_assert_equals


  testResult=$(mse_file_config_variable_get "${dir}/attachments/test/config.cfg" "email" "EMAIL_HOST")
  testExpected="192.168.1.206"

  mse_utest_assert_equals
}
