#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_show_message() {
  local mseUseMetaAssoc="${1}"
  local mseRedefineTheme="0"

  local mseUseMetaType=""
  local mseUseMetaTheme=""
  local mseUseMetaFormat=""



  if [ "${mseUseMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUseMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
    mseUseMetaAssoc="MSE_MESSAGE_THEME_CONFIG"
  fi
  declare -n mseTmpInterArrShowMessage="${mseUseMetaAssoc}"



  local mseIsMetaType=$(mse_array_has_key "meta_type" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaType}" == "0" ]; then
    mseUseMetaType="n"
    mseRedefineTheme="1"
  else
    mseUseMetaType="${mseTmpInterArrShowMessage[meta_type]}"
  fi



  if [ $# -ge 2 ] && [ "${2}" != "" ] && [ "${2}" != "${mseUseMetaType}" ]; then
    mseUseMetaType="${2}"
    mseRedefineTheme="1"
  fi


  declare -a mseAllowedMetaTypes=("n" "i" "a" "w" "e" "f" "s" "fr" "or" "ca" "im")
  if [[ ! "${mseAllowedMetaTypes[*]}" =~ "${mseUseMetaType}" ]]; then
    mseUseMetaType="n"
  fi



  local mseIsMetaTheme=$(mse_array_has_key "meta_theme" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaTheme}" == "0" ]; then
    mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
    mseRedefineTheme="1"
  else
    mseUseMetaTheme="${mseTmpInterArrShowMessage[meta_theme]}"
    if [ "${mseUseMetaTheme}" != "${MSE_GLOBAL_THEME_NAME}" ] && ([ "$(type -t "${mseUseMetaTheme}_message_prepare")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_message_check_format")" != "function" ] || [ "$(type -t "${mseUseMetaTheme}_message_show")" != "function" ]); then
      mseUseMetaTheme="${MSE_GLOBAL_THEME_NAME}"
      mseRedefineTheme="1"
    fi
  fi


  local mseThemeCheckFormat="${mseUseMetaTheme}_message_check_format"
  local mseThemeMessageShow="${mseUseMetaTheme}_message_show"



  local mseIsMetaFormat=$(mse_array_has_key "meta_format" "${mseUseMetaAssoc}")
  if [ "${mseIsMetaFormat}" == "0" ]; then
    mseUseMetaFormat=$(${mseThemeCheckFormat} "-")
    mseRedefineTheme="1"
  else
    mseUseMetaFormat="${mseTmpInterArrShowMessage[meta_format]}"
  fi

  if [ $# -ge 3 ] && [ "${3}" != "" ] && [ "${3}" != "${mseUseMetaFormat}" ]; then
    mseUseMetaFormat=$($mseThemeCheckFormat "${3}")
    mseRedefineTheme="1"
  fi



  if [ "${mseRedefineTheme}" == "1" ]; then
    mse_interface_prepare_message "${mseUseMetaAssoc}" "${mseUseMetaType}" "${mseUseMetaTheme}" "${mseUseMetaFormat}"
  fi


  mseTmpInterArrShowMessage["title_string"]="${4}"
  mseTmpInterArrShowMessage["body_lines"]="${5}"
  ${mseThemeMessageShow} ${mseUseMetaAssoc} "${6}"
}
