#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles the "information" component according to the configured settings.
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the progress bar.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_progressBar_create_information() {
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




    echo -n "${mseInfoIniString}"


    echo -ne "${mseUseColor}"
    echo -n "${mseStrPercent}"
    echo -ne "${mseNONE}"

    if [ "${mseInfoData}" != "" ]; then
      if [ "${mseStrPercent}" != "" ]; then
        echo -n " "
      fi
      echo -ne "${mseUseColorAlt}"
      echo -n "${mseInfoData}"
      echo -ne "${mseNONE}"
    fi

    echo -ne "${mseInfoEndString}"
  fi
}