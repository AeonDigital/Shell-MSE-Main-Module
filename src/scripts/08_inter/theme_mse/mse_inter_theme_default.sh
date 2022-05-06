#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Renderiza uma mensagem a ser mostrada para o usuário.
#
# @param string $1
# Nome de um array em que estão as informações que devem ser mostradas para o
# usuário.
#
# @param string $2
# Tipo de mensagem.
# Permite indicar exatamente que tipo de mensagem está sendo mostrada.
#
#   - none      | n   : Não definido.
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param char $3
# Use "0" ou "" para não usar cores.
# Use "1" para usar as cores do tema selecionado no título e na mensagem.
# Use "2" para usar as cores do tema selecionado apenas no título.
#
# @return
# Se o processamento for bem sucedido:
#   - Printa na tela as informações desejadas conforme configuração passada.
#   - Return 0
# Ocorrendo alguma falha no processamento:
#   - Printa na tela a mensagem de erro ocorrido
#   - Return 1
mse_inter_theme_default() {
  local mseMessage
  declare -n mseMessageArrayName="$1"
  local mseMessageType="$2"
  local mseThemeColorsType="$3"



  local mseColorInfo=""
  local mseColorAttention=""
  local mseColorWarning=""
  local mseColorError=""
  local mseColorFail=""
  local mseColorSuccess=""
  local mseMessageColor=""
  if [ "$mseThemeColorsType" != 0 ]; then
    mseColorInfo=$(mse_font_createStyle "DGREY" "NONE" "BOLD")
    mseColorAttention=$(mse_font_createStyle "LBLUE" "NONE" "BOLD")
    mseColorWarning=$(mse_font_createStyle "LYELLOW" "NONE" "BOLD")
    mseColorError=$(mse_font_createStyle "RED" "NONE" "BOLD")
    mseColorFail=$(mse_font_createStyle "LRED" "NONE" "BOLD")
    mseColorSuccess=$(mse_font_createStyle "GREEN" "NONE" "BOLD")
    mseMessageColor=$(mse_font_createStyle "DGREY" "NONE" "NONE")
  fi



  #
  # Monta o header
  mseMessage=""
  if [ "$mseMessageType" != "none" ]; then
    local mseMessageHeaderIndent="  "
    local mseMessageHeaderBullet="${mseMessageColor}.: ${mseNONE}"
    local mseMessageHeaderSpace="\n"

    mseMessage="${mseMessageHeaderIndent}"
    case "$mseMessageType" in
      info | i)
        mseMessage+="${mseMessageHeaderBullet}${mseColorInfo}${lbl_inter_alert_header_info}${mseNONE}${mseMessageHeaderSpace}"
      ;;
      attention | a)
        mseMessage+="${mseMessageHeaderBullet}${mseColorAttention}${lbl_inter_alert_header_attention}${mseNONE}${mseMessageHeaderSpace}"
      ;;
      warning | w)
        mseMessage+="${mseMessageHeaderBullet}${mseColorWarning}${lbl_inter_alert_header_warning}${mseNONE}${mseMessageHeaderSpace}"
      ;;
      error | e)
        mseMessage+="${mseMessageHeaderBullet}${mseColorError}${lbl_inter_alert_header_error}${mseNONE}${mseMessageHeaderSpace}"
      ;;
      fail | f)
        mseMessage+="${mseMessageHeaderBullet}${mseColorFail}${lbl_inter_alert_header_fail}${mseNONE}${mseMessageHeaderSpace}"
      ;;
      success | s)
        mseMessage+="${mseMessageHeaderBullet}${mseColorSuccess}${lbl_inter_alert_header_success}${mseNONE}${mseMessageHeaderSpace}"
      ;;
    esac
  fi



  #
  # Monta a mensagem linha a linha
  local mseMsgLine
  local mseMessageBodyIndent

  if [ "$mseMessageType" == "none" ]; then
    mseMessageBodyIndent=""
  else
    mseMessageBodyIndent="     "
  fi

  for mseMsgLine in "${mseMessageArrayName[@]}"; do
    case "$mseThemeColorsType" in
      "0" | "2")
        mseMessage+="${mseMessageBodyIndent}${mseMsgLine}\n"
      ;;
      "1")
        mseMessage+="${mseMessageBodyIndent}${mseMessageColor}${mseMsgLine}${mseNONE}\n"
      ;;
    esac
  done

  printf "%s" "${mseMessage}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_theme_default_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="AlertType :: r :: list :: i"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="UseColors :: r :: bool :: 1"
}
