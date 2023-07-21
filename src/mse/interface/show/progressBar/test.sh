#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_progressBar() {
  #
  # Evoca a função principal
  unset mseTestArrShowProgressBar
  declare -A mseTestArrShowProgressBar
  mse_interface_show_progressBar "mseTestArrShowProgressBar" "default" "50" "10" "l" "teste" &> /dev/null


  #
  # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  testResult="${mseTestArrShowProgressBar[meta_format]}"
  testExpected="default"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_max_char_length]}"
  testExpected="50"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_atual_progress]}"
  testExpected="10"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_align]}"
  testExpected="left"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_data]}"
  testExpected="teste"

  mse_md_utest_assertEqual





  mse_interface_show_progressBar "mseTestArrShowProgressBar" "onlybar" "55" "30" "l" "teste 02" &> /dev/null

  #
  # Atesta as informações passadas alteraram o array associativo que configura a mensagem
  testResult="${mseTestArrShowProgressBar[meta_format]}"
  testExpected="onlybar"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_max_char_length]}"
  testExpected="55"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[bar_atual_progress]}"
  testExpected="30"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_align]}"
  testExpected="right"

  mse_md_utest_assertEqual


  testResult="${mseTestArrShowProgressBar[info_data]}"
  testExpected=""

  mse_md_utest_assertEqual





  local mseTestShowProgressBarInShell="1"
  if [ "${mseTestShowProgressBarInShell}" == "1" ]; then
    mse_interface_show_progressBar "mseTestArrShowProgressBar" "default" "60" "0" "right" "Informação adicional"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "1"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "2"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "3"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "4"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "5"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "10" ""
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "15"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "20"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "25"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "50" "Chegou na metade"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "70"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "85"
    sleep 0.5
    mse_interface_update_progressBar "mseTestArrShowProgressBar" "100" "Finalizou"
  fi



}