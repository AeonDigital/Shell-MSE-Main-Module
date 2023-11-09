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

  mse_utest_assert_string_multiline



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

  mse_utest_assert_string_multiline



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

  mse_utest_assert_string_multiline



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

  mse_utest_assert_string_multiline





  unset testArray
  declare -A testArray
  testArray["one"]="um"
  testArray["two"]="dois"
  testArray["tree"]="tres"
  testArray["and four"]="e quatro"

  testResult=$(mse_array_dump "testArray" "1")
  testExpected="declare -gA testArray"
  testExpected+="\n"
  testExpected+="testArray[\"and four\"]=\"e quatro\""
  testExpected+="\n"
  testExpected+="testArray[\"one\"]=\"um\""
  testExpected+="\n"
  testExpected+="testArray[\"tree\"]=\"tres\""
  testExpected+="\n"
  testExpected+="testArray[\"two\"]=\"dois\""

  mse_utest_assert_string_multiline
}
