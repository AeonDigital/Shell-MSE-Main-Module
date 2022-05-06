#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário.
#
# @param string $1
# Nome de um array em que estão as informações que devem ser mostradas para o
# usuário.
#
# @param string $2
# Opcional. Tipo de mensagem.
# Permite indicar exatamente que tipo de mensagem está sendo mostrada.
#
#   - none      | n   : Não definido (valor padrão).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param char $3
# Opcional.
# Use "0" ou "" para não usar cores.
# Use "1" para usar as cores do tema selecionado no título e na mensagem.
# Use "2" para usar as cores do tema selecionado apenas no título.
# Se omitido, usará o valor padrão "1"
#
# @param string $4
# Opcional.
# Nome da função usada para renderizar as mensagens a serem mostradas na tela.
# 'theme' que será usada para printar as mensagens na tela.
#
# @return
# Printa na tela as informações desejadas como um alerta para o usuário.
# Em caso de erro, suprimirá qualquer saída e a mensagem de erro ficará
# registrada na variável global 'MSE_GLOBAL_LASTERR'.
#
# @example
#   declare -a mseArrMSG
#   mseArrMSG+=("Sucesso!")
#   mseArrMSG+=("Todos os scripts foram atualizados")
#
#   mse_mmod_alertUser "mseArrMSG" "s"
mse_inter_alertUser() {
  local mseMessage
  local mseMessageType
  local mseThemeFunctionName
  local mseThemeColorsType


  #
  # Identifica se deve ou não usar cores
  mseMessageType="none"
  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    mseMessageType="$2"
  fi


  #
  # Identifica se deve ou não usar cores
  mseThemeColorsType="1"
  if [ $# -ge 3 ]; then
    if [ "$3" == "" ] || [ "$3" == "0" ]; then
      mseThemeColorsType="0"
    elif [ "$3" == "2" ]; then
      mseThemeColorsType="2"
    fi
  fi


  #
  # Identifica o 'theme' a ser usado
  mseThemeFunctionName="mse_inter_theme_default"
  if [ $# -ge 4 ] && [ "$4" != "" ]; then
    mseThemeFunctionName="$4"
  fi


  #
  # Processa a mensagem e mostra na tela se o processamento for
  # bem sucedido, ou, guarda seu erro para ser consultado posteriormente.
  mseMessage=$($mseThemeFunctionName "$1" "$mseMessageType" "$mseThemeColorsType")

  if [ $? == 0 ]; then
    printf "${mseMessage}"
    return 0
  else
    MSE_GLOBAL_LASTERR="${mseMessage}"
    return 1
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="AlertType :: o :: list :: i"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="UseColors :: o :: char :: 1"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: functionName :: mse_inter_theme_default"
}
