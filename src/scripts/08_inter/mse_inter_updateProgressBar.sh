#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza a barra de progresso na linha do prompt (iniciada pelo comando
# "mse_inter_ShowProgressBar".
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
# Se "" ou inválido, será iniciado o array associativo
# "MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG" usando o tema padrão e este será usado
# para a formatação da barra.
#
# @param int $2
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# @param string $3
# Opcional.
# Informação que deve ser usada para preencher a área informativa.
#
# @return
# Printa na tela a barra de progresso conforme configuração passada.
mse_inter_updateProgressBar() {
  if [ $# -ge 2 ]; then
    declare -n mseTmpInterArrUpdateProgressBar="${1}"

    local mseUpdateMetaFormat="${mseTmpInterArrUpdateProgressBar[meta_format]}"
    local mseUpdateMaxCharLength="${mseTmpInterArrUpdateProgressBar[bar_max_char_length]}"
    local mseUpdateInfoAlign="${mseTmpInterArrUpdateProgressBar[info_align]}"
    local mseUpdateInfoData="${mseTmpInterArrUpdateProgressBar[info_data]}"

    if [ $# -ge 3 ]; then
      mseUpdateInfoData="${3}"
    fi

    mse_inter_showProgressBar "${1}" "${mseUpdateMetaFormat}" "${mseUpdateMaxCharLength}" "${2}" "${mseUpdateInfoAlign}" "${mseUpdateInfoData}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_updateProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="BarAtualProgress :: r :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="InfoData :: o :: string"
}
