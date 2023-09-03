#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_waitUser() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual


  local mseTestShowWaitUserInShell="0"
  if [ "${mseTestShowWaitUserInShell}" == "1" ]; then
    mse_interface_show_waitUser "a"
  fi
}