#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário indicando um erro ocorrido em
# algum script.
#
# @param string $1
# Nome da função onde ocorreu o erro.
# Se não for definido, usará o valor padrão 'script'.
#
# @param string $2
# Mensagem resumida do erro.
# Aparecerá ao lado do nome da função, no título da mensagem de erro.
#
# @param string $3
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @param string $4
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
#   mseArrMSG+=("Houve uma falha inesperada.")
#
#   mse_inter_errorAlert "${FUNCNAME[0]}" "Falha" "mseArrMSG"
mse_inter_errorAlert() {
  if [ $# -ge 3 ]; then
    local mseTheme="${MSE_GLOBAL_THEME_FUNCTION}"
    local mseThemeAltMessage="mse_inter_theme_default_title_alt_1"

    if [ "$4" != "" ]; then
      mseTheme="$4"
      mseThemeAltMessage=""
    fi

    mse_inter_showMessage "e" "${mseThemeAltMessage}" "" "" "" "" "" "" "${1}::${2}" "" "" "" "" "" "" "" "" "" "" "$3" "" "" "" "${mseTheme}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="FunctionName :: r :: string :: script"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleMessage :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: functionName"
}






#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_errorAlert_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3


  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ExtraInformation :: o :: string"
}
