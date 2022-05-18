#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário.
#
# @param string $1
# Tipo de mensagem.
#
#   - ""        | ""  : Não definido (valor padrão).
#   - none      | n   : Não definido (mesmo que acima).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param string $2
# Opcional. Código da mensagem.
# Quando usado, alterna o tipo de título para o "3".
#
# @param string $3
# Opcional. Título da mensagem.
# Se não for usado, o título da mensagem será correspondente ao tipo da mesma.
#
# @param string $4
# Opcional. Nome de um array unidimensional em que estão as frases que devem
# ser usadas para montar o corpo da mensagem.
#
# @param string $5
# Opcional.
# Nome da função/tema usada para renderizar as mensagens a serem mostradas
# na tela. Se nenhuma for indicada, usará o tema padrão definido na
# variável global 'MSE_GLOBAL_THEME_FUNCTION'
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
#
# @example
#   declare -a mseArrMSG
#   mseArrMSG+=("Sucesso!")
#   mseArrMSG+=("Todos os scripts foram atualizados")
#
#   mse_inter_alertUser "i" "" "" "mseArrMSG"
mse_inter_alertUser() {
  if [ $# -ge 3 ]; then
    local mseMessageType="$1"
    local mseMessageCode="$2"
    local mseMessageTitle="$3"
    local mseMessageBodyArrayName="$4"
    mseEmptyArr=()


    #
    # Verifica de que forma o título deve ser mostrado
    local mseMessageTitleType="1"
    if [ "${mseMessageCode}" != "" ] && [ "${mseMessageTitle}" != "" ]; then
      mseMessageTitleType="3"
      mseMessageTitle="${mseMessageCode}::${mseMessageTitle}"
    fi


    #
    # Mostrará o corpo da mensagem caso existam informações no array indicado
    local mseCustomSpecification="FULL"
    if [ "${mseMessageBodyArrayName}" == "" ]; then
      mseCustomSpecification="TITLE"
    fi


    #
    # Identifica o tema a ser usado
    local mseTheme="${MSE_GLOBAL_THEME_FUNCTION}"
    if [ "$5" != "" ]; then
      mseTheme="$5"
    fi

    mse_inter_showMessage "${mseMessageType}" "${mseCustomSpecification}" "" "${mseMessageTitleType}" "" "" "" "" "" "${mseMessageTitle}" "" "" "" "" "" "" "" "" "" "" "${mseMessageBodyArrayName}" "" "" "" "${mseTheme}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MessageCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MessageTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="MessageBodyArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="Theme :: o :: functionName"
}
