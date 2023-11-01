#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_config_variable_showLine() {
  local dir=$(echo "${BASH_SOURCE%/*}")


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   10"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "" "EMAIL_HOST")
  testExpected="EMAIL_HOST                  =   192.168.1.206"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "" "EMAIL_HOST" "1")
  testExpected="29#EMAIL_HOST                  =   192.168.1.206"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "" "COMMENT_TEST" "1")
  testExpected="23##COMMENT_TEST                =   value"

  mse_md_utest_assertEqual





  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "webserver" "CONTAINER_WEBSERVER_NAME")
  testExpected="CONTAINER_WEBSERVER_NAME    =   dev-php-webserver"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "email" "EMAIL_HOST")
  testExpected="EMAIL_HOST                  =   192.168.1.206"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "email" "EMAIL_HOST" "1")
  testExpected="29#EMAIL_HOST                  =   192.168.1.206"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${dir}/attachments/test/config.cfg" "database" "COMMENT_TEST" "1")
  testExpected="52##COMMENT_TEST                =   value"

  mse_md_utest_assertEqual
}
