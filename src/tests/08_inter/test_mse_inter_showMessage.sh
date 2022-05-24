#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_inter_showMessage() {
  mse_inter_showMessage
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 31 arguments."

  mse_utest_assertEqual


  mse_inter_showMessage "a1" "a2"
  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected="Lost 29 arguments."

  mse_utest_assertEqual





  declare -A mseArgs
  mseArgs["MessageType"]="a"
  mseArgs["MessageFormat"]="UTEST"

  #
  # Bloco 01: Separador superior da mensagem
  mseArgs["MessageTopSeparator"]="\n#### #### MESSAGE TOP SEPARATOR #### #### #### #### #### #### #### #### \n"
  mseArgs["MessageTopSeparatorColor"]="1"



  #
  # Bloco 02: Título
  mseArgs["TitleDisplay"]="1"
  mseArgs["TitleType"]="1"

  mseArgs["TitleTopSeparator"]="\n==== ==== TITLE TOP SEPARATOR ==== ==== ==== ==== ==== ==== ==== ==== \n"
  mseArgs["TitleTopSeparatorColor"]="1"

  mseArgs["TitleIndent"]="  "
  mseArgs["TitleBullet"]=":: "
  mseArgs["TitleBulletColor"]="1"

  mseArgs["TitleText"]="Test Message Title"
  mseArgs["TitleTextColor"]="1"

  mseArgs["TitleBottomSeparator"]="\n---- ---- TITLE BOTTOM SEPARATOR ---- ---- ---- ---- ---- ---- ---- ---- \n"
  mseArgs["TitleBottomSeparatorColor"]="1"



  #
  # Bloco 03: Corpo da mensagem
  mseArgs["BodyMessageDisplay"]="1"

  mseArgs["BodyMessageTopSeparator"]="\n---- ---- BODY MESSAGE TOP SEPARATOR ---- ---- ---- ---- ---- ---- ---- ---- \n"
  mseArgs["BodyMessageTopSeparatorColor"]="1"

  mseArgs["BodyMessageFirstLineIndent"]="  "
  mseArgs["BodyMessageFirstLineBullet"]="- "
  mseArgs["BodyMessageFirstLineBulletColor"]="1"

  mseArgs["BodyMessageAnotherLinesIndent"]="  "
  mseArgs["BodyMessageAnotherLinesBullet"]=": "
  mseArgs["BodyMessageAnotherLinesBulletColor"]="1"

  mseArgs["BodyMessageArrayName"]="arrMsg"
  mseArgs["BodyMessageArrayNameColor"]="1"

  mseArgs["BodyMessageBottomSeparator"]="\n==== ==== BODY MESSAGE BOTTOM SEPARATOR ==== ==== ==== ==== ==== ==== ==== ==== \n"
  mseArgs["BodyMessageBottomSeparatorColor"]="1"



  #
  # Bloco 04: Separador inferior da mensagem
  mseArgs["MessageBottomSeparator"]="#### #### BOTTOM SEPARATOR #### #### #### #### #### #### #### #### "
  mseArgs["MessageBottomSeparatorColor"]="1"



  declare -a arrMsg
  arrMsg+=("First Line")
  arrMsg+=("Second Line")


  #
  # Valida os argumentos passados
  mse_exec_validate mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default" &> /dev/null

  testResult="${MSE_GLOBAL_LASTERR}"
  testExpected=""

  mse_utest_assertEqual


  #
  # Evoca a função
  #
  # Verifica os valores realmente definidos
  # e que serão passados para a função do tema gerador da mensagem
  mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default" &> /dev/null

  mseArgs["MessageType"]="attention"
  local mseKey
  for mseKey in "${!mseArgs[@]}"; do
    testResult="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]}"
    testExpected="${mseArgs[$mseKey]}"

    mse_utest_assertEqual
  done


  local mseTestInShell="1"
  if [ "${mseTestInShell}" == "1" ]; then
    #
    # Verifica se o output está configurado conforme se espera.
    mseArgs["MessageType"]="a"
    mseArgs["MessageFormat"]=""
    mseArgs["TitleText"]=""
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"

    #
    # Testa o tipo de título 2
    mseArgs["TitleType"]="2"
    mseArgs["TitleText"]="FN::Message Ttl 02"
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"

    #
    # Testa o tipo de título 3
    mseArgs["TitleType"]="3"
    mseArgs["TitleText"]="FN::Message Ttl 03"
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"


    #
    # Testa o tipo de título 3 e a sobrescrita de uma mensagem do tipo 'SHOWSTATUS'
    mseArgs["MessageType"]="f"
    mseArgs["TitleText"]="X::Tudo errado!"
    mseArgs["MessageFormat"]="SHOWSTATUS"
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"

    mse_inter_clearLine "" "1"

    mseArgs["MessageType"]="s"
    mseArgs["TitleText"]="V::Tudo certo!"
    mseArgs["MessageFormat"]="SHOWSTATUS"
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"

    printf "\n"

    #
    # Testa o formato 'TITLE'
    mseArgs["MessageType"]="s"
    mseArgs["TitleText"]="Tudo certo... prossiga"
    mseArgs["MessageFormat"]="TITLE"
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "${mseArgs[MessageTopSeparator]}" "${mseArgs[MessageTopSeparatorColor]}" "${mseArgs[TitleDisplay]}" "${mseArgs[TitleType]}" "${mseArgs[TitleTopSeparator]}" "${mseArgs[TitleTopSeparatorColor]}" "${mseArgs[TitleIndent]}" "${mseArgs[TitleBullet]}" "${mseArgs[TitleBulletColor]}" "${mseArgs[TitleText]}" "${mseArgs[TitleTextColor]}" "${mseArgs[TitleBottomSeparator]}" "${mseArgs[TitleBottomSeparatorColor]}" "${mseArgs[BodyMessageDisplay]}" "${mseArgs[BodyMessageTopSeparator]}" "${mseArgs[BodyMessageTopSeparatorColor]}" "${mseArgs[BodyMessageFirstLineIndent]}" "${mseArgs[BodyMessageFirstLineBullet]}" "${mseArgs[BodyMessageFirstLineBulletColor]}" "${mseArgs[BodyMessageAnotherLinesIndent]}" "${mseArgs[BodyMessageAnotherLinesBullet]}" "${mseArgs[BodyMessageAnotherLinesBulletColor]}" "${mseArgs[BodyMessageArrayName]}" "${mseArgs[BodyMessageArrayNameColor]}" "${mseArgs[BodyMessageBottomSeparator]}" "${mseArgs[BodyMessageBottomSeparatorColor]}" "${mseArgs[MessageBottomSeparator]}" "${mseArgs[MessageBottomSeparatorColor]}" "mse_inter_theme_default"
  fi
}
