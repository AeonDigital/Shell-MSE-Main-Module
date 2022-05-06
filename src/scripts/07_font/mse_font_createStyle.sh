#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Cria um código de estilo de cores para textos em conformidade com os
# parametros informados.
#
# @param string $1
# Cor da fonte.
#
# @param string $2
# Cor do fundo.
#
# @param string $3
# Opcional.
# Atributo a ser usado.
#
# @param bool $4
# Opcional.
# Se definido como '1', retornará o código da cor como uma string.
#
# @return
# Printa o código do estilo criado.
#
# @example
#   result=$(mse_exec_ifValidate mse_font_createStyle 'DGREY' 'LBLUE')
#   printf "${result}Formatado conforme eu queria"
mse_font_createStyle() {
  local mseForeGroundColor
  local mseBackGroundColor
  local mseFontAttribute

  local i
  local mseLength
  local mseUParam


  #
  # Resgata o código da cor da fonte a ser usada
  mseUParam="$1"
  mseForeGroundColor=""
  mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
  for (( i=0; i<mseLength; i++)); do
    if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
      mseForeGroundColor=${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}
    fi
  done


  #
  # Resgata o código da cor de fundo a ser usada
  mseUParam="$2"
  mseBackGroundColor=""
  mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
  for (( i=0; i<mseLength; i++)); do
    if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
      mseBackGroundColor=${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}
    fi
  done


  #
  # Resgata o código do tipo de atributo a ser definido
  mseFontAttribute=0
  if [ $# -ge 3 ]; then
    mseUParam="$3"
    mseFontAttribute="0"
    mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
    for (( i=0; i<mseLength; i++)); do
      if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
        mseFontAttribute=${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}
      fi
    done
  fi


  if [ $# == 4 ] && [ $4 == 1 ]; then
    printf '%s' '\\e['"${mseFontAttribute}"';'"${mseForeGroundColor}"';'"${mseBackGroundColor}"'m'
  else
    printf '%s' '\e['"${mseFontAttribute}"';'"${mseForeGroundColor}"';'"${mseBackGroundColor}"'m'
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_createStyle_vldtr() {
  local mseAvailableColors
  local mseAvailableAttributes
  mseAvailableColors=$(mse_str_join ", ", MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES)
  mseAvailableAttributes=$(mse_str_join ", ", MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES)


  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ForeGroundColor :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="${mseAvailableColors}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="${mseAvailableColors}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="BackGroundColor :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="${mseAvailableColors}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="${mseAvailableColors}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="FontAttribute :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_labels"]="${mseAvailableAttributes}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_values"]="${mseAvailableAttributes}"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ReturnLikeString :: o :: bool :: 0"
}
