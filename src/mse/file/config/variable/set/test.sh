#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_config_variable_set() {
  local dir=$(dirname "${BASH_SOURCE}")
  local originalDir="${dir}/attachments/test/original"
  local expectedDir="${dir}/attachments/test/expected"



  cp "${originalDir}/config.cfg" "${expectedDir}/config.cfg"
  #
  # INTERNAL VALIDATION - FAIL
  testResult=$(mse_file_config_variable_set; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Lost 8 parameters."

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "" "" "" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"PathToFile\" is required"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${originalDir}/.nonexistent" "" "" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"PathToFile\" points to a non existent file"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "" "" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"ConfigFile\" is required"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "a" "" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"ConfigFile\" has an invalid value"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"CommentChar\" is required"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarType\" is required"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "z" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarType\" has an invalid value"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "s" "" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarName\" is required"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "a" "varName" "" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarValue\" is required"

  mse_md_utest_assertEqual


  declare -a mseTmpIndexArr=()
  declare -A mseTmpAssocArr
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "a" "varName" "mseTmpAssocArr" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarValue\" must be an array"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "A" "varName" "mseTmpIndexArr" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"VarValue\" must be an associative array"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "a" "varName" "mseTmpIndexArr" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"Operation\" has an invalid option"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "a" "varName" "mseTmpIndexArr" "a" "z"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Parameter \"Position\" has an invalid option"

  mse_md_utest_assertEqual





  #
  # DEFAULT CONFIGURATION FILES - FAIL

  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "s" "GIT_LOG_LENGTH" "" "a"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Variable \"GIT_LOG_LENGTH\" already exists"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "" "s" "NONEXIST" "" "d"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Variable \"NONEXIST\" do not exists"

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NONEXIST" "" "d"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Variable \"NONEXIST\" do not exists in \"teste\" section"

  mse_md_utest_assertEqual





  #
  # DEFAULT CONFIGURATION FILES - SUCCESS

  #
  # ADD NEW VAR - IN THE TOP
  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "p"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR" "1")
  testExpected="56#NEW_TEST_VAR=ntv_01"

  mse_md_utest_assertEqual



  #
  # REMOVE VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "" "d"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR")
  testExpected=""

  mse_md_utest_assertEqual



  #
  # MODIFY VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "50" "m"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # COMMENT VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "" "c"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="#GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # UNCOMMENT VAR
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "GIT_LOG_LENGTH" "" "u"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "GIT_LOG_LENGTH")
  testExpected="GIT_LOG_LENGTH              =   50"

  mse_md_utest_assertEqual



  #
  # ADD NEW VAR - IN THE BOTTOM
  testResult=$(mse_file_config_variable_set "${expectedDir}/config.cfg" "1" "#" "teste" "s" "NEW_TEST_VAR" "ntv_01" "a" "a"; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual


  testResult=$(mse_file_config_variable_showLine "${expectedDir}/config.cfg" "teste" "NEW_TEST_VAR" "1")
  testExpected="59#NEW_TEST_VAR=ntv_01"

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - FAIL

  cp "${originalDir}/.bashrc" "${expectedDir}/.bashrc"


  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "s" "NONEXIST" "ntv_01" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="0 Cannot identify the target line to perform this operation."

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - SCALAR SUCCESS

  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "s" "MSE_UTEST" "ntv_01" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

  mse_md_utest_assertEqual





  #
  # SCRIPT FILES - ARRAY SUCCESS

  # Prepares the reader to rescue the affected lines
  unset mseReadOptionsUTest
  declare -A mseReadOptionsUTest
  mse_file_prepareRead "mseReadOptionsUTest"

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

  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "a" "MSE_UTEST" "mseTmpIndexArr" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

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
  testResult=$(mse_file_config_variable_set "${expectedDir}/.bashrc" "0" "#" "" "A" "MSE_UTEST" "mseTmpAssocArr" "" ""; printf " ${MSE_LAST_FUNCTION_ERR_MESSAGE}")
  testExpected="1 "

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