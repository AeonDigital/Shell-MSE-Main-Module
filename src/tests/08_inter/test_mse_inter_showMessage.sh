#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showMessage() {
  mse_inter_showMessage
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 25 arguments."

  mse_utest_assertEqual


  mse_inter_showMessage "a1" "a2"
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 23 arguments."

  mse_utest_assertEqual





  declare -A mseArgs
  mseArgs["MessageType"]="a"
  mseArgs["CustomSpecification"]="UTEST"

  mseArgs["DisplayTitle"]="1"
  mseArgs["TitleType"]="1"
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
  mse_exec_validate mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default" &> /dev/null

  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected=""

  mse_utest_assertEqual


  #
  # Evoca a função
  #
  # Verifica os valores realmente definidos
  # e que serão passados para a função do tema gerador da mensagem
  mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default" &> /dev/null

  mseArgs["MessageType"]="attention"
  local mseKey
  for mseKey in "${!mseArgs[@]}"; do
    testResult="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]}"
    testExpected="${mseArgs[$mseKey]}"

    mse_utest_assertEqual
  done



  # #
  # # Verifica se o output está configurado conforme se espera.
  # mseArgs["MessageType"]="a"
  # mseArgs["CustomSpecification"]=""
  # mseArgs["TextTitle"]=""
  # mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default"

  # #
  # # Testa o tipo de título 2
  # mseArgs["TitleType"]="2"
  # mseArgs["TextTitle"]="FN::Message"
  # mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default"

  # #
  # # Testa o tipo de título 3 e a sobrescrita de uma mensagem do tipo 'CHECK'
  # mseArgs["MessageType"]="f"
  # mseArgs["TitleType"]="3"
  # mseArgs["TextTitle"]="X::Tudo errado!"
  # mseArgs["CustomSpecification"]="CHECK"
  # mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default"
  # printf "\r"
  # mseArgs["MessageType"]="s"
  # mseArgs["TitleType"]="3"
  # mseArgs["TextTitle"]="V::Tudo certo!"
  # mseArgs["CustomSpecification"]="CHECK"
  # mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[CustomSpecification]}" "${mseArgs[DisplayTitle]}" "${mseArgs[TitleType]}" "${mseArgs[TopSeparatorTitle]}" "${mseArgs[TopSeparatorTitleColor]}" "${mseArgs[IndentTitle]}" "${mseArgs[BulletTitle]}" "${mseArgs[BulletTitleColor]}" "${mseArgs[TextTitle]}" "${mseArgs[TextTitleColor]}" "${mseArgs[BottomSeparatorTitle]}" "${mseArgs[BottomSeparatorTitleColor]}" "${mseArgs[DisplayBodyMessage]}" "${mseArgs[IndentBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLine]}" "${mseArgs[BulletBodyMessageFirstLineColor]}" "${mseArgs[IndentBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLines]}" "${mseArgs[BulletBodyMessageAnotherLinesColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[SeparatorBodyMessage]}" "${mseArgs[SeparatorBodyMessageColor]}" "mse_inter_theme_default"
}
