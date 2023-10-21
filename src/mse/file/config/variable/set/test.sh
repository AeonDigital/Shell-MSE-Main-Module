#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_config_variable_set() {
  local dir=$(dirname "${BASH_SOURCE}")
  local originalDir="${dir}/attachments/test/original"
  local expectedDir="${dir}/attachments/test/expected"
  local rawResult=""



  cp "${originalDir}/config.cfg" "${expectedDir}/config.cfg"
  #
  # DEFAULT CONFIGURATION FILES - FAIL

  rawResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "s" "GIT_LOG_LENGTH" "" "a")
  testResult="${rawResult%%[![:graph:]]*}"
  testExpected="0"

  mse_md_utest_assertEqual

  testResult="${rawResult#*[![:graph:]]}"
  testExpected="Variable \"GIT_LOG_LENGTH\" already exists"

  mse_md_utest_assertEqual




  rawResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "s" "NONEXIST" "" "d")
  testResult="${rawResult%%[![:graph:]]*}"
  testExpected="0"

  mse_md_utest_assertEqual

  testResult="${rawResult#*[![:graph:]]}"
  testExpected="Variable \"NONEXIST\" do not exists"

  mse_md_utest_assertEqual




  rawResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NONEXIST" "" "d")
  testResult="${rawResult%%[![:graph:]]*}"
  testExpected="0"

  mse_md_utest_assertEqual

  testResult="${rawResult#*[![:graph:]]}"
  testExpected="Variable \"NONEXIST\" do not exists in \"teste\" section"

  mse_md_utest_assertEqual







  #
  # DEFAULT CONFIGURATION FILES - SUCCESS

  #
  # ADD NEW VAR - IN THE TOP
  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "p")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR" "1")
  testExpected="56#NEW_TEST_VAR=ntv_01"

  mse_md_utest_assertEqual



  #
  # REMOVE VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "" "d")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_md_utest_assertEqual



  #
  # MODIFY VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "50" "m")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # COMMENT VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "" "c")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="#GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # UNCOMMENT VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "" "u")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # ADD NEW VAR - IN THE BOTTOM
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "a")
  testExpected="1"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR" "1")
  testExpected="59#NEW_TEST_VAR=ntv_01"

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - FAIL

  cp "${originalDir}/.bashrc" "${expectedDir}/.bashrc"


  rawResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "s" "NONEXIST" "ntv_01" "" "")
  testResult="${rawResult%%[![:graph:]]*}"
  testExpected="0"

  mse_md_utest_assertEqual

  testResult="${rawResult#*[![:graph:]]}"
  testExpected="Cannot identify the target line to perform this operation."

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - SCALAR SUCCESS

  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "s" "MSE_UTEST" "ntv_01" "" "")
  testExpected="1"

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - ARRAY SUCCESS

  # Prepares the reader to rescue the affected lines
  unset mseReadOptionsUTest
  declare -A mseReadOptionsUTest
  mse_prepare_file_read "mseReadOptionsUTest"

  mseReadOptionsUTest["block_start_check"]="mse_file_read_checkArbitratySection_start"
  mseReadOptionsUTest["block_start_check_args"]="# [[INI-MSE_UTEST]]"
  mseReadOptionsUTest["block_start_get_first_line"]="1"

  mseReadOptionsUTest["block_end_check"]="mse_file_read_checkArbitratySection_end"
  mseReadOptionsUTest["block_end_check_args"]="# [[END-MSE_UTEST]]"
  mseReadOptionsUTest["block_end_get_last_line"]="1"


  declare -a tmpExpectedLines=()
  tmpExpectedLines=()
  tmpRawExpectedLines+=("# [[INI-MSE_UTEST]]")
  tmpRawExpectedLines+=("MSE_UTEST=ntv_01")
  tmpRawExpectedLines+=("# [[END-MSE_UTEST]]")

  testResult=$(mse_file_read "${expectedDir}/.bashrc" "mseReadOptionsUTest" "1" "0")
  testExpected=$(printf "%s\n" "${tmpRawExpectedLines[@]}")

  mse_md_utest_assertEqual
  unset tmpRawExpectedLines



  #
  # Writes a variable of type array
  unset mseTmpIndexArr
  declare -a mseTmpIndexArr=()
  mseTmpIndexArr=()
  mseTmpIndexArr+=("first")
  mseTmpIndexArr+=("second")

  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "a" "MSE_UTEST" "mseTmpIndexArr" "" "")
  testExpected="1"

  mse_md_utest_assertEqual



  #
  # Verifies that the variable was written as expected
  declare -a tmpExpectedLines=()
  tmpExpectedLines=()
  tmpRawExpectedLines+=("# [[INI-MSE_UTEST]]")
  tmpRawExpectedLines+=("declare -ga MSE_UTEST")
  tmpRawExpectedLines+=("MSE_UTEST[0]=\"first\"")
  tmpRawExpectedLines+=("MSE_UTEST[1]=\"second\"")
  tmpRawExpectedLines+=("# [[END-MSE_UTEST]]")

  testResult=$(mse_file_read "${expectedDir}/.bashrc" "mseReadOptionsUTest" "1" "0")
  testExpected=$(printf "%s\n" "${tmpRawExpectedLines[@]}")

  mse_md_utest_assertEqual
  unset tmpRawExpectedLines




  #
  # SCRIPT FILES - ASSOC SUCCESS

  #
  # Writes a variable of type associative array
  unset mseTmpAssocArr
  declare -A mseTmpAssocArr
  mseTmpAssocArr["first"]="one"
  mseTmpAssocArr["second"]="two"
  mseTmpAssocArr["third"]="tree"
  mseTmpAssocArr["fourth"]="four"
  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "A" "MSE_UTEST" "mseTmpAssocArr" "" "")
  testExpected="1"

  mse_md_utest_assertEqual



  #
  # Verifies that the variable was written as expected
  local tmpTestResult=$(mse_file_read "${expectedDir}/.bashrc" "mseReadOptionsUTest" "1" "0")
  declare -a testResult=()

  IFS=$'\n'
  while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
    testResult+=("${mseLineRaw}")
  done <<< "${tmpTestResult}"
  IFS=$' \t\n'

  declare -a testExpected
  testExpected+=("# [[INI-MSE_UTEST]]")
  testExpected+=("declare -gA MSE_UTEST")
  testExpected+=("MSE_UTEST[\"first\"]=\"one\"")
  testExpected+=("MSE_UTEST[\"second\"]=\"two\"")
  testExpected+=("MSE_UTEST[\"third\"]=\"tree\"")
  testExpected+=("MSE_UTEST[\"fourth\"]=\"four\"")
  testExpected+=("# [[END-MSE_UTEST]]")

  mse_md_utest_assertArrays "a" "0"
  unset tmpRawExpectedLines
}