#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_print_unique() {
  unset testArray
  declare -a testArray=(3 1 4 1 9 5 2 3)

  testResult=$(mse_array_print_unique "testArray")
  testExpected="3"
  testExpected+="\n"
  testExpected+="1"
  testExpected+="\n"
  testExpected+="4"
  testExpected+="\n"
  testExpected+="9"
  testExpected+="\n"
  testExpected+="5"
  testExpected+="\n"
  testExpected+="2"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals



  unset testArray
  declare -a testArray=("banana" "apple" "apple" "orange" "apple" "grape" "kiwi" "orange")

  testResult=$(mse_array_print_unique "testArray")
  testExpected="banana"
  testExpected+="\n"
  testExpected+="apple"
  testExpected+="\n"
  testExpected+="orange"
  testExpected+="\n"
  testExpected+="grape"
  testExpected+="\n"
  testExpected+="kiwi"
  testExpected=$(echo -e "${testExpected}")

  mse_utest_assert_equals
}
