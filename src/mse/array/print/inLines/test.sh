#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_array_print_inLines() {
  unset testArray
  declare -a testArray=("one" "two" "tree" "and four")

  testResult=$(mse_array_print_inLines "testArray")
  testExpected=$(echo -e "one\ntwo\ntree\nand four")

  mse_md_utest_assertEqual
}