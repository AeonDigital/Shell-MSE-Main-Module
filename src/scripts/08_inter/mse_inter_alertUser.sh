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
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @param string $3
# Nome da função/tema usada para renderizar as mensagens a serem mostradas
# na tela. Se nenhuma for indicada, usará o tema padrão
# "mse_inter_theme_default".
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
#
# @example
#   declare -a mseArrMSG
#   mseArrMSG+=("Sucesso!")
#   mseArrMSG+=("Todos os scripts foram atualizados")
#
#   mse_inter_alertUser "s" "mseArrMSG"
mse_inter_alertUser() {
  if [ $# -ge 2 ]; then
    local mseTheme="mse_inter_theme_default"

    if [ "$3" != "" ]; then
      mseTheme="$3"
    fi
    mse_inter_showMessage "$1" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "$2" "" "" "" "${mseTheme}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="Theme :: o :: functionName :: mse_inter_theme_default"
}
