#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário indicando um erro ocorrido em
# algum script.
#
# @param string $1
# Opcional. Nome da função onde ocorreu o erro ou um código que identifique
# o erro ocorrido.
# Se não for definido, usará o valor padrão 'script'.
#
# @param string $2
# Opcional. Título da mensagem ou mensagem resumida do erro.
# Se não for definido, usará a legenda padrão para mensagens do tipo 'error'.
#
# @param string $3
# Opcional. Nome de um array unidimensional em que estão as frases que devem
# ser usadas para montar o corpo da mensagem.
#
# @param string $4
# Opcional.
# Nome do tema usado para renderizar a mensagem a ser mostrada na tela.
# Se nenhuma for indicada, usará o tema padrão definido na variável global
# 'MSE_GLOBAL_THEME_NAME'.
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
#
# @example
#   declare -a mseArrMSG=()
#   mseArrMSG+=("Houve uma falha inesperada")
#
#   mse_inter_errorAlert "${FUNCNAME[0]}" "Falha" "mseArrMSG"
mse_inter_errorAlert() {
  if [ "$#" -ge 2 ]; then
    declare -A mseArgs
    mseArgs["MessageType"]="e"
    mseArgs["MessageFormat"]="default"
    mseArgs["TitleType"]="3"
    mseArgs["TitleCode"]="${1}"
    mseArgs["TitleText"]="${2}"
    mseArgs["BodyMessageArrayName"]="${3}"


    #
    # Verifica o código a ser informado para este erro
    if [ "${1}" == "" ]; then
      mseArgs["TitleCode"]="script"
    fi

    #
    # Verifica a mensagem básica do título a ser usado para este erro
    if [ "${2}" == "" ]; then
      mseArgs["TitleText"]="${lbl_inter_alert_header_error}"
    fi

    mse_inter_alertUser "${mseArgs[MessageType]}" "${mseArgs[TitleCode]}" "${mseArgs[TitleText]}" "${mseArgs[BodyMessageArrayName]}" "${4}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_errorAlert_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: string"
}
