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
  testExpected="1"
  testExpected+="\n"
  testExpected+="2"
  testExpected+="\n"
  testExpected+="3"
  testExpected+="\n"
  testExpected+="4"
  testExpected+="\n"
  testExpected+="5"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals



  testResult=$(mse_array_print_sort "testArray" "v" "desc")
  testExpected="5"
  testExpected+="\n"
  testExpected+="4"
  testExpected+="\n"
  testExpected+="3"
  testExpected+="\n"
  testExpected+="2"
  testExpected+="\n"
  testExpected+="1"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals



  testResult=$(mse_array_print_sort "testArray" "k" "asc")
  testExpected="apple"
  testExpected+="\n"
  testExpected+="banana"
  testExpected+="\n"
  testExpected+="coconut"
  testExpected+="\n"
  testExpected+="grape"
  testExpected+="\n"
  testExpected+="orange"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals



  testResult=$(mse_array_print_sort "testArray" "k" "desc")
  testExpected="orange"
  testExpected+="\n"
  testExpected+="grape"
  testExpected+="\n"
  testExpected+="coconut"
  testExpected+="\n"
  testExpected+="banana"
  testExpected+="\n"
  testExpected+="apple"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals
}
