#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_update_progressBar() {
  if [ $# -ge 2 ]; then
    declare -n mseTmpInterArrUpdateProgressBar="${1}"

    local mseUpdateMetaFormat="${mseTmpInterArrUpdateProgressBar[meta_format]}"
    local mseUpdateMaxCharLength="${mseTmpInterArrUpdateProgressBar[bar_max_char_length]}"
    local mseUpdateInfoAlign="${mseTmpInterArrUpdateProgressBar[info_align]}"
    local mseUpdateInfoData="${mseTmpInterArrUpdateProgressBar[info_data]}"

    if [ $# -ge 3 ]; then
      mseUpdateInfoData="${3}"
    fi

    mse_interface_show_progressBar "${1}" "${mseUpdateMetaFormat}" "${mseUpdateMaxCharLength}" "${2}" "${mseUpdateInfoAlign}" "${mseUpdateInfoData}"
  fi
}