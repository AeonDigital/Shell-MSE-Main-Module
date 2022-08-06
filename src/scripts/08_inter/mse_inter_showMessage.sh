#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário no terminal.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
# Se "" ou inválido, será iniciado o array associativo
# "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" usando o tema padrão e este será usado para
# a formatação da mensagem.
#
#
# @param string $2
# Tipo de mensagem.
#
# [[ Mensagens de Alerta ]]
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
#
# [[ Mensagens de Prompt ]]
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
# @param string $3
# Formato da mensagem.
# Deve estar de acordo com um dos formatos fornecidos pelo tema que está sendo
# usado no momento. Em caso de um valor inválido, será usado o formato padrão
# indicado pelo próprio tema.
#
#
# @param string $4
# Título da mensagem.
#
#
# @param string $5
# Nome de um array unidimensional em que estão as linhas da mensagem.
#
#
# @param string $6
# Opcional.
# Nome de um array associativo trazendo configurações não previstas
# inicialmente. Usado para expandir temas.
#
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_showMessage() {
  local mseUseMetaAssoc="${1}"
  local mseRedefineTheme="0"

  local mseThemeCheckMetaFormat=""
  local mseThemeShowMessage=""


  local mseUseMetaType=""
  local mseUseMetaTheme=""
  local mseUseMetaFormat=""


  #
  # Verifica se o nome do array associativo passado é válido
  # Não sendo, seleciona o array global
  if [ "${mseUseMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUseMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
    mseUseMetaAssoc="MSE_GLOBAL_SHOW_MESSAGE_CONFIG"
  fi
  declare -n mseTmpInterArrShowMessage="${mseUseMetaAssoc}"


  #
  # Verifica a definição das informações básicas para inicialização de uma mensagem
  # - meta_type
  # - meta_theme
  # - meta_format
  local mseIsMetaType=$(mse_check_hasKeyInAssocArray "meta_type" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaType}" == "0" ]; then
    mseUseMetaType="none"
    mseRedefineTheme="1"
  else
    mseUseMetaType="${mseTmpInterArrShowMessage[meta_type]}"
  fi

  if [ $# -ge 2 ] && [ "${2}" != "" ] && [ "${2}" != "${mseUseMetaType}" ]; then
    mseUseMetaType="${2}"
    mseRedefineTheme="1"
  fi

  declare -a mseAllowedMetaTypes=("none" "info" "i" "attention" "a" "warning" "w" "error" "e" "fail" "f" "success" "s" "friendly" "fr" "ordinary" "or" "caution" "ca" "important" "im")
  if [[ ! "${mseAllowedMetaTypes[*]}" =~ "${mseUseMetaType}" ]]; then
    mseUseMetaType="none"
  fi



  local mseIsMetaTheme=$(mse_check_hasKeyInAssocArray "meta_theme" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaTheme}" == "0" ]; then
    mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
    mseRedefineTheme="1"
  else
    mseUseMetaTheme="${mseTmpInterArrShowMessage[meta_theme]}"
    if [ "${mseUseMetaTheme}" != "${MSE_GLOBAL_THEME_NAME}" ] && ([ "$(type -t "${mseUseMetaTheme}_prepareShowMessage")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_showMessage_checkMetaFormat")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_showMessage")" != "function" ]); then
      mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
      mseRedefineTheme="1"
    fi
  fi


  mseThemeCheckMetaFormat="${mseUseMetaTheme}_showMessage_checkMetaFormat"
  mseThemeShowMessage="${mseUseMetaTheme}_showMessage"



  local mseIsMetaFormat=$(mse_check_hasKeyInAssocArray "meta_format" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaFormat}" == "0" ]; then
    mseUseMetaFormat=$($mseThemeCheckMetaFormat "-")
    mseRedefineTheme="1"
  else
    mseUseMetaFormat="${mseTmpInterArrShowMessage[meta_format]}"
  fi

  if [ $# -ge 3 ] && [ "${3}" != "" ] && [ "${3}" != "${mseUseMetaFormat}" ]; then
    mseUseMetaFormat=$($mseThemeCheckMetaFormat "${3}")
    mseRedefineTheme="1"
  fi



  #
  # Redefine as configurações segundo o tema caso necessário
  if [ "${mseRedefineTheme}" == "1" ]; then
    mse_inter_prepareMessage "${mseUseMetaAssoc}" "${mseUseMetaType}" "${mseUseMetaTheme}" "${mseUseMetaFormat}"
  fi


  #
  # Redefine o título da mensagem
  mseTmpInterArrShowMessage["title_string"]="${4}"

  #
  # Redefine o corpo da mensagem
  mseTmpInterArrShowMessage["body_lines"]="${5}"


  #
  # Efetivamente cria a mensagem usando o tema definido
  ${mseThemeShowMessage} ${mseUseMetaAssoc} "${6}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=6
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, attention, warning, error, fail, success, friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MetaFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="TitleString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="BodyLines :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="ExtraConfigAssocArrayName :: o :: assocName"
}
