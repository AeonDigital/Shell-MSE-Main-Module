#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_dump() {
  unset testArray
  declare -a testArray=("one" "two" "tree" "and four")

  testResult=$(mse_array_dump "testArray")
  testExpected="declare -a testArray"
  testExpected+="\n"
  testExpected+="testArray[\"0\"]=\"one\""
  testExpected+="\n"
  testExpected+="testArray[\"1\"]=\"two\""
  testExpected+="\n"
  testExpected+="testArray[\"2\"]=\"tree\""
  testExpected+="\n"
  testExpected+="testArray[\"3\"]=\"and four\""
  testExpected=$(echo -e "${testExpected}")

  mse_md_utest_assertEqual



  unset testArray
  declare -a testArray=("one" "two" "tree" "and four")

  testResult=$(mse_array_dump "testArray" "1")
  testExpected="declare -ga testArray"
  testExpected+="\n"
  testExpected+="testArray[\"0\"]=\"one\""
  testExpected+="\n"
  testExpected+="testArray[\"1\"]=\"two\""
  testExpected+="\n"
  testExpected+="testArray[\"2\"]=\"tree\""
  testExpected+="\n"
  testExpected+="testArray[\"3\"]=\"and four\""
  testExpected=$(echo -e "${testExpected}")

  mse_md_utest_assertEqual



  unset testArray
  declare -A testArray
  testArray["one"]="um"
  testArray["two"]="dois"
  testArray["tree"]="tres"
  testArray["and four"]="e quatro"

  local tmpTestResult=$(mse_array_dump "testArray" "1")
  declare -a testResult=()

  IFS=$'\n'
  while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
    testResult+=("${mseLineRaw}")
  done <<< "${tmpTestResult}"
  IFS=$' \t\n'


  declare -a testExpected
  testExpected+=("declare -gA testArray")
  testExpected+=("testArray[\"one\"]=\"um\"")
  testExpected+=("testArray[\"two\"]=\"dois\"")
  testExpected+=("testArray[\"tree\"]=\"tres\"")
  testExpected+=("testArray[\"and four\"]=\"e quatro\"")

  mse_md_utest_assertEqual "A"
}
