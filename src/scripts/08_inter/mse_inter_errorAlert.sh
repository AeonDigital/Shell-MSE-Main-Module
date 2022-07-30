#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário indicando um erro ocorrido em
# algum script.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# Para configurar este array associativo use a função "mse_inter_prepareMessage".
#
#
# @param string $2
# Nome da função onde ocorreu o erro ou um código que identifique o erro
# ocorrido. Se não for definido, usará o valor padrão 'script'.
#
#
# @param string $3
# Título da mensagem ou mensagem resumida do erro.
# Se não for definido, usará a legenda padrão para mensagens do tipo 'error'.
#
#
# @param string $4
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
# Use " " para remover totalmente a referencia ao array atualmente definido.
#
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_errorAlert() {
  if [ "$#" -ge 4 ]; then
    declare -n mseTmpArrErrorAlert="${1}"
    local mseUseFormat="default"
    local mseUseTitleString="${3}"

    if [ "${2}" != "" ]; then
      mseUseTitleString="${2}::${3}"
    fi

    mseTmpArrAlertUser["meta_type"]="3"
    mse_inter_alertUser "${1}" "error" "${mseUseFormat}" "${mseUseTitleString}" "${4}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_errorAlert_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyLines :: r :: arrayName"
}
