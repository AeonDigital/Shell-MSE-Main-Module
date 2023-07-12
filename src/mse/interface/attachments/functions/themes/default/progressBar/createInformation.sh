#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Monta o componente "informações" conforme as configurações definidas.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_interface_theme_default_showProgressBar_createInformation() {
  declare -n mseTmpThemeArrProgressBarInformation="${1}"

  if [ "${mseTmpThemeArrProgressBarInformation[info_show]}" == "1" ]; then

    local mseInfoIniString="${mseTmpThemeArrProgressBarInformation[info_ini_string]}"
    local mseInfoEndString="${mseTmpThemeArrProgressBarInformation[info_end_string]}"

    local mseInfoUsePercent="${mseTmpThemeArrProgressBarInformation[info_use_percent]}"
    local mseInfoData="${mseTmpThemeArrProgressBarInformation[info_data]}"

    local mseInfoColor="${mseTmpThemeArrProgressBarInformation[info_color]}"
    local mseInfoColorAlt="${mseTmpThemeArrProgressBarInformation[info_color_alt]}"
    local mseInfoColorize="${mseTmpThemeArrProgressBarInformation[info_colorize]}"


    local mseUseColor=""
    local mseUseColorAlt=""
    if [ "${mseInfoColorize}" == "1" ]; then
      mseUseColor="${mseInfoColor}"
      mseUseColorAlt="${mseInfoColorAlt}"
    fi



    local mseStrPercent=""
    if [ "${mseInfoUsePercent}" == "1" ]; then

      local mseBarAtualProgress="${mseTmpThemeArrProgressBarInformation[bar_atual_progress]}"
      if [ "${mseBarAtualProgress}" -lt "10" ]; then
        mseStrPercent+="  "
      elif [ "${mseBarAtualProgress}" -lt "100" ]; then
        mseStrPercent+=" "
      fi
      mseStrPercent+="${mseBarAtualProgress}%"
    fi



    #
    # Printa o início do delimitador
    printf "%s" "${mseInfoIniString}"

    #
    # Inicia a informação em si
    printf "${mseUseColor}"
    printf "%s" "${mseStrPercent}"
    printf "${mseNONE}"

    if [ "${mseInfoData}" != "" ]; then
      if [ "${mseStrPercent}" != "" ]; then
        printf " "
      fi
      printf "${mseUseColorAlt}"
      printf "%s" "${mseInfoData}"
      printf "${mseNONE}"
    fi

    #
    # Printa o fim do delimitador
    printf "${mseInfoEndString}"
  fi
}