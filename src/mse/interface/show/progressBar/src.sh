#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_show_progressBar() {
  if [ $# -ge 4 ]; then
    local mseCheck=""

    local mseUseMetaAssoc="${1}"
    local mseUseMetaFormat="${2}"
    local mseUseMaxCharLength="${3}"
    local mseUseAtualProgress="${4}"
    local mseUseInfoAlign="${5}"
    local mseUseInfoData="${6}"
    local mseRedefineTheme="0"

    local mseThemeCheckMetaFormat=""
    local mseThemeShowProgressBar=""


    local mseUseMetaTheme=""
    local mseUseMetaFormat=""



    if [ "${mseUseMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUseMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
      mseUseMetaAssoc="MSE_PROGRESSBAR_THEME_CONFIG"
    fi

    declare -n mseTmpInterArrShowProgressBar="${mseUseMetaAssoc}"



    local mseIsMetaTheme=$(mse_array_has_key "meta_theme" "${mseUseMetaAssoc}")
    if [ "${mseIsMetaTheme}" == "0" ]; then
      mseUseMetaTheme="${MSE_MESSAGE_THEME_NAME}"
      mseRedefineTheme="1"
    else
      mseUseMetaTheme="${mseTmpInterArrShowProgressBar[meta_theme]}"
      if [ "${mseUseMetaTheme}" != "${MSE_MESSAGE_THEME_NAME}" ] && ([ "$(type -t "${mseUseMetaTheme}_progressBar_prepare")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_progressBar_check_format")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_progressBar_show")" != "function" ]); then
        mseUseMetaTheme="${MSE_MESSAGE_THEME_NAME}"
        mseRedefineTheme="1"
      fi
    fi


    mseThemeCheckMetaFormat="${mseUseMetaTheme}_progressBar_check_format"
    mseThemeShowProgressBar="${mseUseMetaTheme}_progressBar_show"


    local mseIsMetaFormat=$(mse_array_has_key "meta_format" "${mseUseMetaAssoc}")
    if [ "${mseIsMetaFormat}" == "0" ]; then
      mseUseMetaFormat=$($mseThemeCheckMetaFormat "-")
      mseRedefineTheme="1"
    else
      mseUseMetaFormat="${mseTmpInterArrShowProgressBar[meta_format]}"
    fi

    if [ "${2}" != "" ] && [ "${2}" != "${mseUseMetaFormat}" ]; then
      mseUseMetaFormat=$($mseThemeCheckMetaFormat "${2}")
      mseRedefineTheme="1"
    fi





    if [ "${mseRedefineTheme}" == "1" ]; then
      mse_prepare_interface_progressBar "${mseUseMetaAssoc}" "${mseUseMetaTheme}" "${mseUseMetaFormat}"
    fi




    mseCheck=$(mse_is_integer "$mseUseMaxCharLength")
    if [ "${mseCheck}" == "0" ]; then
      mseUseMaxCharLength="50"
    elif [ "${mseUseMaxCharLength}" -lt "20" ]; then
      mseUseMaxCharLength="20"
    elif [ "${mseUseMaxCharLength}" -gt "${COLUMNS}" ]; then
      mseUseMaxCharLength="${COLUMNS}"
    fi
    mseTmpInterArrShowProgressBar[bar_max_char_length]="${mseUseMaxCharLength}"


    mseCheck=$(mse_is_integer "$mseUseAtualProgress")
    if [ "${mseCheck}" == "0" ] || [ "${mseUseAtualProgress}" -lt "0" ]; then
      mseUseAtualProgress="0"
    elif [ "${mseUseAtualProgress}" -gt "100" ]; then
      mseUseAtualProgress="100"
    fi
    mseTmpInterArrShowProgressBar[bar_atual_progress]="${mseUseAtualProgress}"



    mseTmpInterArrShowProgressBar[info_align]="right"
    mseTmpInterArrShowProgressBar[info_data]=""
    if [ "${mseTmpInterArrShowProgressBar[info_show]}" == "1" ]; then
      if [ "${mseUseInfoAlign}" != "l" ] && [ "${mseUseInfoAlign}" != "left" ] && [ "${mseUseInfoAlign}" != "r" ] && [ "${mseUseInfoAlign}" != "right" ]; then
        mseUseInfoAlign="right"
      else
        if [ "${mseUseInfoAlign}" == "l" ]; then
          mseUseInfoAlign="left"
        elif [ "${mseUseInfoAlign}" == "r" ]; then
          mseUseInfoAlign="right"
        fi
      fi

      mseTmpInterArrShowProgressBar[info_align]="${mseUseInfoAlign}"
      mseTmpInterArrShowProgressBar[info_data]="${mseUseInfoData}"
    fi



    ${mseThemeShowProgressBar} ${mseUseMetaAssoc}
  fi
}
