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

  mse_utest_assert_equals



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

  mse_utest_assert_equals



  unset testArray
  declare -a testArray=("one" "two" "tree" "and four")

  testResult=$(mse_array_dump "testArray" "1" "useName")
  testExpected="declare -ga useName"
  testExpected+="\n"
  testExpected+="useName[\"0\"]=\"one\""
  testExpected+="\n"
  testExpected+="useName[\"1\"]=\"two\""
  testExpected+="\n"
  testExpected+="useName[\"2\"]=\"tree\""
  testExpected+="\n"
  testExpected+="useName[\"3\"]=\"and four\""
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals



  unset testArray
  declare -a testArray=("one" "two" "tree" "and four")

  testResult=$(mse_array_dump "testArray" "1" "useName" "# ")
  testExpected="# declare -ga useName"
  testExpected+="\n"
  testExpected+="# useName[\"0\"]=\"one\""
  testExpected+="\n"
  testExpected+="# useName[\"1\"]=\"two\""
  testExpected+="\n"
  testExpected+="# useName[\"2\"]=\"tree\""
  testExpected+="\n"
  testExpected+="# useName[\"3\"]=\"and four\""
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals





  unset testArray
  declare -A testArray
  testArray["one"]="um"
  testArray["two"]="dois"
  testArray["tree"]="tres"
  testArray["and four"]="e quatro"

  local tmpTestResult=$(mse_array_dump "testArray" "1")
  IFS=$'\n'
  declare -a testResult=($(echo -e "${tmpTestResult[@]}"))
  IFS=$' \t\n'



  declare -a testExpected
  testExpected+=("declare -gA testArray")
  testExpected+=("testArray[\"one\"]=\"um\"")
  testExpected+=("testArray[\"two\"]=\"dois\"")
  testExpected+=("testArray[\"tree\"]=\"tres\"")
  testExpected+=("testArray[\"and four\"]=\"e quatro\"")

  mse_utest_assert_equals "A"
}
