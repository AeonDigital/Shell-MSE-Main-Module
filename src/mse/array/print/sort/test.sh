#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_print_sort() {
  unset testArray

  declare -A testArray
  testArray["grape"]="1"
  testArray["apple"]="5"
  testArray["coconut"]="4"
  testArray["banana"]="2"
  testArray["orange"]="3"

  testResult=$(mse_array_print_sort "testArray")
  testExpected="1\n"
  testExpected+="2\n"
  testExpected+="3\n"
  testExpected+="4\n"
  testExpected+="5\n"

  mse_utest_assert_string_multiline



  testResult=$(mse_array_print_sort "testArray" "v" "desc")
  testExpected="5\n"
  testExpected+="4\n"
  testExpected+="3\n"
  testExpected+="2\n"
  testExpected+="1\n"

  mse_utest_assert_string_multiline



  testResult=$(mse_array_print_sort "testArray" "k" "asc")
  testExpected="apple\n"
  testExpected+="banana\n"
  testExpected+="coconut\n"
  testExpected+="grape\n"
  testExpected+="orange\n"

  mse_utest_assert_string_multiline



  testResult=$(mse_array_print_sort "testArray" "k" "desc")
  testExpected="orange\n"
  testExpected+="grape\n"
  testExpected+="coconut\n"
  testExpected+="banana\n"
  testExpected+="apple\n"

  mse_utest_assert_string_multiline
}
