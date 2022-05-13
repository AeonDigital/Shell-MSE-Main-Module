#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showMessage() {
  mse_inter_showMessage
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 24 arguments."

  #mse_utest_assertEqual


  mse_inter_showMessage "a1" "a2"
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 22 arguments."

  #mse_utest_assertEqual





  declare -A mseArgs
  mseArgs["MessageType"]="a"
  mseArgs["CustomMessageType"]="Custom"

  mseArgs["DisplayTitle"]="1"
  mseArgs["TopSeparatorTitle"]="\n  ----------------------\n"
  mseArgs["TopSeparatorTitleColor"]="1"
  mseArgs["IndentTitle"]="  "
  mseArgs["BulletTitle"]=":: "
  mseArgs["BulletTitleColor"]="1"
  mseArgs["TextTitle"]="Show Message Title"
  mseArgs["TextTitleColor"]="1"
  mseArgs["BottomSeparatorTitle"]="\n  ----------------------\n"
  mseArgs["BottomSeparatorTitleColor"]="1"

  mseArgs["DisplayBodyMessage"]="1"
  mseArgs["IndentBodyMessageFirstLine"]="  "
  mseArgs["BulletBodyMessageFirstLine"]="-"
  mseArgs["BulletBodyMessageFirstLineColor"]="1"
  mseArgs["IndentBodyMessageAnotherLines"]="  "
  mseArgs["BulletBodyMessageAnotherLines"]=":"
  mseArgs["BulletBodyMessageAnotherLinesColor"]="1"

  mseArgs["BodyMessageArrayName"]="arrMsg"
  mseArgs["BodyMessageArrayNameColor"]="1"
  mseArgs["SeparatorBodyMessage"]="\n"
  mseArgs["SeparatorBodyMessageColor"]="1"


  declare -a arrMsg
  arrMsg+=("First Line")
  arrMsg+=("Second Line")



  #
  # Valida os argumentos passados
  mse_exec_validate mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomMessageType]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default" &> /dev/null

  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected=""

  mse_utest_assertEqual


  #
  # Evoca a função
  #
  # Verifica os valores realmente definidos
  # e que serão passados para a função do tema gerador da mensagem
  mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomMessageType]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default" &> /dev/null

  mseArgs["MessageType"]="Custom"
  local mseKey
  for mseKey in "${!mseArgs[@]}"; do
    testResult="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]}"
    testExpected="${mseArgs[$mseKey]}"

    mse_utest_assertEqual
  done


  # #
  # # Verifica se o output está configurado conforme se espera.
  mseArgs["MessageType"]="a"
  mseArgs["CustomMessageType"]=""
  mseArgs["TextTitle"]=""
  mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomMessageType]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default"
}
