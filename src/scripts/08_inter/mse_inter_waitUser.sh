#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário e interrompe a execução do script até
# que ele digite uma tecla qualquer.
#
# @param string $1
# Tom de mensagem de aguardo.
# Se não for definido usará o tipo "info"
#
#   Mensagens de Alerta
#
#   - ""        | ""  : Não definido.
#   - none      | n   : Não definido.
#   - info      | i   : Informação genérica (valor padrão).
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param string $2
# Código da mensagem.
# Se não for definido, usará o caracter "!".
#
# @param string $3
# Mensagem que indica para o usuário o motivo de estar aguardando.
#
# @param string $4
# Opcional.
# Nome do tema usado para renderizar a mensagem a ser mostrada na tela.
# Se nenhuma for indicada, usará o tema padrão definido na variável global
# 'MSE_GLOBAL_THEME_NAME'.
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_waitUser() {
  declare -A mseArgs
  mseArgs["MessageType"]="${1}"
  mseArgs["MessageFormat"]="SHOWSTATUS"
  mseArgs["TitleType"]="3"
  mseArgs["TitleCode"]="${2}"
  mseArgs["TitleText"]="${3}"
  mseArgs["BodyMessageArrayName"]=""


  #
  # Verifica o tom da mensagem de alerta
  if [ "${1}" == "" ]; then
    mseArgs["MessageType"]="i"
  fi

  #
  # Verifica o código do tom de alerta
  if [ "${2}" == "" ]; then
    mseArgs["TitleCode"]="!"
  fi

  #
  # Verifica a mensagem a ser exposta para o usuário
  if [ "${3}" == "" ]; then
    mseArgs["TitleText"]="${lbl_inter_wait_user_any_key}"
  fi

  #
  # Identifica o tema a ser usado
  local mseTheme="${MSE_GLOBAL_THEME_NAME}"
  if [ "${3}" != "" ]; then
    mseTheme="${3}"
  fi


  local mseWaitingMessage
  mseWaitingMessage=$(mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleCode]}::${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}")
  read -n 1 -s -r -p "${mseWaitingMessage}  "
  printf "\n"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_waitUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: string"
}
