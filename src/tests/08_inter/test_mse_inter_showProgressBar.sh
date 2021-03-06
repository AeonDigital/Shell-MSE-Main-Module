#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showProgressBar() {
  mse_inter_showProgressBar
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 16 parameters."

  mse_utest_assertEqual


  mse_inter_showProgressBar "a1" "a2"
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 14 parameters."

  mse_utest_assertEqual





  declare -A mseArgs
  mseArgs["ProgressBarIndent"]="     "
  mseArgs["ProgressBarFormat"]="FREEFORMAT"


  #
  # Bloco 01: Barra de progresso
  mseArgs["ProgressBarColor"]="1"
  mseArgs["ProgressBarBlockStart"]="[["
  mseArgs["ProgressBarBlockEnd"]="]]"
  mseArgs["ProgressBarBlockChar"]="="
  mseArgs["ProgressBarTotalCharLength"]="60"
  mseArgs["ProgressBarAtualPercentProgress"]="60"


  #
  # Bloco 02: Área informativa
  mseArgs["ProgressBarInfoDisplay"]="1"
  mseArgs["ProgressBarInfoColor"]="1"
  mseArgs["ProgressBarInfoPosition"]="r"
  mseArgs["ProgressBarInfoBlockStart"]="|"
  mseArgs["ProgressBarInfoBlockEnd"]="|"
  mseArgs["ProgressBarInfoUsePercent"]="0"
  mseArgs["ProgressBarInfoData"]="nhá"





  #
  # Valida os argumentos passados
  mse_exec_validate mse_inter_showProgressBar "${mseArgs[ProgressBarIndent]}" "${mseArgs[ProgressBarFormat]}" "${mseArgs[ProgressBarColor]}" "${mseArgs[ProgressBarBlockStart]}" "${mseArgs[ProgressBarBlockEnd]}" "${mseArgs[ProgressBarBlockChar]}" "${mseArgs[ProgressBarTotalCharLength]}" "${mseArgs[ProgressBarAtualPercentProgress]}" "${mseArgs[ProgressBarInfoDisplay]}" "${mseArgs[ProgressBarInfoColor]}" "${mseArgs[ProgressBarInfoPosition]}" "${mseArgs[ProgressBarInfoBlockStart]}" "${mseArgs[ProgressBarInfoBlockEnd]}" "${mseArgs[ProgressBarInfoUsePercent]}" "${mseArgs[ProgressBarInfoData]}" "mse_inter_theme_default" &> /dev/null

  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected=""

  mse_utest_assertEqual


  #
  # Evoca a função
  #
  # Verifica os valores realmente definidos
  # e que serão passados para a função do tema gerador da mensagem
  mse_inter_showProgressBar "${mseArgs[ProgressBarIndent]}" "${mseArgs[ProgressBarFormat]}" "${mseArgs[ProgressBarColor]}" "${mseArgs[ProgressBarBlockStart]}" "${mseArgs[ProgressBarBlockEnd]}" "${mseArgs[ProgressBarBlockChar]}" "${mseArgs[ProgressBarTotalCharLength]}" "${mseArgs[ProgressBarAtualPercentProgress]}" "${mseArgs[ProgressBarInfoDisplay]}" "${mseArgs[ProgressBarInfoColor]}" "${mseArgs[ProgressBarInfoPosition]}" "${mseArgs[ProgressBarInfoBlockStart]}" "${mseArgs[ProgressBarInfoBlockEnd]}" "${mseArgs[ProgressBarInfoUsePercent]}" "${mseArgs[ProgressBarInfoData]}" "mse_inter_theme_default" &> /dev/null

  local mseKey
  for mseKey in "${!mseArgs[@]}"; do
    testResult="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[$mseKey]}"
    testExpected="${mseArgs[$mseKey]}"

    mse_utest_assertEqual
  done


  local mseTestInShell="0"
  if [ "${mseTestInShell}" == "1" ]; then
    mse_inter_setProgressBar "0"
    sleep 0.5
    mse_inter_setProgressBar "1"
    sleep 0.5
    mse_inter_setProgressBar "2"
    sleep 0.5
    mse_inter_setProgressBar "3"
    sleep 0.5
    mse_inter_setProgressBar "4"
    sleep 0.5
    mse_inter_setProgressBar "5"
    sleep 0.5
    mse_inter_setProgressBar "10"
    sleep 0.5
    mse_inter_setProgressBar "15"
    sleep 0.5
    mse_inter_setProgressBar "20"
    sleep 0.5
    mse_inter_setProgressBar "25"
    sleep 0.5
    mse_inter_setProgressBar "50"
    sleep 0.5
    mse_inter_setProgressBar "75"
    sleep 0.5
    mse_inter_setProgressBar "100"
  fi
}
