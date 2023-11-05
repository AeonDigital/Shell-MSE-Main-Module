#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_trim() {
  local testTmp=$(mse_str_trim "   texto   aqui   ")

  testResult="===${testTmp}==="
  testExpected="===texto   aqui==="

  mse_utest_assert_equals


  declare -a mseTmpArr=("first" "second" "third")
  testTmp=$(mse_str_trim "${mseTmpArr[*]:1}")

  testResult="===${testTmp}==="
  testExpected="===second third==="

  mse_utest_assert_equals
}
