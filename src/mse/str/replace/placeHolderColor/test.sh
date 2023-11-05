#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_replace_placeHolderColor() {
  local tmpNONE='\e[0m'
  local tmpRED='\e[20;49;31m'
  local tmpBlue='\e[20;49;34m'

  testResult=$(mse_str_replace_placeHolderColor)
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red" "PH")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red" "PH" "test")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red" "PH" "test" "${tmpRED}" "wrong")
  testExpected=""

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red" "PH" "test" "${tmpRED}")
  testExpected=$(echo -n "this is a ${tmpRED}test${tmpNONE} in red")

  mse_utest_assert_equals


  testResult=$(mse_str_replace_placeHolderColor "this is a [[PH]] in red and [[APH]] in blue" "PH" "test" "${tmpRED}" "APH" "another" "${tmpBlue}")
  testExpected=$(echo -n "this is a ${tmpRED}test${tmpNONE} in red and ${tmpBlue}another${tmpNONE} in blue")

  mse_utest_assert_equals
}