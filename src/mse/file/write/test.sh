#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_write() {
  local dir=$(dirname "${BASH_SOURCE}")
  local originalDir="${dir}/attachments/test/original"
  local expectedDir="${dir}/attachments/test/expected"

  declare -a ContentArrayName=()
  ContentArrayName+=("NL: 1")
  ContentArrayName+=("NL: 2")
  ContentArrayName+=("NL: 3")



  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # PREPEND - OK
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "p")
  testExpected="1"

  mse_md_utest_assertEqual

  testResult="$(< "${expectedDir}/test_mse_file_write_result")"
  testExpected="$(< "${expectedDir}/test_mse_file_write_result_1")"

  mse_md_utest_assertEqual






  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # REPLACE - ERROR 01
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" is required for \"replace\" operation"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 02
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "invalidfunction"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"-\": \"invalidfunction\"  :: 2 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 03
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "mse_str_trim"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"fn mse_str_trim\": \"\"  :: 1 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 04
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "3000"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Outside the file limits; 1 - 7 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 05
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"-\": \"\"  :: 1 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 06
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "2 4 6"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"-\": \"2 4 6\"  :: 1 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 07
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "a 4"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"-\": \"a 4\"  :: 2 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 08
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "2 b"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ Expected a function name or one/two integers; \"-\": \"2 b\"  :: 3 ]"

  mse_md_utest_assertEqual


  #
  # REPLACE - ERROR 09
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "2 1"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"targetLine\" has an invalid value [ First line must be less than the last: \"2 1\" ]"

  mse_md_utest_assertEqual



  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # REPLACE - OK 01
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "3")
  testExpected="1"

  mse_md_utest_assertEqual

  testResult="$(< "${expectedDir}/test_mse_file_write_result")"
  testExpected="$(< "${expectedDir}/test_mse_file_write_result_2")"

  mse_md_utest_assertEqual



  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # REPLACE - OK 02
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "r" "2 4")
  testExpected="1"

  mse_md_utest_assertEqual

  testResult="$(< "${expectedDir}/test_mse_file_write_result")"
  testExpected="$(< "${expectedDir}/test_mse_file_write_result_3")"

  mse_md_utest_assertEqual






  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # APPEND - OK
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "a")
  testExpected="1"

  mse_md_utest_assertEqual

  testResult="$(< "${expectedDir}/test_mse_file_write_result")"
  testExpected="$(< "${expectedDir}/test_mse_file_write_result_4")"

  mse_md_utest_assertEqual






  cp "${originalDir}/test_mse_file_write_raw" "${expectedDir}/test_mse_file_write_result"
  #
  # APPEND - OK
  testResult=$(mse_file_write "${expectedDir}/test_mse_file_write_result" "ContentArrayName" "d" "2 4")
  testExpected="1"

  mse_md_utest_assertEqual

  testResult="$(< "${expectedDir}/test_mse_file_write_result")"
  testExpected="$(< "${expectedDir}/test_mse_file_write_result_5")"

  mse_md_utest_assertEqual
}
