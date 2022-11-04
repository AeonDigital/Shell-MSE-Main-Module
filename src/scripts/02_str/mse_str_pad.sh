#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Preenche uma string com o caracter indicado.
#
# @param string $1
# String que será preenchida.
#
# @param char $2
# String que será usada para fazer o preenchimendo.
#
# @param int $3
# Total de caracteres que a string final deverá ter.
#
# @param string $4
# Indique "l" para preencher à esquerda.
# Indique "r" para preencher à direita.
#
# @return
# Adiciona na string original um total de caracteres $2 à esquerda
# ou direita (conforme $4) até que ela tenha o total de caracteres
# indicado em $3.
# Será retornada uma string vazia em caso de alguma falha.
#
# @example
#   mse_str_pad "32" "0" "5" "l"
#   "00032"
mse_str_pad() {
  local mseNStr=""
  local mseOStr="${1}"
  local msePadChar="${2}"
  local mseTotalLength="${3}"
  local msePadPosition="${4}"

  if [ "${msePadPosition}" == "left" ] || [ "${msePadPosition}" == "l" ]; then
    msePadPosition="l"
  elif [ "${msePadPosition}" == "right" ] || [ "${msePadPosition}" == "r" ]; then
    msePadPosition="r"
  else
    msePadPosition=""
  fi


  if [ "${#msePadChar}" == "1" ] && [ "${mseTotalLength}" -gt 0 ] && [ "${msePadPosition}" != "" ]; then
    mseNStr="${mseOStr}"

    if [ "${mseTotalLength}" -gt "${#mseNStr}" ]; then
      local mseStringLength="${#mseNStr}"
      local msePadLeft=0
      local msePadStr=""

      ((msePadLeft=mseTotalLength-mseStringLength))
      if [ "${msePadChar}" == " " ]; then
        msePadStr=$(printf "%-${msePadLeft}s")
      else
        msePadStr=$(eval printf "${msePadChar}%.0s" {1..${msePadLeft}})
      fi

      if [ "${msePadPosition}" == "l" ]; then
        mseNStr="${msePadStr}${mseNStr}"
      elif [ "${msePadPosition}" == "r" ]; then
        mseNStr="${mseNStr}${msePadStr}"
      fi
    fi
  fi

  printf "%s" "${mseNStr}"
}
MSE_GLOBAL_CMD["str pad"]="mse_str_pad"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_pad_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="PadChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TotalLength :: r :: int"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="PadPosition :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3_labels"]="left, right"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3_values"]="l, r"
}
